{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE BangPatterns #-}

module Main where

import Data.Hashable
import Parallel
import qualified Data.HashMap.Strict as HM
import qualified Memo
import Control.DeepSeq

fight :: Int -> Int -> [Int]
fight i a = map fst $ fightVanillaM i a

fightVanillaM :: Int -> Int -> [(Int, Int)]
fightVanillaM = Memo.memo2 Memo.bits Memo.bits fightVanilla

fightVanilla :: Int -> Int -> [(Int, Int)]
fightVanilla php ohp
  | php <= 0 || ohp <= 0 = [(max 0 php, max 0 ohp)]
  | otherwise = regroup $ do
      (odmg, pdmg) <- [(9,3),(10,2),(11,2),(12,2),(14,1),(16,1),(18,0),(100,0),(100,0),(100,0)]
      fightVanillaM (php - pdmg) (ohp - odmg)

update :: Int -> Int -> [(Int, Int)]
update i outcome = (,) outcome <$> fight i outcome

memoState :: Memo.Memo (Int, Int)
memoState = Memo.pair Memo.bits Memo.bits

fibFight :: Int -> [Int]
fibFight 0 = []
fibFight 1 = []
fibFight x = [(x - 1), (x - 2)]


-----------------------------------------------------------------------------------
regroup :: (NFData a, Show a, Hashable a, Eq a, Ord a) => [(a, Int)] -> [(a, Int)]
regroup xs =
    let xs' = HM.toList $ HM.fromListWith (+) xs
        s' = sum (map snd xs')
        s  = sum (map snd xs)
     in if s' /= s
            then if show s' == show s
                    then error "WAT????"
                    else error $ "Those are expected to be equal" ++ show (s', s)
            else xs'
----------------------------------------------------------------------------------

main :: IO ()
main = rnf (go (50, 100)) `seq` return ()
    where
        go = memoState (rnf . parMap rdeepseq (map go) . step)
        step (cid, hp) = map (update hp) (fibFight cid)
