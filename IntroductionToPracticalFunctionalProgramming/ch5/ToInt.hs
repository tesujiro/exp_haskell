data A = A
data B = B

class ToInt a where
   toInt :: a -> Int

instance ToInt A where
   toInt _ = 1

instance ToInt B where
   toInt _ = 2

add :: ToInt x => x -> x -> Int
add x y = toInt x + toInt y

add' :: (ToInt x, ToInt y)  => x -> y -> Int
add' x y = toInt x + toInt y

main :: IO()
main = do
  print $ add A A
  print $ add B B
  print $ add' A B

