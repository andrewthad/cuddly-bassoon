{-# LANGUAGE TupleSections #-}
module LoneWolf.Choices (flattenDecision) where


import LoneWolf.Chapter (Decision(..), ChapterOutcome(..))


flattenDecision :: Int -> Decision -> [([String], ChapterOutcome)]
flattenDecision cvariable d = case d of
        NoDecision o -> [([], o)]
        Decisions lst -> do
            d' <- lst
            (alldesc, o) <- flattenDecision cvariable d'
            return ( alldesc, o)
