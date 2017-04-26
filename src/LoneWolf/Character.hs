{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module LoneWolf.Character
    where

import GHC.Generics
import Data.Hashable
import Data.Word
import Lens
import Data.Bits
import Parallel


type Character = Int
type Endurance = Int
type CharacterVariable = Int
{-

data Character = Character
    { _variableData :: CharacterVariable
    } deriving (Generic, Eq, Show)


newtype Endurance = Endurance { getEndurance :: Int }
  deriving (Show, Eq, Read, Num, Ord, Integral, Real, Enum, Generic, Bits, Hashable)

instance NFData Endurance

newtype CharacterVariable = CharacterVariable { getCharacterVariable :: Int }
                          deriving (Generic, Eq, Bits, Hashable, NFData, Ord, Show)

mkCharacter :: Endurance -> CharacterVariable
mkCharacter (Endurance e) = CharacterVariable e

curendurance :: Lens' CharacterVariable Endurance
curendurance f (CharacterVariable w) = (CharacterVariable . getEndurance) <$> f (Endurance w)
{-# INLINE curendurance #-} -}
