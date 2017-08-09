module Exercicioscap3 where


--Ex 3.1
data Pergunta = Sim | Nao deriving Show

pergNum :: Pergunta -> Int
pergNum Sim = 1
pergNum Nao = 0



--Ex 3.2
--a 
data Temp = Celsius|  Farenheit | Kelvin 
converterCelsius :: Double -> Temp -> Double
converterCelsius x Farenheit = (x - 32)/ 1.8000 
converterCelsius x Kelvin =  x - 273.15
converterCelsius x Celsius = x

--b
converterFarenheit :: Double -> Temp -> Double
converterFarenheit x Kelvin = (x * 1.8000) - 459.67 
converterFarenheit x Celsius = (x * 1.8000) + 32 
converterFarenheit x Farenheit = x

--c
converterKelvin :: Double -> Temp -> Double
converterKelvin x Kelvin = x
converterKelvin x Celsius = x + 273.15
converterKelvin x Farenheit = ((x - 32)/ 1.8000) + 273.15 

--Ex 3.3
data Jogo = Pedra | Papel | Tesoura

jogo :: Jogo -> Jogo -> String
jogo Pedra Pedra = "Empate"
jogo Pedra Papel = "Papel vence"
jogo Pedra Tesoura = "Pedra vence"
jogo Papel Papel = "Empate"
jogo Papel Tesoura = "Papel vence"
jogo Tesoura Tesoura = "Empate"

--jogo Pedra Tesoura
-- Ex 3.4
lista :: String -> [Char]
lista y = [x| x<-y, notElem x "aeiouAEIOU" ]


--Ex 3.5
data UnImperiais = In | Yd | Ft deriving Show

converterMetros :: UnImperiais -> Double -> Double
converterMetros In x = 0.0254*x
converterMetros Yd x = 0.09144*x
converterMetros Ft x = 0.3048*x

converterImperial :: UnImperiais -> Double -> Double
converterImperial In x = x/0.0254
converterImperial Yd x = x/0.09144
converterImperial Ft x = x/0.3048

--Ex 3.6
data Mes = Janeiro | Fevereiro | Marco | Abril | Maio | Junho | Julho | Agosto | Setembro | Outubro | Novembro | Dezembro deriving (Show,Enum)
data Estacao = Primavera | Verao | Outono | Inverno deriving Show

checaFim :: Mes -> Int
checaFim Fevereiro = 28
checaFim Abril = 30
checaFim Junho = 30
checaFim Setembro = 30
checaFim Novembro = 30
checaFim _ = 31

prox :: Mes -> Mes
prox Janeiro = Fevereiro
prox Fevereiro = Marco
prox Marco = Abril
prox Abril = Maio
prox Maio = Junho
prox Junho = Julho
prox Julho = Agosto
prox Agosto = Setembro
prox Setembro = Outubro
prox Outubro = Novembro
prox Novembro = Dezembro
prox Dezembro = Janeiro

estacao :: Mes -> Estacao
estacao Janeiro = Verao
estacao Fevereiro = Verao
estacao Marco = Verao
estacao Abril = Outono
estacao Maio = Outono
estacao Junho = Outono
estacao Julho = Inverno
estacao Agosto = Inverno
estacao Setembro = Inverno
estacao Outubro = Primavera
estacao Novembro = Primavera
estacao Dezembro = Primavera
                                                                                 
-- 3.7
palindromo :: String -> Bool
palindromo x = if reverse(x) == x then True else False 

-- 3.8
listaint :: [Int] -> [Int]
listaint y = reverse[x | x<-y,  (mod x 2) == 1 , mod x 7 /= 1, x>0]

-- 3.9 
reversa :: String -> String -> String -> (String, String, String)
reversa x y z = (reverse(x),reverse(y),reverse(z)) 

-- 3.10
revNum :: Int -> String -> String
revNum n s = reverse (take n s) ++ (drop n s)
--patternmatting


-- 3.11
data Binario = Zero | Um deriving Show 
data Funcao = Somar2| Maior | Menor | Mult2
ret Somar2 Zero Zero = Zero
converterInt Zero = 0
converterInt Um = 1

-- 3.12
binList :: [Binario] -> [Int]
binList y = [converterInt(x) | x<-y ]


-------------------------------------------------------------------------------------------------------
