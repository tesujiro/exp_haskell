countOdd :: [Int] -> Int
countOdd = length . filter odd

countEven :: [Int] -> Int
countEven = length . filter even

countAll :: [Int] -> Int
countAll xs = countOdd xs + countEven xs

countAll' :: ((->) [Int]) Int
countAll' = do
  odds <- countOdd
  even <- countEven
  return (odds + even)

main :: IO()
main = do
  print $ countAll [1..10]
  print $ countAll' [1..10]
