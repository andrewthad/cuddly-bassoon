module Main where

import LoneWolf.Solve
import LoneWolf.Book02
import Solver

main :: IO ()
main = do
    let solution = solveLW chapters startVariable
    print (fromRational (_score solution) :: Double)
