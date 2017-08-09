module Exercicioscap4 where

-- 4.1

data Metros = Metros Int Double | MetragemInvalida deriving Show

areaQuadrado :: Metros -> Metros 
areaQuadrado (Metros x y) = Metros (x^2) (y^2) 

-- 4.2 

data Valido = Sim String | Nao deriving Show
isNomeValido x = if x /= "" then Sim(x) else Nao 


-- 4.3
data Unidade = Inch | Yard | Foot | Metro deriving Show
data Medida = In {inch :: Double} |
              Yd {yard :: Double} |
              Ft {foot :: Double} |
              Mt {metro :: Double}
              deriving Show

converterMetros :: Medida -> Medida
converterMetros (In x) = (Mt (0.0254 * x))
converterMetros (Yd x) = (Mt (0.9144 * x)) 
converterMetros (Ft x) = (Mt (0.3048 * x))
converterMetros x = x

converterImperial :: Medida -> Unidade -> Medida
converterImperial (Mt x) Inch = (In (x / 0.0254))
converterImperial (Mt x) Yard = (Yd (x / 0.9144))
converterImperial (Mt x) Foot = (Ft (x / 0.3048))
converterImperial x y = x



-- 4.4
{-
data Numero = Ok Double | Erro String deriving Show


dividir :: Numero -> Numero -> Numero
dividir (Ok x) (Ok 0) = Erro ("O segundo valor deve ser diferente de 0!")
dividir (Ok x) (Ok y) = Ok (x / y)
dividir (Erro x) (Erro y) = Erro ("Valores incorretos!")
dividir x y = Erro ("Uooow, algo deu errado!")

-}
-- 4.5
-- Exercício 4.5 Faça o tipo Cripto que possua dois value constructors Mensagem e Cifrado ambos com um campo String e um value constructor Erro. 
-- Faça as funções encriptar e decriptar seguindo cada exemplo a seguir
-- encriptar(Mensagem ”FATEC”) = Cifrado ”GBUFD”
-- decriptar(Cifrado ”DBTB”) = Mensagem ”CASA”.
-- OBS: a encriptação deve empurrar cada letra a frente e a decriptação, faz o inverso, empurrando uma letra para trás. Use as
-- funções succ e pred e também list compreeshions. Não é possível encriptar mensagens cifradas e decriptar mensagens.

-- encriptar(Mensagem ”FATEC”) = Cifrado ”GBUFD” succ
-- decriptar(Cifrado ”DBTB”) = Mensagem ”CASA”. pred

data Cripto =   Mensagem String |
                Cifrado String |
                Erro String deriving (Show)
                
encriptar :: Cripto -> Cripto
encriptar (Mensagem msg) = Cifrado $ [ succ x | x <- msg ] 
encriptar _ = Erro "Cripto Invalido"

decriptar :: Cripto -> Cripto
decriptar (Cifrado msg) = Mensagem $ [ pred x | x <- msg ]
decriptar _ = Erro "Cripto Invalido"


-- Exercício 4.6 Faça uma função encriptarTodos que encripta (ou dá erro) todos os elementos de um vetor de Cripto.

encriptarTodos :: [Cripto] -> [Cripto]
encriptarTodos criptos = [ encriptar x | x <- criptos ]

-- teste
mensagem1 :: Cripto
mensagem1 = Mensagem "Vitor"
mensagem2 :: Cripto
mensagem2 = Mensagem "Haskell"
mensagem3 :: Cripto
mensagem3 = Cifrado "DBTB"

criptos :: [Cripto]
criptos = [mensagem1, mensagem2, mensagem3]

{-Exercício 4.7 Tendo como base o exercício de conversão de medidas dado em
aula, crie uma função que faça conversão de câmbio. Você deve criar o tipo Cambio
contendo os value constructors Euro, Real e Dollar. Crie também o tipo Moeda
que possui os campos (val :: Double) e (cur :: Cambio). Use record
syntax e as taxas de conversão do dia ao qual você fez o exercício (especifique
o dia por comentário).

-}
data Cambio = Euro | Real| Dolar deriving Show
data Moeda = Moeda  {val :: Double, cur :: Cambio} deriving Show

conversaoDolar :: Moeda -> Moeda 
conversaoDolar (Moeda val Real) = Moeda (0.312437*val) Dolar --("Dia 21")
conversaoDolar (Moeda val Euro) = Moeda (3.20*val) Dolar --("Dia 21")
conversaoDolar x = x

conversaoReal :: Moeda -> Moeda 
conversaoReal (Moeda val Dolar) = Moeda (2.20*val) Real-- ("Dia 21")
conversaoReal (Moeda val Euro) = Moeda (3.20*val) Real --("Dia 21")
conversaoReal x = x

conversaoEuro :: Moeda -> Moeda 
conversaoEuro (Moeda val Dolar) = Moeda (2.20*val) Euro --("Dia 21")
conversaoEuro (Moeda val Real) = Moeda (3.20*val) Euro --("Dia 21")
conversaoEuro x = x
--conversaoReal [Moeda 5 Dolar , Moeda 6 Euro ]
--conversaoEuro [Moeda 5 Dolar , Moeda 6 Real ]
--conversaoDolar [Moeda 4 Euro , Moeda 6 Real ]
{-Exercício 4.8 Crie a função converterTodosReal que recebe uma lista de Moedas
e retorna outra lista de Moedas com todos os seus elementos convertidos para Real.
Use list compreenshion.-}

converterTodosReal :: Moeda -> Moeda
converterTodosReal (Moeda val Dolar) = Moeda (3.20*val) Real
converterTodosReal (Moeda val Euro) = Moeda (3.20*val) Real
converterTodosReal x = x

{-

Exercício 4.9 Crie a função maxMoeda que recebe uma lista de Moedas e retorna
o valor máximo absoluto(sem conversão alguma) dentre os campos val
desta lista. Exemplo,
maxMoeda [Moeda 3 Real , Moeda 7 Dollar , Moeda 2 Euro] = 7.-}

maxMoeda :: Moeda -> Moeda
maxMoeda (Moeda val Dolar) = Moeda val Dolar 
maxMoeda(Moeda val Real) = Moeda val Real 
maxMoeda x = x

--maxMoeda max [ 5 Dolar ,  6 Euro ] (to arrumando).
