getLine' :: IO String
getLine' = do x <- getChar
              if x == '\n' then
                  return []
                else
                  do xs <- getLine'
                     return (x:xs)

--putStr :: String -> IO ()

readLine :: IO String
readLine = do x <- getChar
              case x of
                '\n'   -> return []
                --'D' -> do putStr "\ESC[1D xxxxx"
                '\DEL' -> do putStr "\ESC[1D 12345\ESC[1D"
                --'\DEL' -> do putStr "xxx"
                             xs <- readLine
                             return (x:xs)
                _ -> do xs <- readLine
                        return (x:xs)

main = do
    --line <- getLine'
    line <- readLine
    putStrLn ("you said: " ++ line)
