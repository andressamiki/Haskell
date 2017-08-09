module Aula6 where


-- Coisa eh um tipo quassui um TYPE VARIABLE
-- a e possui tres values constructors
-- 1) UmaCoisa: possui um campo do tipo a
-- 2) DuasCoisas: possui dois campos do tipo a
-- 3) Nada: Sem campos

-- Tem kind 3 - FUNÇÃO DE TIPOS - LISTAS
--data Coisa a b = UmaCoisa a | DuasCoisas a b |
 --              Nada deriving Show
               
-- :t(DuasCoisas "OL" Segunda)



-- POLIMORFISMO PARAMETRICO: A partir
-- de uma type variable a, eh possivel
-- montar estrutura especifica para
-- cada a fixado.
-- Exemplo: Coisa String, Coisa Int, ...
-- [String], [Int], ..
data Coisa a  = Nada | UmaCoisa a | DuasCoisas a a deriving Show


-----------------------------------------------------------------------
--SEGUNDA PARTE DA AULA
-- show é type class


-- Typeclass: Eh uma estrutura que define 
-- o comportamento 
-- de varios tipos. Exemplos: Show, Ord, Eq, ...
-- Basendo-se no tipo Dia e usando o deriving,
-- o Haskell cria automaticamente a instancia
-- Show Dia --DEfini o corpotamento de algo

--Tem  kind 1
data Dia = Segunda | Terca | Quarta | Quinta |
           Sexta | Sabado | Domingo 


data Numero = Zero | Um 
-- APAGANDO O deriving Show, podemos criar
-- uma instancia Show Dia diferente.

instance Show Dia where
-- show :: a -> string
-- show :: Dia -> string
    show Segunda = "Segunsa dia = AFF"
-- Segunda 

instance Show Numero where
    show Zero = "0"
    show Um = "1"
    
instance Eq Numero where    
-- Geral : (==) :: a -> a -> Bool
-- Aqui dentro: (==) :: Numero -> Numero -> Bool
    Zero == Um = True
    Zero == Zero = True
    Um == Zero = False
    Um == Um = False
    
    -- Zero == Um
    --filter (\x -> x == Zero) [Zero,Zero,Um,Um]
    -- Zero /= Zero 
    
data Bolsa a = Vazia | UmaCoisas a | DuasCoisa a a deriving Show
--DuasCoisas "Ola" "Mundo"
--(Show,Eq)
-- DuasCoisa 1 9 == DuasCoisa 1 9
-- DuasCoisa 1 9 == DuasCoisa 9 1
--instance (Eq a) => Eq (Bolsa a) where
  --  Vazia == Vazia = True
    --(UmaCoisa x) == (UmaCoisa y) = x == y
    --(DuasCoisas x y) == (DuasCoisas z w) = (x == z && y == w) || (x == w && y == z)
    --_ == _ = False
    
    
    
    
    
    --------------------------------------------------
    --MONOID
    
    