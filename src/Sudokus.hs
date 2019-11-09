module Sudokus (
    validSudoku1, 
    validSudoku2,
    invalidSudoku1,
    invalidSudoku2
    ) where

validSudoku1 :: [[Int]]
validSudoku1 = [[1,2,3], [2,3,1], [3,1,2]]

validSudoku2 :: [[Int]]
validSudoku2 = [[2,1,3], [2,3,1], [3,1,2]]

invalidSudoku1 :: [[Int]]
invalidSudoku1 = [[1,2,3], [2,3,1], [3,2,1]]

invalidSudoku2 :: [[Int]]
invalidSudoku2 = [[3,1,2], [2,3,1], [3,1,2]]