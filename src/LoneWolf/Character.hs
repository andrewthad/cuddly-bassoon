{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module LoneWolf.Character
    ( Endurance(..), CharacterVariable(..), CharacterConstant(..), curendurance, mkCharacter
    )
    where

import GHC.Generics
import Data.Hashable
import Data.Word
import Lens
import Data.Bits
import Parallel


data Character = Character
    { _constantData :: CharacterConstant
    , _variableData :: CharacterVariable
    } deriving (Generic, Eq, Show)


newtype Endurance = Endurance { getEndurance :: Int }
  deriving (Show, Eq, Read, Num, Ord, Integral, Real, Enum, Generic, Bits, Hashable)

instance NFData Endurance

data CharacterConstant = CharacterConstant
      { _maxendurance :: Endurance
      } deriving (Generic, Eq, Show, Read)


newtype CharacterVariable = CharacterVariable { getCharacterVariable :: Int }
                          deriving (Generic, Eq, Bits, Hashable, NFData, Ord)

mkCharacter :: Endurance -> CharacterVariable
mkCharacter (Endurance e) = CharacterVariable e

instance Show CharacterVariable where
  show c = show (c ^. curendurance, c ^. equipment)

curendurance :: Lens' CharacterVariable Endurance
curendurance f (CharacterVariable w) = (CharacterVariable . getEndurance) <$> f (Endurance w)
{-# INLINE curendurance #-}

equipment :: Lens' CharacterVariable Inventory
equipment f (CharacterVariable w) = const (CharacterVariable w) <$> f (Inventory 0)
{-# INLINE equipment #-}

newtype Inventory = Inventory { getInventory :: Word64 }
                    deriving (Generic, Eq, Bits, Hashable, NFData, Show)

