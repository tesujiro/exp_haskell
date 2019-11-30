(^^^) :: Bool -> Bool -> Bool

x ^^^ y = if x && y then True else False

main = do
    print $ True  ^^^ True
    print $ True  ^^^ False
    print $ False ^^^ True
    print $ False ^^^ False
