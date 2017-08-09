module Exercicioscap6 where 

{-
Exercício 6.1 Usando a estrtura de árvore, monte uma função mapA, que jogue
uma função passada por parâmetro para todos os elementos de uma árvore. Deixe
explícito o tipo desta função.

-}
-- Galho recebe 
data Arvore = Galho Int Arvore Arvore | Folha Int | Nada deriving Show 

mapA :: Arvore -> (Int -> Int) -> Arvore 
mapA Nada f = Nada
mapA (Folha x) f = Folha (f x)
mapA (Galho x e d) f = Galho (f x) (mapA e f) (mapA d f)

--mapA (Galho 11 (Folha 5) (Folha 15)) (\x -> x*2)

{-Exercício 6.2 Usando o exercício acima, some 5 a cada elemento de uma árvore
de inteiros.
-}

ex2 x = mapA x (\x-> x+5)


{-Exercício 6.4 Usando a estrutura de árvore dada em aula, faça uma função que
some todos os elementos de uma árvore de números.
-}