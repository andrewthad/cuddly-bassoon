{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE TemplateHaskell #-}

module LoneWolf.Rules
    ( NextStep(..), update) where

import LoneWolf.Character
import LoneWolf.Chapter
import LoneWolf.Combat
import Solver

import Lens
import GHC.Generics
import Data.Hashable

import Parallel (NFData)




data NextStep = NewChapter !ChapterId !CharacterVariable
              | HasLost
              | HasWon CharacterVariable
              deriving (Show, Eq, Generic, Ord)
instance Hashable NextStep
instance NFData NextStep

update :: CharacterVariable -> ChapterOutcome -> Probably NextStep
update cvariable outcome =
  case outcome of
    Goto cid -> certain (NewChapter cid cvariable)
    GameLost -> certain HasLost
    GameWon -> certain (HasWon cvariable)
    Conditionally (o:_) -> update cvariable o
    Conditionally _ -> undefined
    Randomly rands -> regroup $ do
      (p, o) <- rands
      fmap (*p) <$> update cvariable o
    Fight fd nxt -> regroup $  do
      (charendurance, _) <- fight cvariable fd
      update charendurance nxt
