import Control.Monad.Writer

enable :: (a -> a) -> Writer (Endo a) ()
enable = tell . Endo

plusEvenMinusOdd :: [Int] -> Writer (Endo Int) ()
plusEvenMinusOdd [] = return ()
plusEvenMinusOdd (n:ns) = do
  enable (\x -> if even n then x + n else x - n)
  plusEvenMinusOdd ns

main :: IO ()
main = do
  print $ execWriter (plusEvenMinusOdd [1..4]) `appEndo` 0
  -- 0 -1 +2 -3 +4 == 2
  print $ execWriter (plusEvenMinusOdd [1..4]) `appEndo` 1
  -- 1 -1 +2 -3 +4 == 3
  print $ execWriter (plusEvenMinusOdd [1..4]) `appEndo` 3
  -- (\x -> if even 1 then x+1 else x-1) === (-1)
  -- (\x -> if even 2 then x+2 else x-2) === (+2)
  -- (\x -> if even 3 then x+3 else x-3) === (-3)
  -- (\x -> if even 4 then x+4 else x-4) === (+4)
  -- appEndo (Endo ((+4) . (subtract 3) . (+2) . (subtract 1))) 3
  -- 3 -1 +2 -3 +4 == 5
  print $ appEndo (Endo ((+4) . (subtract 3) . (+2) . (subtract 1))) 3
  print $ execWriter (plusEvenMinusOdd (1:[2..4])) `appEndo` 3
  print $ execWriter (enable (subtract 1) >>= (\_ -> plusEvenMinusOdd [2..4])) `appEndo` 3
  print $ execWriter (enable (subtract 1) >>= (\_ -> enable (+2) >>= (\_ -> plusEvenMinusOdd [3..4]))) `appEndo` 3
  print $ execWriter (do { enable (subtract 1); enable (+2); enable (subtract 3); enable (+4); return ()}) `appEndo` 3
