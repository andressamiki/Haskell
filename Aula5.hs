module Aula5 where

-- FUNCOES FEITAS AQUI POSSUEM UM CORPO
-- OU SEJA, POSSUEM UMA DEFINICAO

-- EXPRESSAO LAMBDA: FUNÇÃO SEM CORPO.
-- REPRESENTA UM VALOR DO TIPO FUNÇÃO

-- CURRYING: Eh o ato de chamar funcao
--com menos parametros do que definido. O resultado
--disso eh uma funcao com os parametros restantes.

-- HIGH-ORDER FUNCTIONS: Em Haskell as funcoes
-- sao tratadas como valores comuns. Ou seja,
-- sao passadas via parametro ou retornadas.


dobro :: Int -> Int
dobro x = x*2
-- [2*x | x<-[1,2,3]
-- map dobro [1.2.3]

func :: [Int] ->[Int]
func xs = map dobro xs
--func [1..10]


--map tail [[4.5.5.],[3,2,5,6],[5]]
-- [5,5] [2,5,6]

--odd : True ou false Impar
--even : True ou false Par

-- map(\x -> 3*x) [1,2,3]
-- \x é lâmbida

-- filter (<4) [1,2,3,4,5,6]

somarTres :: Int->Int->Int->Int
somarTres x y z = x + y + z

--  :t somarTres 4 5
-- (somarTres :: 4 5) -> Int -> Int

--  :t somarTres 4 5
-- (somarTres :: 4) -> Int -> Int -> Int


-- let somar45 = somarTres 4 5 = (\z -> 4+5+z)

-- somar45 :: Int->Int
-- somar45 1 = (z\z -> 4+5+1) = 10



--let f  = map length



{-
    :t foldl
    foldl:: Foldble t => (b->a->b) -> b -> t a ->b

    foldl (\soma vi -> soma +vi) 0 [1,2,3]
    
    soma = 0, vi = 1, 0+1 [2,3]
    soma = 1, vi = 2, 1+2 [3]
    soma = 3, vi = 3, 3+3 []
    soma = 6
    
    
    foldl (\mult vi -> mult*vi) 1 [1..5]
    
    foldl (\cont _ -> cont+1) 0 "HASKELL"
--}
func1 :: String -> Int -> String
func1 s i = s ++ show i
-- USE FUNC1    
-- foldl func1 "" [1,2,3,4]



ehimpar :: Int -> Int -> Int
ehimpar cont x 
    | odd x = cont + 1
    | otherwise = cont
    
-- foldl ehimpar 0 [1,2,3]

ehVogal :: Int -> Char -> Int
ehVogal a b
    | elem b "AEIOUaeiou" = a + 1
    | otherwise = a

-- foldl ehVogal 0 "casa"


ehNegativo :: Int -> Int -> Int
ehNegativo a b 
    | b < 0 = a + 1
    | otherwise = a
    
-- foldl ehNegativo 0 [-1,-2,0,3,-5]