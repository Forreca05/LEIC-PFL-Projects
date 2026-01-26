type Species = (String,Int)
type Zoo = [Species]

isEndangered :: Species -> Bool
isEndangered (x,y) = y <= 100

updateSpecies :: Species -> Int -> Species
updateSpecies (x,y) m = (x,y+m)


filterSpecies :: Zoo -> (Species -> Bool) -> Zoo
filterSpecies [] f = []
filterSpecies (x:xs) f
    | f x       = x : filterSpecies xs f
    | otherwise =     filterSpecies xs f

countAnimals :: Zoo -> Int
countAnimals z = sum(map (\(name,count) -> count) z)

substring :: (Integral a) => String -> a ->a -> String
substring xs ini f = [x | (x,i) <- zip xs [0..], i >= ini, i <= f]

hasSubstr :: String -> String -> Bool
hasSubstr x y =
    any (\(a,b) -> substring x a b == y)
        [(a,b) | a <- [0 .. length x - length y]
               , b <- [a + length y-1]]

sortSpeciesWithSubstr :: Zoo -> String -> (Zoo,Zoo)
sortSpeciesWithSubstr animals s = (sortSpeciesWithSubstrY animals s, sortSpeciesWithSubstrN animals s)

sortSpeciesWithSubstrY [] _ = []
sortSpeciesWithSubstrY ((x,y):xs) s
    | hasSubstr x s = (x,y) : sortSpeciesWithSubstrY xs s
    | otherwise = sortSpeciesWithSubstrY xs s

sortSpeciesWithSubstrN [] _ = []
sortSpeciesWithSubstrN ((x,y):xs) s
    | hasSubstr x s = sortSpeciesWithSubstrN xs s
    | otherwise = (x,y) : sortSpeciesWithSubstrN xs s

rabbits :: (Integral a) => [a]
rabbits = a
  where a = 2 : 3 : zipWith (+) a (tail a)

rabbitYears :: (Integral a) => a -> Int
rabbitYears n = length (takeWhile(<n) rabbits)
