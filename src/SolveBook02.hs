module Main where

import LoneWolf
import Book02

main :: IO ()
main = length (show (solveLW chapters 20)) `seq` return ()
