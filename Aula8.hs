module Main where
import Control.Monad 


--- (<=<) flexa de kleili

-- tranformação natural  pois é uma função que mapeia funtores
-- I a = a
--funca  :: a -> [a]
--funca x = [x]
-- (func . func)  7
--func2  :: a -> Maybe a
--func2 x = Just  x
-- func2 .  func2 ) 7

--func3 :: Int -> [Int]
--func3 x = [x+1]
-- (func3 . func3) 4
-- <=< 
--func4 :: Int -> Maybe Int
--func4 x = Just (x+1)

-- Não  conseguimos compor com o (.) funções cujo a saida é um functor 

--dobro :: Int -> Int 
--dobro x = x*2


--Just 10 >>= func4
-- Just 10 >>= (\x  -> Just (2*x))


--imp :: Maybe Int
--imp = do
    --x <- Just 1  
    --y <- Just (x+1) 
    --return (x+y)

--func :: Maybe Int
--func = Just 1 >>= \x -> Just (x+1) >>= \y -> Just(x+y)


-- data () = ()
-- IO () equivale ao void
--main :: IO ()
-- = print "Olá mundão"



--main :: IO ()
--main = do
    --putStrLn "Digite um nome: "
    --y <- getLine
    --putStrLn $ "Ola " ++ y

-- ghc Aula8.hs -o Aula.out


--main :: IO ()
--main = putStrLn "Digite um nome: " >> getLine >>= \y ->putStrLn $ "Ola " ++ y


--main :: IO ()
--main = do
    --putStrLn "Digite um numero: "
    --x <- readLn :: IO Int
    --putStrLn "Digite outro numero: "
    --y <- readLn :: IO Int
    --putStrLn ("A soma eh: " ++ show (x+y))

--main = putStrLn "Digite um numero: " >> (readLn :: IO Int) >>=  putStrLn "Digite outro numero: "


-- b) faca um programa que leia do teclado uma palavra
-- e retorne seu reverso
    
    ---entrada sem monad
--main :: IO ()
--main = putStrLn "Digite um numero: " >> (readLn :: IO Int) >>=
       --\x -> putStrLn "Digite outro numero: " >> (readLn :: IO Int) >>=
       --\y -> putStrLn ("A soma eh: " ++ show (x+y))

main :: IO ()
main = do
    putStrLn "Digite um nome: "
    y <- getLine
    putStrLn $ reverse (y)






--Aula8> :q
--libraryandyero:~/workspace $ ghc Aula8.hs -o Aula.out
--libraryandyero:~/workspace $ ./Aula.out
--"Ol\225 mund\227o"
