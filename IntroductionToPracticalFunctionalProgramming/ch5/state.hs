import Control.Monad.State

main :: IO ()
main = do
  -- return
  print $ runState (return 'X') 1 -- ('X',1)
  print $ (runState (return 'X')) 1 -- ('X',1)
  -- get, put
  print $ runState (put 5) 1 -- ((),5)
  print $ runState get 1 -- (1,1)
  print $ runState get 10 -- (10,10)
  print $ (runState get) 10 -- (10,10)
  print $ runState (do { get }) 10  -- (10,10)
  print $ runState (do { x <- get; put (x-1)}) 10  -- ((),9)
  print $ runState (do { x <- get; put (x-1); get}) 10 -- (9,9)
  print $ runState (do { x <- get; put (x-1); return x}) 10 -- (10,9)
  print $ runState (do { put 5; return 'X' }) 1  -- ('X',5)
  -- modify
  print $ runState (do { modify (+1)}) 10  -- ((),11)
  print $ runState (do { get; modify (+1)}) 10  -- ((),11)
  -- gets
  print $ runState (do { gets (+1)}) 10  -- (11,10)
  -- evalState
  print $ evalState (do { gets (+1)}) 10  -- 11
  -- execState
  print $ execState (do { gets (+1)}) 10  -- 10
