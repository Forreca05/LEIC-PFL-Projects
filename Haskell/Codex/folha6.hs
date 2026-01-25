import Data.Char
module Main where

--main :: IO ()
--main = do
--    conteudo <- getContents
--    let nLinhas   = length (lines conteudo)
--        nPalavras = length (words conteudo)
--        nChars    = length conteudo
--    print nLinhas
--    print nPalavras
--    print nChars

--main :: IO ()
--main = do 
--    input <- getContents
--    let linhas    = lines input
--        newlinhas = map reverse linhas
--    putStr (unlines newlinhas)

rot13char :: Char -> Char
rot13char c
    | isUpper c = chr ((((ord c - ord 'A') + 13)`mod` 26) + ord 'A')
    | isLower c =  chr ((((ord c - ord 'a') + 13)`mod` 26) + ord 'a')
    | otherwise = c

rot13 :: String -> String
rot13 s = map rot13char s 

main :: IO ()
main = do
    input <- getContents
    let linhas = lines input
        newlinhas = map rot13 linhas
    putStr (unlines newlinhas)
