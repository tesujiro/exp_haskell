triple :: Int -> Int
triple = do
  n <- id
  d <- (n+)
  (d+)

triple' :: Int -> Int
triple' = id >>= (\n -> (n+) >>= (\d -> (d+)))

main :: IO()
main = do
  print $ triple 5
  print $ triple' 5
