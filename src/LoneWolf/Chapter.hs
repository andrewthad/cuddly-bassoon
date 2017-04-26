{-# LANGUAGE RankNTypes #-}

module LoneWolf.Chapter
    
    where

import Solver


type ChapterId = Int
type Rounds = Int
type Price = Int


data Decision
   = Decisions [Decision]
   | NoDecision ChapterOutcome
   deriving (Show, Eq)


data ChapterOutcome
        = Fight Int ChapterOutcome
        | Conditionally [(ChapterOutcome)]
        | Goto ChapterId
        deriving (Show, Eq)
