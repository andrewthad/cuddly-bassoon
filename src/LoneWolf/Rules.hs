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




type NextStep = (Int, Int)

update :: Int -> ChapterOutcome -> Probably (Int, Int)
update cvariable outcome =
  case outcome of
    Goto cid -> certain (cid, cvariable)
    Conditionally (o:_) -> update cvariable o
    Conditionally _ -> undefined
    Fight fd nxt -> regroup $  do
      (charendurance, _) <- fight cvariable fd
      update charendurance nxt
