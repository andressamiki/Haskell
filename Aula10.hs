module Aula10 where

import Control.Applicative

--Aula10> fmap (*2) ( Just 5)
--Just 10
--Aula10> fmap (*2) [1,2,3]
--[2,4,6]
--(*2) <$> [1,2,3]

 --TAG CIFRÃO NÃO É PRÉFIXO
 
 
--Aula10> :t (<$>)
--(<$>) :: Functor f => (a -> b) -> f a -> f b
--Aula10> :t fmap
--fmap :: Functor f => (a -> b) -> f a -> f b


--Aula10> :t ($)
--($) :: (a -> b) -> a -> b
--Aula10> :t (<$>)
--(<$>) :: Functor f => (a -> b) -> f a -> f b


--Aula10> :t (<$>)
--(<$>) :: Functor f => (a -> b) -> f a -> f b
--Aula10> :t (<*>)
--(<*>) :: Applicative f => f (a -> b) -> f a -> f b
-- lista de funções

--Aula10> let f = Just (\x -> 2*x)
--Aula10> :t f
--f :: Num a => Maybe (a -> a)

--Aula10> f <*> Just 4
--Just 8


data Produto = Produto {nome :: String, preco :: Double} deriving Show



