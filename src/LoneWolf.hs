{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE BangPatterns #-}

module LoneWolf where

import Data.Hashable
import Parallel
import qualified Data.HashMap.Strict as HM
import qualified Memo
import Control.DeepSeq

data ChapterOutcome
        = Fight Int ChapterOutcome
        | Goto Int
        deriving (Show, Eq)

fight :: Int -> Int -> [Int]
fight i a = map fst $ regroup $ do
      ((php, _), p) <- fightVanillaM i a
      return (php, p)

fightVanillaM :: Int -> Int -> Probably (Int, Int)
fightVanillaM = Memo.memo2 Memo.bits Memo.bits fightVanilla

fightVanilla :: Int -> Int -> Probably (Int, Int)
fightVanilla php ohp
  | php <= 0 || ohp <= 0 = certain (max 0 php, max 0 ohp)
  | otherwise = regroup $ do
      (odmg, pdmg) <- [(9,3),(10,2),(11,2),(12,2),(14,1),(16,1),(18,0),(100,0),(100,0),(100,0)]
      fightVanillaM (php - pdmg) (ohp - odmg)

update :: Int -> ChapterOutcome -> [(Int, Int)]
update i outcome =
  case outcome of
    Goto cid -> [(cid, i)]
    Fight fd nxt -> do
      hp <- fight i fd
      update hp nxt

memoState :: Memo.Memo (Int, Int)
memoState = Memo.pair Memo.bits Memo.bits

solveLW :: [(Int, [ChapterOutcome])] -> Int -> ()
solveLW book i = solve memoState step (1, i)
  where
    step (cid, hp) = case lookup cid book of
                  Nothing -> []
                  Just d -> map (update hp) d

type Probably a = [(a, Rational)]


certain :: a -> Probably a
certain a = [(a,1)]


-----------------------------------------------------------------------------------
regroup :: (NFData a, Show a, Hashable a, Eq a, Ord a) => Probably a -> Probably a
regroup xs =
    let xs' = HM.toList $ HM.fromListWith (+) xs
        !s' = sum (map snd xs')
        s  = sum (map snd xs)
     in if s' /= s
            then error $ "Those are expected to be equal" ++ show (s', s)
            else xs'
----------------------------------------------------------------------------------


solve :: Memo.Memo (Int, Int) -> ((Int, Int) -> [[(Int, Int)]]) -> (Int, Int) -> ()
solve memo getChoice = go
  where
    go = memo solve'
    solve' stt = rnf scored
      where
        scored = parMap rdeepseq (map go) (getChoice stt)
