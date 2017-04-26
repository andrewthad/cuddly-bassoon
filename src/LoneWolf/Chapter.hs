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
   | EvadeFight Rounds ChapterId Int ChapterOutcome
   | AfterCombat Decision
   deriving (Show, Eq)


data ChapterOutcome
        = Fight Int ChapterOutcome
        | Conditionally [(ChapterOutcome)]
        | Goto ChapterId
        | GameLost
        | GameWon
        deriving (Show, Eq)
