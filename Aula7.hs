module Aula7 where

-- idb :: B -> B
-- F :: A -> B
-- ida :: A-> A
-- idb . f :: A -> B -- eh f
-- f . idA :: A ->B -- eh f


-- (f.g)h  :: A -> B
-- idb . h :: A -> B 
-- h :: A -> B

-- Categoria HASK

-- funtores

data Henrique = Henrique deriving Show
data Bruna = Bruna deriving Show
--meu funtor abaixo
data Vampiro a = Vampiro a deriving Show

instance Functor Vampiro where
    fmap f (Vampiro pessoa) = Vampiro (f pessoa)
    
    
amar :: Henrique -> Bruna
amar Henrique = Bruna


-- amar henrique
-- fmap amar (Vampiro Henrique)

--- Lista como funtor

--fmap (*2) [ 1,2,3]

-- fucntor maybe
-- data Maybe a = Nothing | Just a

-- fmap (*2) (Just 4)
--fmap (*2) (Nothing 4)

--fmap (\x -> x ++ "Mundo") (Just "Ola")

-- fmap reverse (Just "Ola")

-- fmap reverse (Nothing "Ola")


--t: (just true)

-- segundo argumento da divasão como zero dá erro

safeDiv :: Double -> Double -> Maybe Double
safeDiv x 0 = Nothing 
safeDiv x y = Just (x/y) 

-- safeDiv 4 0
--fmap (*2) (safeDiv 4 9)

validar :: String -> Maybe String
validar "" = Nothing
validar x = Just x

-- validar ""

--Just (Sum 5) <> Just "Mundo"
--Nothing <> Just "Ola" <> Just "Mundo"
-- safeDiv' 20 3 <> safeDiv' 4 3

--safeDiv




func :: Int -> [Int]
func x = [x]

func2 :: Int -> Maybe Int
func2 x = Just x