module Aula1 where

somar :: Int -> Int -> Int
somar x y = x + y

quaseDobro :: Double -> Double
quaseDobro x = 2 * x

f :: Int -> Bool
f a = a >= 3

str :: String
str = "Hello Word"

str2 :: String -> String
str2 hhh = "Ola" ++ hhh

rev :: String -> String -> String
rev nome sobrenome = (reverse sobrenome) ++" "++ (reverse nome)

algo :: String -> String
algo y = reverse (reverse y)

umalista :: [Int]
umalista = [0 .. 1100]

foca :: [Int] -> [Int]
foca x = (reverse x) ++ [3,2,1]

auto :: [Int]
auto = [ 2*x | x<-[0 .. 200]]

auto2 :: [Int]
auto2 = [ 2 * x | x <- [0 .. 201], x>=5, x<=190   ]

exerc1 :: [Int] 
exerc1 = [2 * y + 1 | y<-[2 .. 10], y /= 7]

exerc2 :: [Int] -> [Int]
exerc2 x = [y - 2 | y<- x]

exerc3 :: [Int] -> [Int]
exerc3 x = reverse([y - 7 | y<- x])

f1 :: String->Int
f1 y = 1 + length y

f2 ::Int -> Bool
f2 x = x >= 19

outraLissta1 :: String
outraLissta1 = ['A' .. 'Z']

outraLista2 :: [String]
outraLista2 = [ x ++ "AA" | x<-["OLA","MUNDO"] ]

outraLista3 :: [String]
outraLista3 = [x ++ "AA" | x<-["OLA", "MUNDO"]]

ehPrimo :: Int -> Bool
ehPrimo n = length ([x | x <- [2 .. (n-1)], mod n x == 0]) == 0

lista :: [Int]
lista = [x | x <- [2 .. 100], ehPrimo x]

