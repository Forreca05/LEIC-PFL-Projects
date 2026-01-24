myAnd :: [Bool] -> Bool
myAnd [] = True
myAnd (x:xs) = x && myAnd xs

myor :: [Bool]-> Bool
myor [] = False
myor (x:xs) = x || myor xs

myconcat :: [[a]]-> [a]
myconcat [[]] = []
myconcat (x:xs) = x ++ myconcat xs

myreplicate :: Int-> a-> [a]
myreplicate 0 _ = []
myreplicate n x = x : myreplicate (n-1) x

myIndex :: [a]-> Int-> a 
myIndex (x:xs) 0 = x
myIndex (x:xs) n = myIndex xs (n-1)

myelem :: Eq a => a-> [a]-> Bool
myelem _ [] = False
myelem d (x:xs) = x == d || myelem d xs

leastDiv :: Integer -> Integer
leastDiv n = head (filter (\d -> n `mod` d == 0) [2..n])


