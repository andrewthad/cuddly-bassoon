{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TemplateHaskell #-}

module LoneWolf.Rules
    ( NextStep(..), update) where

import LoneWolf.Chapter
import LoneWolf.Combat
import Solver

import GHC.Generics
import Data.Hashable

import Parallel (NFData)




data NextStep = NewChapter !ChapterId !Int
              | HasLost
              | HasWon Int
              deriving (Show, Eq, Generic, Ord)
instance Hashable NextStep
instance NFData NextStep

update :: Int -> ChapterOutcome -> Probably NextStep
update cvariable outcome =
  case outcome of
    Goto cid -> certain (NewChapter cid cvariable)
    GameLost -> certain HasLost
    GameWon -> certain (HasWon cvariable)
    Conditionally (o:_) -> update cvariable o
    Conditionally _ -> undefined
    Fight fd nxt -> regroup $  do
      (charendurance, _) <- fight cvariable fd
      update charendurance nxt
