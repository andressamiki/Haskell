module Exercicioscap2 where


-- Ex 1  subtrair--
subtrair :: Int -> Int -> Int 
subtrair x y = x - y

-- Ex 2 retorna triplo--
quaseTriplo :: Int-> Int
quaseTriplo x = x * 3

-- Ex 3 retorna se numero é maior que 2--
maior :: Int -> Bool
maior x = x > 2

-- Ex 4 retorna msg na tela --
msg :: String
msg = "Andressa"

-- Ex 5 revertendo nome de cima --
rev :: String -> String
rev msg = reverse(msg)

-- rev "batata"

-- Ex 6 revertendo a mensagem a cima --
revert :: String -> String
revert rev = reverse(reverse(rev))

{-revert "batata"
R:"batata"  -}

-- Ex 7 criando uma lista --
lista :: Int -> [Int]
lista n = [1..(n-1)]

-------------------------------------------------------------------------------------------

-- Ex 8 compreensão de listas --
listascompree :: Int -> [Int]
listascompree n = [2 * x | x <- [1..n-1]]

-- Ex 9 lista de compreensão de numeros impares --
listamaior :: [Int]
listamaior = [2 * x + 1 | x <-[0..10]]

----------------------------------------------------------------------------------------------
-- Ex 10 2.1 apostila --
listaapol :: [Float]
listaapol = [11^x | x <-[0..6]]

listaapol2 :: [Int]
listaapol2 = [x | x <-[1..39], mod x 4 /= 0]

------------------------------------------------------------------------------------------------
--2.2--

lista1 :: [String]
lista1 = ["A" ++ [x] ++"BB"| x <-['a' .. 'g']]

listaapolex3 :: [Int]
listaapolex3 = [(x*3) + 2 | x<-[1..13] , x /= 4, x/=7, x/=11]

listaapolex4 :: [Float]
listaapolex4 = [1/(2^x)|x<-[0..5]]
------------------------------------------------------------------------------------------------

--2.3--
listaapolex5 :: [Int]
listaapolex5 = [(x*9) + 1  |x<-[0..7]]

listaapolex6 :: [Int]
listaapolex6 = [x*2 |x<-[1..15], x /= 3, x/=7,x/=10,x/=13]

listaapolex7 :: [Char]
listaapolex7 = [x|x<-['@'..'L'],  notElem x "BFHIK"]

listaapolex8 :: [String]
listaapolex8 = [x|x<-["@","A","C","D","E","G","J","L"]]
-----------------------------------------------------------------------------------------------
ex24 :: String -> Bool
ex24 n = mod (length(n)) 2 == 0 

ex25 :: [String] -> [String]
ex25 n = [reverse(n!!x) | x <-[0..(length(n) - 1)]]

ex26 :: [String] -> [Int]
ex26 n = [(length(n!!x)) | x <-[0..(length(n) - 1)] , mod (length(n!!x)) 2 == 1]



----------------------------------------------------------
--Ex 2.1
--ex1a :: [Int]

ex1b :: [Int]
ex1b = [x | x<-[1 .. 39], x /= 4, x/=8, x/=12, x/=16, x/=20, x/=24, x/=28, x/=32, x/=36]

--Ex 2.4
ex4 :: String -> Bool
ex4 x = length x `mod` 2 == 0

--Ex 2.5
ex5 :: [String] -> [String]
ex5 x = [reverse y | y <- x]
--ex5 ["Ola","dois"]

ex6 :: [String] -> [Int]
ex6 x = [length y | y <- x, (mod (length y) 2) == 1]



