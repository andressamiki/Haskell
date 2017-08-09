module Exerciciosextra where

--a) Filtre os numeros pares de uma lista

ehpar = filter (\x -> mod x 2 == 0) [1,2,3,4]

--ou  filter even [1,2,3,4,5]


--b) Filtre os ímpares de uma lista
ehimpar = filter (\x -> mod x 2 == 1) [1,2,3,4]

-- ou filter odd [1,2,3,4,5]

--c*) Filtre os números primos de uma lista (Fazer uma funcao de checar primos)
primos :: [Int] -> [Int]
primos w = filter (\elemento -> (length $ filter (\x -> mod elemento x == 0) [1..elemento]) == 2) w


--d) Faça uma função que receba uma lista de inteiros e retorne o dobro de todos eliminando os múltplos de 4

func x = filter (\x -> mod x 4 /= 0) (map (\x -> 2*x) x)



--e) Faça uma função que receba uma função (String -> String)e 
-- uma String e retorne o reverso da String que consiste
-- na aplicação da função recebida no outro parâmetro

funcao :: String -> String
funcao x = reverse x
    
--recebeFuncao :: (String -> String) -> String -> String
--recebeFuncao (f x) = f x
  


--f) Monte um currying da função
--hip :: Double -> Double -> Double
--hip x y = sqrt (x*x + y*y)

hip :: Double -> Double -> Double
hip x y = sqrt (x*x + y*y)

raiz :: Double -> Double
raiz = hip 4
--raiz 3



--g) Dê um jeito de aplicar a função acima em uma lista de Doubles
--hip2 :: [Double] -> [Double] -> [Double]
--hip2 (x , y) = map (\(x,y) -> (x*y)) x
-- OI
--Falta terminar
aplicaLista :: [Double] -> [Double]
aplicaLista x = map (\x -> raiz x) x




-- h) Elimine todas as hipotenusas que não dê 1 de uma lista (Dê seu jeito!)
-- calculo da hipotenusa é a*2 + b*2
-- como a hipotenusa tem sempre 2 parametros coloquei dentro de uma Tupla -> (a,b)
eliminHipo :: [(Int,Int)] -> [(Int,Int)]
eliminHipo x = filter  (\(a,b) -> (a*2 + b*2) /= 1 ) x
-- eliminHipo [ (1,2), (1,3) ]
--eh1 x y = map (\x -> ) x y /
-- pode apagar a linha 53 ?



-- i) Faça um tipo Dia contendo os dias da semana. Faca uma
-- função que receba uma lista de Dias e filtre as Terças.

data DiaSemana = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo deriving (Show,Enum,Eq) 
getTerca :: [DiaSemana] -> [DiaSemana]
getTerca x = filter (\x -> x == Terca) x
                        -- show Terca = Terca"
-- getTerca [Segunda,Terca,Quarta]


-- j) Faça o tipo Dinheiro que contenha os campos valor
-- e correncia (Real ou Dolar) e uma função que converta
-- todos os dinheiros de uma lista para dolar (e outra
-- para real.)
data Correncia = Real |  Dolar  deriving (Show,Eq)

data Dinheiro = Dinheiro {valorDinheiro :: Double, currDinheiro :: Correncia} deriving (Show,Eq)

conversaoDolar :: Dinheiro -> Dinheiro
conversaoDolar (Dinheiro valor Real) = Dinheiro (0.312437*valor) Dolar
conversaoDolar x = x

conversaoReal :: Dinheiro -> Dinheiro
conversaoReal (Dinheiro valor Dolar) = Dinheiro (3.20*valor) Real
conversaoReal x = x

somarDinheiro :: Dinheiro -> Dinheiro -> Dinheiro
somarDinheiro (Dinheiro v1 Real) v2 = Dinheiro (v1 + valorDinheiro (conversaoReal v2)) Real
somarDinheiro (Dinheiro v1 Dolar) v2 = Dinheiro (v1 + valorDinheiro (conversaoDolar v2)) Dolar

--Teste:
--map conversaoReal [Dinheiro 5 Dolar, Dinheiro 6 Dolar, Dinheiro 9 Dolar]

-- convertDolar x = map (\x ->  ) x
-- k) Filtre todos os Dolares de uma lista de Dinheiro.

-- l) Faça um fold para somar todos os Dolares da lista.
isDolar :: Dinheiro -> Bool
isDolar (Dinheiro x Dolar) = True
isDolar _ = False

{-*
Teste:
foldl (\x (Dinheiro y _) -> x+y) 0 .filter(isReal) $ [Dinheiro 7 Real, Dinheiro 8 Dolar, Dinheiro 6 Real]


*-}

isReal :: Dinheiro -> Bool
isReal (Dinheiro x Real) = True
isReal _ = False

{-* Teste 
filter (isDolar) [Dinheiro 4 Real, Dinheiro 5 Dolar, Dinheiro 6 Real]
Retorno = [Dolar 5]
*-}

-- m) Faça um fold para contar o número de Dolares da lista.

numDolar :: Int -> Correncia -> Int
numDolar cont x 
    | x == Dolar = cont + 1
    | otherwise = cont

--foldl numDolar 0 [ Dolar, Dolar, Real]


--n) Faça um fold para contar negativos
ehNegativo :: Int -> Int -> Int
ehNegativo a b 
    | b < 0 = a + 1
    | otherwise = a
    
-- foldl ehNegativo 0 [-1,-2,0,3,-5]



--o) Faça um fold para contar letras 'P'
ehP :: Int -> Char -> Int
ehP a b
    | elem b "pP" = a + 1
    | otherwise = a

-- foldl ehP 0 "Papagaiu"



-- p) Faça um fold para contar Sabados em uma lista
--de [DiaSemana].


contaSabado :: Int-> DiaSemana -> Int 
contaSabado cont x
    |x == Sabado = cont+1
    |otherwise = cont 

--foldl contaSabado 0 [Sabado,Sabado]


-- q) Faça um fold para contar Trues de uma lista de Bool

ehTrue :: Int -> Bool -> Int
ehTrue a b
    | b == True = a + 1
    | otherwise = a

-- foldl ehTrue 0 [True,False,True,False]



--r) Faça um fold para concatenar o reverso de 
--palavras de uma lista de Strings

--foldl concatenar "" ["Andressa","VitorBaitola"]
concatenar :: String -> String -> String
concatenar a x = a ++ reverse(x)

-- s) Faça um fold que a partir de uma lista de
-- [DiaSemana] retorne a soma dos dias. Exemplo
-- [Segunda, Segunda, Quarta] deve retornar 5.

numDiaSemana :: DiaSemana -> Int
numDiaSemana Segunda = 1 
numDiaSemana Terca = 2
numDiaSemana Quarta = 3
numDiaSemana Quinta = 4
numDiaSemana Sexta = 5
numDiaSemana Sabado = 6
numDiaSemana Domingo = 7


--foldl somarDiaSemana 0 [Segunda, Segunda, Quarta]
somarDiaSemana :: Int -> DiaSemana -> Int
somarDiaSemana a x = a + (numDiaSemana x)

