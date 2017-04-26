{-# LANGUAGE RankNTypes #-}
module LoneWolf.Combat (fight) where

import LoneWolf.Chapter
import Solver

import qualified Memo
import Lens

fight :: Int -> FightDetails -> Probably Int
fight cvariable fdetails = regroup $ do
      let ohp = fdetails ^. fendurance
      ((php, _), p) <- fightVanillaM (cvariable ^. id) ohp
      return (max 0 php, p)

fightVanillaM :: Int -> Int -> Probably (Int, Int)
fightVanillaM = Memo.memo2 Memo.bits Memo.bits fightVanilla

fightVanilla :: Int -> Int -> Probably (Int, Int)
fightVanilla php ohp
  | php <= 0 || ohp <= 0 = certain (max 0 php, max 0 ohp)
  | otherwise = regroup $ do
      (odmg, pdmg) <- [(9,3),(10,2),(11,2),(12,2),(14,1),(16,1),(18,0),(100,0),(100,0),(100,0)]
      fightVanillaM (php - pdmg) (ohp - odmg)
