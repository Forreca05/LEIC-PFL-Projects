maxpos::[Int]->Int
maxpos [] = 0
maxpos (x:xs) = max (max x 0) (maxpos xs)

dups :: [a] -> [a]
dups [] = []
dups [x] = [x,x]
dups (x:y:xs) = x : x : y : dups xs

transforma :: String -> String
transforma [] = []
transforma (x:xs) 
    | x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u' = x : 'p' : x : transforma xs
    | otherwise = x : transforma xs

type Vector = [Int]
type Matriz = [[Int]]

transposta :: Matriz -> Matriz
transposta [] = []
transposta m = [head x | x <- m] : transposta [tail x | x <- m, tail x /= []]

prodInterno :: Vector -> Vector -> Int
prodInterno [] [] = 0
prodInterno (x:xs) (y:ys) = x * y + prodInterno xs ys

prodMat :: Matriz -> Matriz -> Matriz
prodMat m n = prodMatAux m (transposta n)

prodMatAux :: Matriz -> Matriz -> Matriz
prodMatAux [] [] = []
prodMatAux m n = [[prodInterno v1 v2| v2 <- n] | v1 <- m]

data Arv a = F | N a (Arv a) (Arv a)
    deriving (Show)

alturas :: Arv a -> Arv Int
alturas F = F
alturas (N a a1 a2) = N (alturasAux (N a a1 a2)) (alturas a1) (alturas a2)

alturasAux :: Arv a -> Int
alturasAux F = 0
alturasAux (N _ x y) = 1 + max (alturasAux x) (alturasAux y)

absoluto :: (Num a, Ord a) => a -> a
absoluto x
    | x < 0     = -x
    | otherwise = x

equilibrada :: Arv a -> Bool
equilibrada (N a a1 a2) 
    | absoluto (alturasAux a1 - alturasAux a2) <= 1 = True
    | otherwise = False
