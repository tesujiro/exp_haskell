all' :: ( a -> Bool ) -> [a] -> Bool
all' p []  = True
all' p (x:xs) | p x       = all' p xs
              | otherwise = False

any' :: ( a -> Bool ) -> [a] -> Bool
any' p []  = False
any' p (x:xs) | p x       = True
              | otherwise = any' p xs

main = do
    print $ all' even [2,4,6,8]
    print $ all' even [2,4,6,7]
    print $ any' odd  [2,4,6,8]
    print $ any' even [2,4,6,8]
    print $ any' even [2,4,6,7]
