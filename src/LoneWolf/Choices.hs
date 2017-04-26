{-# LANGUAGE TupleSections #-}
module LoneWolf.Choices (flattenDecision) where


import LoneWolf.Character (CharacterVariable(..))
import LoneWolf.Chapter (Decision(..), ChapterOutcome(..))


flattenDecision :: CharacterVariable -> Decision -> [([String], ChapterOutcome)]
flattenDecision cvariable d = case d of
        AfterCombat nxt   -> flattenDecision cvariable nxt
        NoDecision o -> [([], o)]
        EvadeFight _ _ fdetails co -> [ ([], Fight fdetails co) ]
        Decisions lst -> do
            d' <- lst
            (alldesc, o) <- flattenDecision cvariable d'
            return ( alldesc, o)

        _ -> []
