module Exercicioscap5 where

-- 5.1
    media2 :: [Double] -> Double
    media2 x =  (foldl (\x i -> x +i) 0 x) / 2

--  Exercício 5.2 
--  Faça uma função que retorne o desvio padrãor de um [Double]
--  usando foldl. O desvio padrão de um vetor é dado por σ =
--  é a média deste vetor.

--  Passo 01: mediaAritimetrica soma do array divido pelo tamanho do mesmo.
    somarLista :: [Double] -> Double
    somarLista [] = 0
    somarLista (x:xs) = x + (somarLista xs)
    
    mediaAri :: [Double] -> Double
    mediaAri xs = (somarLista xs) / (fromIntegral . length $ xs)
    
--  Passo 02: variancia das amostras:
    variancia :: [Double] -> Double
    variancia xs = (foldl (\cont item -> cont + ((item - (mediaAri xs))^2) ) 0 xs) / (fromIntegral . length $ xs)
    
        
--  Passo 03: Desvio  
    desvioPadrao :: [Double] -> Double
    desvioPadrao xs = sqrt (variancia xs) 

{-*
Exercício 5.4 Faça uma função que receba um [String] e retorne todos elementos palíndromos. 
*-}

--Teste  
--palindromo [ "ana", "mirim", "ricardo", "ovo"]

    palindromo :: [String] -> [String]
    palindromo [] = []
    palindromo (palavra:vetorPalavras)
        | palavra == reverse palavra = palavra : palindromo vetorPalavras
        | otherwise = palindromo vetorPalavras

