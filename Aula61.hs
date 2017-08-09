module Aula61 where

import Data.Monoid


-- falando que x e y é monoid
data Bolsa a = Nada | UmaCoisa a deriving Show

instance (Monoid a) => Monoid (Bolsa a) where
    mempty = Nada
    mappend (UmaCoisa x) (UmaCoisa y) = UmaCoisa (x <> y)
    mappend x Nada = x
    mappend Nada x = x
    
    -- Nada  <> UmaCoisa "BATOM" <> UmaCoisa "Lapis"
    --  Nada  <> UmaCoisa (Sum 9) <> UmaCoisa (Sum 10)
    
d0 :: (Monoid a, Ord a) => a -> Bool
d0 x = x<>x > mempty


-- d0 (Product(-3))
-- d0 [2,3]

