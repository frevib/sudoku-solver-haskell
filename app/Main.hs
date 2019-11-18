module Main where

import Sudokus
import qualified Data.Set as Set
import qualified Data.List as List

main :: IO ()
main = do
    print (validateSudoku validSudoku1)
    print (validateSudoku invalidSudoku2)
    print (fillSudoku [[1]])








    
toSolveSudoku :: [[Int]]
toSolveSudoku = [[0,2,0], [2,3,0], [0,1,2]]


sudokuToSolve :: [[Int]]
sudokuToSolve = [[0,2,0], [2,3,0], [0,1,2]]


allPossibleSudokus :: [[[Int]]]
allPossibleSudokus =
    let allCombinations = combinations [1..3] 9
    in map (\x -> Split.chunksOf 3 x) allCombinations


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

combinations xs n = mapM (const xs) [1..n]


-- validate sudoku
validateSudoku :: [[Int]] -> Bool
validateSudoku x = (foldBools (map validateRow (List.transpose x))) && (foldBools (map validateRow x))


foldBools :: [Bool] -> Bool
foldBools x = foldr (&&) True x
    
    
validateRow :: [Int] -> Bool
validateRow [] = False
validateRow x = (Set.fromList [1..3]) == (Set.fromList x)


fillSudoku :: [[Int]] -> [[Int]]
fillSudoku toSolve =
    [ map (\x -> x * x) [1..10] ]