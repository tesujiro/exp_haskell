import Control.Monad

filterPrimeM :: MonadPlus m => Integer -> m Integer
filterPrimeM n
    | n < 2     = mzero
    | and [ n `mod` x /= 0 | x <- [2..n-1] ] = return n
    | otherwise = mzero

searchPrime :: MonadPlus m => [Integer] -> m Integer
searchPrime = foldr (mplus . filterPrimeM) mzero

main :: IO()
main = do
  print $ (filterPrimeM 5 :: Maybe Integer)
  print $ (filterPrimeM 6 :: Maybe Integer)
  print $ (filterPrimeM 5 :: [Integer])
  print $ (filterPrimeM 6 :: [Integer])
  print $ (searchPrime [1..99] :: Maybe Integer)
  print $ (searchPrime [1..99] :: [Integer])
