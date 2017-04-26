{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}

module LoneWolf.Character
    ( Endurance(..), CharacterVariable(..), CharacterConstant(..), curendurance, mkCharacter, Inventory(..)
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


newtype CharacterVariable = CharacterVariable { getCharacterVariable :: Word64 }
                          deriving (Generic, Eq, Bits, Hashable, NFData, Ord)

mkCharacter :: Endurance -> Inventory -> CharacterVariable
mkCharacter e i = CharacterVariable 0 & curendurance .~ e & equipment .~ i

instance Show CharacterVariable where
  show c = show (c ^. curendurance, c ^. equipment)

curendurance :: Lens' CharacterVariable Endurance
curendurance f (CharacterVariable w) = (\(Endurance ne) -> CharacterVariable ((w .&. 0xff00ffffffffffff) .|. (fromIntegral ne `shiftL` 48))) <$> f (fromIntegral ((w `shiftR` 48) .&. 0xff))
{-# INLINE curendurance #-}

equipment :: Lens' CharacterVariable Inventory
equipment f (CharacterVariable w) = const (CharacterVariable w) <$> f (Inventory 0)
{-# INLINE equipment #-}

newtype Inventory = Inventory { getInventory :: Word64 }
                    deriving (Generic, Eq, Bits, Hashable, NFData, Show)

