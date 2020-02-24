lessThan :: Integer -> [Integer]
lessThan n = [0 .. n-1]

plusMinus :: Integer -> Integer -> [Integer]
plusMinus a b = [a + b, a - b]

allPM0s :: Integer -> [Integer]
allPM0s n = concat (map (plusMinus 0) (lessThan n))

allPMs :: Integer -> Integer -> [Integer]
allPMs m n = concat (map (\x -> concat (map (plusMinus x) (lessThan n))) (lessThan m))

allPM0s' :: Integer -> [Integer]
allPM0s' n = do
  x <- lessThan n
  plusMinus 0 x

allPMs' :: Integer -> Integer -> [Integer]
allPMs' m n = do
  x <- lessThan m
  y <- lessThan n
  plusMinus x y

main :: IO()
main = do
  print $ allPM0s 5
  print $ allPMs 5 3
  print $ allPM0s' 5
  print $ allPMs' 5 3
