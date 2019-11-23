module Main where

import Sudokus
import qualified Data.Set as Set
import qualified Data.List as List
import qualified Data.List.Split as Split

main :: IO ()
main = do
    print "aap"
    print $ map (\x -> 
        if validateSudoku x
            then x
            else [[9]]) allPossibleSudokus


-- fill sudoku
sudokuToSolve :: [[Int]]
sudokuToSolve = [[0,2,0], [2,3,0], [0,1,2]]


allPossibleSudokus :: [[[Int]]]
allPossibleSudokus =
    let allCombinations = allPossibleCombination [1..3] 9
    in map (\x -> fillSudoku sudokuToSolve (Split.chunksOf 3 x) ) allCombinations


fillSudoku :: [[Int]] -> [[Int]] -> [[Int]]
fillSudoku sudokuToSolve iteration =
    let flat1 = concat sudokuToSolve
        flat2 = concat iteration
        combined = zipWith sumIfZero flat1 flat2
    in Split.chunksOf 3 combined

sumIfZero :: Int -> Int -> Int
sumIfZero x y = 
    if x == 0
        then x + y
        else x

allPossibleCombination xs n = mapM (const xs) [1..n]


-- validate sudoku
validateSudoku :: [[Int]] -> Bool
validateSudoku x = (foldBools (map validateRow (List.transpose x))) && (foldBools (map validateRow x))


foldBools :: [Bool] -> Bool
foldBools x = foldr (&&) True x
    
    
validateRow :: [Int] -> Bool
validateRow [] = False
validateRow x = (Set.fromList [1..3]) == (Set.fromList x)