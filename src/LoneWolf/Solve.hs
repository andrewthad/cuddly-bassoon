module LoneWolf.Solve (solveLW) where

import Solver (Solution(..), Score(..), solve, certain)
import LoneWolf.Choices (flattenDecision)
import LoneWolf.Chapter (Decision(..))
import LoneWolf.Rules
import qualified Memo


memoState :: Memo.Memo NextStep
memoState = Memo.pair Memo.bits Memo.bits


solveLW :: [(Int, Decision)] -> Int -> Solution (Int, Int) String
solveLW book cvariable = solve memoState step (const Unknown) (1, cvariable)
  where
    chapters = book
    step (cid, curvariable ) = case lookup cid chapters of
                  Nothing -> return ("", [])
                  Just d -> do
                      (desc, outcome) <- flattenDecision curvariable d
                      return (unwords desc, update curvariable outcome)
    step _ = [("", [])]
