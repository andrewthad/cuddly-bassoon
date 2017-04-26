module LoneWolf.Solve
    (solveLW, startVariable) where

import Solver (Solution(..), Score(..), solve, certain)
import LoneWolf.Choices (flattenDecision)
import LoneWolf.Chapter (ChapterId, Chapter(..))
import LoneWolf.Rules
import qualified Memo


startVariable :: Int
startVariable = 20

memoState :: Memo.Memo NextStep
memoState = Memo.wrap fromWord64 toWord64 (Memo.pair Memo.bits Memo.bits)

toWord64 :: NextStep -> (Int, Int)
toWord64 s = case s of
                 HasLost -> (0, 0)
                 HasWon cvariable -> (0, cvariable)
                 NewChapter a b -> (a, b)

fromWord64 :: (Int, Int) -> NextStep
fromWord64 (0, 0) = HasLost
fromWord64 (cid16, cvalue) = NewChapter cid16 cvalue

solveLW :: [(ChapterId, Chapter)] -> Int -> Solution NextStep String
solveLW book cvariable = solve memoState step getScore (NewChapter 1 cvariable)
  where
    chapters = book
    step (NewChapter cid curvariable ) = case lookup cid chapters of
                  Nothing -> error ("Unknown chapter: " ++ show cid)
                  Just (Chapter  d) -> do
                      (desc, outcome) <- flattenDecision curvariable d
                      return (unwords desc, update curvariable outcome)
    step (HasWon c) = [("won", certain (HasWon c))]
    step HasLost = [("lost", certain HasLost)]
    getScore ns = case ns of
                      NewChapter 200 _ -> Win 1 -- l
                      NewChapter 33 _ -> Win 1
                      NewChapter 88 _ -> Win 1
                      NewChapter 150 _ -> Win 1
                      NewChapter 265 _ -> Win 1
                      HasWon _ -> Win 1
                      HasLost -> Lose
                      _ -> Unknown

