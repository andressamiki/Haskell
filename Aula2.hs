module Aula2 where

-- os dias são rotulos (Enumerações)--
-- parecido com enum -- 
data DiaSemana = Segunda | Terca | Quarta | Quinta | Sexta | Sabado | Domingo deriving (Show,Enum) 
-- de deriving show mostra dia da semana --
-- se eu crio o tipo dia da semana, posso criar tambem uma função--
-- Quase if com somente igualdade--
-- pattern matdhing: na estrada da função é possivel definir um valor padrão de entrada que se ajusta ao tipo em questão 2-- 
-- tipo na estrada eu dou um valor que ele possa esperar --
-- agenda é o nome da função, Dia da semana é parametro, o resto expressão--
agenda :: DiaSemana->String
agenda Sexta = "Dia de Maldade" 
agenda Sabado = "Dia de Ressaca"
-- tipo um default --
-- _ é a ultima coisa que pode colocar--
agenda _ = "Dia de ir para a Faculdade"


----------------------------------------------------------------------------------------------------------------------



numDia :: Int -> DiaSemana
numDia 1 = Domingo
numDia 2 = Segunda
numDia 3 = Terca
numDia 4 = Quarta
numDia 5 = Quinta
numDia 6 = Sexta
numDia 7 = Sabado
numDia _ = undefined  -- o retorno ainda é dia da semana -- 
-- numDia 15 no console é uma função parcial, não tenho dias suficientes para acompanhar os inteiros --
-- numDia _= não pode pois o retorno já esta definido como DiaSemana--
-- [agenda x | x<- [Segunda .. Sexta]]



------------------------------------------------------------------------------------------------------------------------


data DayWeek = Mon | Tue | Wed | Thu | Fri | Sat | Sun deriving (Show,Enum) 
-- Faça a função traduzirPT que recebe uma DayWeek e retorna DiaSemana

traduzirPT :: DayWeek -> DiaSemana
traduzirPT Mon = Segunda 
traduzirPT Tue = Terca
traduzirPT Wed = Quarta
traduzirPT Thu = Quinta
traduzirPT Fri = Sexta
traduzirPT Sat = Sabado
traduzirPT Sun = Domingo

traduzirEN :: DiaSemana -> DayWeek
traduzirEN Segunda = Mon
traduzirEN Terca=Tue
traduzirEN Quarta=Wed
traduzirEN Quinta =Thu
traduzirEN Sexta=Fri
traduzirEN Sabado=Sat
traduzirEN Domingo=Sun


-- 3) Em uma empresa é necessario calcular o salário a partir do dia da semana trabalhado. 
-- Todo sabado a remuneração sofre um acrescimo de 50% , tudo domingo de 100% e no resto não há alteraação
-- Faça uma função dia da semana->double->double  que implemente esta situação 

salariof :: DiaSemana -> Double -> Double

salariof Sabado y = y*1.5 
salariof Domingo y = y*2
salariof _ y = y

data Cor = Azul | Vermelho | Verde | Branco | Preto deriving Show

converter :: Cor -> (Int,Int,Int)
converter Azul = (0,0,255)
converter Vermelho = (255,0,0)
converter Branco = (255,255,255)
converter Preto = (0,0,0)
converter Verde = (0,255,0)


-- Converter2
converter2 :: (Int,Int,Int) -> Cor

converter2 (0,0,255) = Azul
converter2 (255,0,0) = Vermelho
converter2 (255,255,255) = Branco
converter2 (0,0,0) = Preto
converter2 (0,255,0) = Verde

somar1 :: (Int,Int) -> Int
somar1 (x,y) = x+y

somar2 :: Int ->Int ->Int
somar2 x y = x+y

mistura :: (Cor,Cor) -> Cor
mistura (Azul,Vermelho) = Branco
mistura (Preto,_) = Preto
mistura (_,Preto) = Preto
mistura (x,Branco) = x 
mistura _ = Verde --default ignora a tupla


-- 4) Faça uma função que receba uma Tupla de forma (Int,Int,Int,Int) e 
-- devolva uma tupla com o dobro na primeira coordenada, o triplo na segunda , o quadruplo na terceira e o quintuplo na ultima

func :: (Int,Int,Int,Int) -> (Int,Int,Int,Int)
func (x,y,u,i)  | x == 5 =  (9*2,y*3,u*4,i*5) 
                | otherwise = (x*2,y*3,u*4,i*5)
                
func :: (String, Bool) -> String
func (x, y) = x ++ show y