{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE BangPatterns #-}
{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE TupleSections #-}
{-# LANGUAGE DeriveGeneric #-}

module LoneWolf
    
    where

import Data.Hashable
import Data.List
import Data.Ord (comparing)
import GHC.Generics
import Parallel
import qualified Data.HashMap.Strict as HM
import qualified Memo
import Control.DeepSeq

data Decision
   = Decisions [Decision]
   | NoDecision ChapterOutcome
   deriving (Show, Eq)


data ChapterOutcome
        = Fight Int ChapterOutcome
        | Conditionally [(ChapterOutcome)]
        | Goto Int
        deriving (Show, Eq)


flattenDecision :: Int -> Decision -> [([String], ChapterOutcome)]
flattenDecision cvariable d = case d of
        NoDecision o -> [([], o)]
        Decisions lst -> do
            d' <- lst
            (alldesc, o) <- flattenDecision cvariable d'
            return ( alldesc, o)

fight :: Int -> Int -> Probably Int
fight cvariable fdetails = regroup $ do
      ((php, _), p) <- fightVanillaM cvariable  fdetails
      return (max 0 php, p)

fightVanillaM :: Int -> Int -> Probably (Int, Int)
fightVanillaM = Memo.memo2 Memo.bits Memo.bits fightVanilla

fightVanilla :: Int -> Int -> Probably (Int, Int)
fightVanilla php ohp
  | php <= 0 || ohp <= 0 = certain (max 0 php, max 0 ohp)
  | otherwise = regroup $ do
      (odmg, pdmg) <- [(9,3),(10,2),(11,2),(12,2),(14,1),(16,1),(18,0),(100,0),(100,0),(100,0)]
      fightVanillaM (php - pdmg) (ohp - odmg)

update :: Int -> ChapterOutcome -> Probably (Int, Int)
update cvariable outcome =
  case outcome of
    Goto cid -> certain (cid, cvariable)
    Conditionally (o:_) -> update cvariable o
    Conditionally _ -> undefined
    Fight fd nxt -> regroup $  do
      (charendurance, _) <- fight cvariable fd
      update charendurance nxt

memoState :: Memo.Memo (Int, Int)
memoState = Memo.pair Memo.bits Memo.bits


solveLW :: [(Int, Decision)] -> Int -> Solution
solveLW book cvariable = solve memoState step (1, cvariable)
  where
    chapters = book
    step (cid, curvariable ) = case lookup cid chapters of
                  Nothing -> return ("", [])
                  Just d -> do
                      (desc, outcome) <- flattenDecision curvariable d
                      return (unwords desc, update curvariable outcome)
    step _ = [("", [])]



type Probably a = [(a, Rational)]
type Choice = [(String, Probably (Int, Int))]

data Solution = Node
    { _stt  :: (Int, Int)
    , _outcome :: Probably (Solution)
    }
    | LeafLost
    | LeafWin (Int, Int)
        deriving (Show, Eq, Generic)

instance NFData (Solution)

certain :: a -> Probably a
certain a = [(a,1)]

regroup :: (NFData a, Show a, Hashable a, Eq a, Ord a) => Probably a -> Probably a
regroup xs =
    let xs' = HM.toList $ HM.fromListWith (+) xs
        !s' = sum (map snd xs')
        s  = sum (map snd xs)
     in if s' /= s
            then error $ "very bad" ++ show ("s'" :: String, s', "s" :: String, s)
            else xs'

solve :: Memo.Memo (Int, Int)
       -> ((Int, Int) -> Choice)
       -> (Int, Int)
       -> Solution
solve memo getChoice = go
  where
    go = memo solve'
    solve' stt = rnf scored `seq` LeafLost
      where
        scored = parMap rdeepseq scoreTree (getChoice stt)
        scoreTree (_, pstates) = let ptrees = map (\(o, p) -> (go o, p)) pstates
                                     in Node stt ptrees
