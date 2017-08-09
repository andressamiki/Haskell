module Simulado where

import Data.Monoid
data Unidade a = Nada | Unidade a deriving (Show, Ord, Eq)

data Tupla a = Tupla a a 

instance Functor Tupla where
    fmap f (Tupla x y) = Tupla (id.f $ y) (f.id $ x)
    
instance (Eq a) => Eq (Tupla a) where
    (Tupla a x) == (Tupla c d) = (a == d)
    
instance (Show a) => Show (Tupla a) where
   show (Tupla x y) =  "Pega querido"
    
instance (Monoid a) => Monoid (Unidade a) where
    mempty = Nada
    mappend Nada Nada = Nada
    mappend (Unidade x) (Unidade y) = Unidade (x <> y)
    mappend x Nada = x
    mappend Nada x = x


data Bin = Um | Zero deriving (Show,Enum)
data Pixel = Pixel {bin :: (Bin,Bin,Bin) } deriving (Show)
data Color = Red|Green|Blue|White|Black deriving Show 

toInt :: Bin->Int 
toInt Um = 1
toInt Zero = 0

toBin :: Int->Bin
toBin 1 = Um
toBin 0 = Zero

toMaybeColor :: Pixel -> Maybe Color 
toMaybeColor (Pixel(Um,Um,Um)) = Just White
toMaybeColor (Pixel(Um,Zero,Zero)) = Just Red
toMaybeColor (Pixel(Zero,Um,Zero)) = Just Green
toMaybeColor (Pixel(Zero,Zero,Um)) = Just Blue
toMaybeColor (Pixel(Zero,Zero,Zero)) = Just Black
toMaybeColor (Pixel(_,_,_))= Nothing

--filterRed :: [Color] -> [Maybe Color]
--filterRed x = map (\x ->Just x) 