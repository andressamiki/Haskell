module Exercicioscap7 where

import Data.Monoid
-- ex 7.1

{- 
        Crie o tipo TipoProduto que possui os value constructors Escritorio,Informatica, Livro, Filme e Total.
        O tipo Produto possui um value constructor - de mesmo nome - e os campos valor (Double), tp (TipoProduto) e um value
        constructor Nada que representa a ausência de um Produto. Deseja-se calcular o valor total de uma compra de modo a não 
        ter nenhuma conversão para inteiro e de forma combinável. Crie uma instância de Monóide para Produto de modo
        que o retorno sempre terá Total no campo tp e a soma dos dois produtos em valor.

-}

data TipoProduto = Escritorio | Informatica | Livro | Filme | Total deriving Show
data Produto = Produto {preco :: Double, tp :: TipoProduto} | Nada deriving Show

instance Monoid Produto where
    mempty = Nada
    mappend Nada Nada = Produto 0 Total -- Nada <> Nada = Nada
    mappend (Produto v1 _) (Produto v2 _) = Produto (v1 + v2) Total
    mappend (Produto v1 _) mempty = Produto v1 Total
    mappend mempty (Produto v1 _) = Produto v1 Total
    
  
--(Produto 30.0 Informatica) <> (Produto 40.0 Livro)
--foldl (<>) Nada [Nada, Produto 30.0 Informatica]
--mconcati = foldl (<>) mempty [Nada, Produto 30.0 Informatica]
  
  
  
-- Ex 7.2

totalGeral :: [Produto] -> Produto
-- lista = [x | x <- [Produto 10 Escritorio, Produto 15 Livro, Produto 25 Informatica, Produto 30 Filme]]
totalGeral lista = foldl (<>) mempty lista 


--totalGeral [Produto 10 Escritorio, Produto 15 Livro, Produto 25 Informatica, Produto 30 Filme]




-- Ex 7.3
data Min = Min Int deriving Show

instance Monoid Min where
    mempty = Min (maxBound)
    mappend (Min a)(Min b) = Min (min a b)
    


--(c) Quanto vale a expressao Min (-32) <> Min (-34) <> Max (-33)  
-- -33

--(d) Explique sua escolha para o mempty.


--(e) Crie uma fun¸c˜ao minAll que recebe um [Min] e retorna um Min contendo o menor valor.

--Ex 7.4
minAll :: [Min] -> Min
minAll listao = mconcat listao 
--minAll [Min 10 , Min 12]




-- Ex 7.5

data Paridade = Par | Impar deriving Show 
--class ParImpar a where

--decide:: a -> Paridade
--instance ParImpar Int where
    --a 0 = True

    
--7.6

data Max = Max Int deriving (Ord, Show, Eq)

instance Monoid Max where
    mempty = Max (minBound)
    mappend (Max a)(Max b) = Max (max a b)
-- Max (10) <> Max (13) <> Max (5)

maxAll :: [Max] -> Max 
maxAll listao = mconcat listao

--maxAll [Max 10 , Max 12]

lista :: Maybe Int -> Maybe Int -> Maybe Int
lista x y = min x y


func x = Just x