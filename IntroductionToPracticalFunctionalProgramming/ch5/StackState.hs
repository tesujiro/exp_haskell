import Control.Monad.State

push :: a -> State [a] ()
push = modify . (:)

pop :: State [a] a
pop = do
  value <- gets head
  modify tail
  return value

applyTop :: (a -> a) -> State [a]()
applyTop f = do
  a <- pop
  push (f a)

main :: IO() 
main = do
  print $ runState (applyTop (+10)) [0..9]
  -- print $ (\xs -> ((head xs):xs)) [1,2,3]
  print $ runState (do {a <- pop; push ((+10) a);}) [0..9]
  print $ runState (do {a <- do {value <- gets head; modify tail; return value}; push ((+10) a);}) [0..9]
  print $ runState (do {a <- (gets head >>= (\value -> modify tail >>= (\_ -> return value))); push ((+10) a);}) [0..9]
  print $ runState (do {a <- ((get >>= return . head) >>= (\value -> modify tail >>= (\_ -> return value))); push ((+10) a);}) [0..9]
  print $ runState (do {a <- ((state (\s -> (s, s)) >>= return . head) >>= (\value -> modify tail >>= (\_ -> return value))); push ((+10) a);}) [0..9]

