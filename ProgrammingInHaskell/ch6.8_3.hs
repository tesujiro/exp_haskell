and2 :: [Bool] -> Bool
and2 [b] = b
and2 (True:xs) = and2 xs
and2 (False:xs) = False

main = do
    print $ and2 [True,False]
    print $ and2 [True,True,True]
    print $ and2 [True,True,False]
    print $ and2 [False,True,True]
