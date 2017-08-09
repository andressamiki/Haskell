--Tipos algebricos de dados

module Aula3 where

{-*
O tipo pessoa possui dois value constructors (Fisica e Juridica)
Fisica: Possui 3 campos
Juridica: Possui 2 campos
*-}

data Pessoa = Fisica String String Int | Juridica  deriving Show

data Ponto = Ponto Double Double deriving Show

data Dinheiro = Real {valorDinheiro :: Double} | Dolar {valorDinheiro :: Double} | Euro {valorDinheiro :: Double} deriving Show

data Sexo = M | F deriving Show

data Pessoa2 = Pessoa2 String Sexo Dinheiro deriving Show

--Ex. Em uma empresa brasileira, as mulheres ganharam 500 reais de bonus mérito e os homens 300

bonus :: Pessoa2 -> Pessoa2
bonus (Pessoa2 nome M (Real salario)) = Pessoa2 nome M (Real (salario+300)) --parenteses só é obrigatório no pattern matching
bonus (Pessoa2 nome F (Real salario)) = Pessoa2 nome F (Real (salario+500))
bonus (Pessoa2 nome sexo (Dolar salario)) = Pessoa2 nome sexo (Dolar (salario+180))
bonus pessoa = pessoa --retorna ele mesmo

--Ex. a) Função somar dinheiro b) Função casamento, a resposta desta função deve conter a concatenação do nome do casal e a soma em dinheiro

conversaoDolar :: Dinheiro -> Dinheiro
conversaoDolar (Real valor) = Dolar (0.312437*valor)
conversaoDolar (Euro valor) = Dolar (1.13*valor)
conversaoDolar x = x

conversaoEuro :: Dinheiro -> Dinheiro
conversaoEuro (Real valor) = Euro (0.275992226*valor)
conversaoEuro (Dolar valor) = Euro (0.88*valor)
conversaoEuro x = x

conversaoReal :: Dinheiro -> Dinheiro
conversaoReal (Dolar valor) = Real (3.20*valor)
conversaoReal (Euro valor) = Real (3.62*valor)
conversaoReal x = x

somarDinheiro :: Dinheiro -> Dinheiro -> Dinheiro
somarDinheiro (Real valor) dinheiro = Real (valor + (valorDinheiro (conversaoReal dinheiro)))
somarDinheiro (Euro valor) dinheiro = Euro (valor + (valorDinheiro (conversaoEuro dinheiro)))
somarDinheiro (Dolar valor) dinheiro = Dolar (valor + (valorDinheiro (conversaoDolar dinheiro)))

