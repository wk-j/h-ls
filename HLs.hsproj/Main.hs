{-# LANGUAGE LambdaCase #-}

import System.Directory (getDirectoryContents, doesFileExist)
import System.Environment (getArgs)
import System.Console.ANSI

showResult x =
  doesFileExist x >>= \case
    True -> 
        do setSGR [SetColor Foreground Vivid Yellow]
           putStrLn x
    False ->
        do setSGR [SetColor Foreground Vivid Green]
           putStrLn x
      
main = do
    args <- getArgs
    let path = if (length args) == 0
                 then
                   "."
                 else
                   head args

    contents <- getDirectoryContents path
    mapM_ showResult $ contents