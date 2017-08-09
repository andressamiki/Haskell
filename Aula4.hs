module Aula4 where

--(!!) [1,2,3,4] 3 prefixa e sufixa
-- head [1,2,3,4]   
-- 2
-- head é !!0
-- id pega um tipo e retorna algo do mesmo tipo
-- id 456 retorna ele mesmo //tipo

--lista
--tail [1,2,3,4]  elimina o head e devolver [2,3,4] //lista
--Take pega
--Drop Joga fora

--coms recursao patern matthing
--5:[1,2,3] empilha o 5 infixa
-- (:) 5 [1,2,3,4] prefixa
-- 4:7:9:0:[]   [4,7,9,0] infixa


--teste :: [Int] ->Int
--teste [] = 0
--teste (x:[]) =  1 --lista com um elemento
--teste (x:y[]) = 2 --lista com dois elementos  
--teste (x:_[]) = 2 posso usar o ignore, mas ignoro o segundo, não vou usar
-- teste (x:_[]) no console aparece dois
-- teste ([4]++[5]) no consele é dois
--[] -> ZERO ELEMENTOS
--_ -> ZERO OU MAIS ELEMENTOS
--xs -> ZERO OU MAIS ELEMENTOS
--_:[] -> UM
--x:[] -> UM
--x:xs -> UM OU MAIS
--x:_:[] -> DOIS
--x:z:[] -> DOIS
--x:_:xs-> DOIS OU MAIS
--x:y:w:_ -> TRES OU MAIS
--x:y:w:ws -> TRES OU MAIS
--_:_:_:_:_:_:xs -> SEIS OU MAIS
--_:_:d:_:[] -> 4 elementos
--pattern mathing de varios elementos
--teste xs = 9 -- se for mais que dois
--teste (x:y:xs)  = x + y -- não é fixo na caixa, pattern mathing variavel
                        -- x+ y + head xs
                        


func [] = []
func (x:[]) = [reverse x]
func (x:y:[]) = [reverse x ++ reverse y]
func ws = reverse ws
--func (x:y:z:[]) = reverse[id] -- arrumar


-- Exercicio b

-- recursão em haskell



{-*
somar :: [Int] -> Int

somar [] = 0

somar (x:xs) = x + somar xs

[1,2,7,3] -> 1:2:7:3:[]

somar 1:2:7:3:[] = 1 + somar 2:7:3:[] = 1 + 12 = 13
somar 2:7:3:[] = 2 + somar 7:3:[] = 2 + 10 = 12
somar 7:3:[] = 7 + somar 3:[] = 7 + 3 = 10
somar 3:[] = 3 + somar [] = 3+0 = 3
somar [] = 0
*-}

somar :: [Int] -> Int
somar [] = 0
somar (x:xs) = x + somar xs


mult :: [Int] -> Int
mult [] = 1
mult (x:xs) = x * mult xs


--Gurdas Sitaxe : É sitaxe do haskel para checar condições boleanas ordenadamente até encontrar uma expressão de retorno
-- ou a palavra otherwise

-- GUARDS: Eh uma sintaxe do Haskell
-- para checar condicoes booleanas ordenadamente
-- ateh encontrar uma expressao de retorno ou
-- a palavra otherwise ou acabar as condições

calcularImc :: Double -> Double -> String
calcularImc peso altura
    | w < 19 = "Abaixo do peso"
    | w <= 25.8 = "Peso normal"
    | otherwise = "Acima do peso"
    where   
        w = peso/(altura * altura)


-- pattern mathing e guarda


elimVogal :: String -> String
elimVogal [] = []
elimVogal (x:xs) 
    | elem x "AEIOUaeiou" = elimVogal xs 
    | otherwise = x : elimVogal xs



-- na rersão vai recursao no otherwise
