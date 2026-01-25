import Prelude hiding (reverse)
import Prelude hiding ((++))
import Prelude hiding (zipWith)

primo :: Integer -> Bool
primo n =
    n > 1 &&
    null [ x
         | x <- [2 .. floor (sqrt (fromIntegral n))]
         , n `mod` x == 0
         ]

--(++) :: [a] -> [a] -> [a]
--xs ++ ys = foldr f z lista
--    where f     = (:)
--          z     = ys
--          lista = xs

reverse :: [a] -> [a]
reverse xs = foldr f z xs
    where f     = \x acc -> acc ++ [x]
          z     = []

--zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
--zipWith f [] _ = []
--zipWith f _ [] = []
--zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys

palavras :: String -> [String]
palavras [] = []
palavras s =
    let s'      = dropWhile (== ' ') s    
        palavra = takeWhile (/= ' ') s'   
        resto   = dropWhile (/= ' ') s'
        resto'  = dropWhile (== ' ') resto 
    in if null s'
       then []
       else palavra : palavras resto'

aproxPi1 :: Int -> Double
aproxPi1 n = 4 * sum(take n terms)
    where
        terms = [fromIntegral(-1) ** k / (2 * k + 1)| k<-[0..]]

aproxPi2 :: Int -> Double
aproxPi2 n = 3 + 4 * sum(take n terms)
    where
        terms = [fromIntegral(-1) ** k / ((2 * k + 2) * (2 * k + 3) * (2 * k + 4)) | k<-[0..]]
