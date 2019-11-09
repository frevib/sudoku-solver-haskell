module Main where

import Sudokus
import qualified Data.Set as Set
import qualified Data.List as List

main :: IO ()
main = do
    print (validateSudoku validSudoku1)
    print (validateSudoku invalidSudoku2)


validateSudoku :: [[Int]] -> Bool
validateSudoku x = (foldBools (map validateRow (List.transpose x))) && (foldBools (map validateRow x))


foldBools :: [Bool] -> Bool
foldBools x = foldr (&&) True x
    
    
validateRow :: [Int] -> Bool
validateRow [] = False
validateRow x = (Set.fromList [1..3]) == (Set.fromList x)