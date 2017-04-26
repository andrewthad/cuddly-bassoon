module Main where

import LoneWolf
import LoneWolf.Book02

main :: IO ()
main = do
    let solution = solveLW chapters 20
    print (fromRational (_score solution) :: Double)
