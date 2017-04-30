import System.Directory (getDirectoryContents)
import System.Environment (getArgs)

main = do
    args <- getArgs
    let path = if (length args) == 0
                 then
                   "."
                 else
                   head args

    contents <- getDirectoryContents path
    mapM_ putStrLn $ contents