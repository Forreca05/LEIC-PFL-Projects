calcPi1 :: Int -> Double
calcPi1 n = 4 * sum (take n terms)
    where
        terms = [((-1) ** fromIntegral k) / (2 * fromIntegral k + 1) | k <- [0..]]

calcPi2 :: Int -> Double
calcPi2 n = 3 + 4 * sum (take n terms)
    where
       terms = [((-1) ** (fromIntegral k - 1)) / ((2 * fromIntegral k) * (2 * fromIntegral k +1) * (2 * fromIntegral k + 2)) | k <- [1..]]


