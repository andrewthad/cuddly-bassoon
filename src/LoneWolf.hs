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
        | Goto Int
        deriving (Show, Eq)


flattenDecision :: Int -> Decision -> [ChapterOutcome]
flattenDecision cvariable d = case d of
        NoDecision o -> [o]
        Decisions lst -> do
            d' <- lst
            flattenDecision cvariable d'

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
    Fight fd nxt -> regroup $  do
      (charendurance, _) <- fight cvariable fd
      update charendurance nxt

memoState :: Memo.Memo (Int, Int)
memoState = Memo.pair Memo.bits Memo.bits


solveLW :: [(Int, Decision)] -> Int -> Solution
solveLW book cvariable = solve memoState step (1, cvariable)
  where
    step (cid, curvariable) = case lookup cid book of
                  Nothing -> return []
                  Just d -> update curvariable <$>  flattenDecision curvariable d

type Probably a = [(a, Rational)]
type Choice = [(Probably (Int, Int))]

data Solution = Node
    { _stt  :: (Int, Int)
    , _outcome :: Probably (Solution)
    }
    | LeafLost
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
            then error $ "Those are expected to be equal" ++ show (s', s)
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
        scoreTree  pstates = let ptrees = map (\(o, p) -> (go o, p)) pstates
                                     in Node stt ptrees
