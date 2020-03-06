
list :: Int -> [(Int, Int)]
list n = do
   i <- [1..n]
   -- let i = [1..n]
   j <- [i+1..n]
   return (i,j)

list' :: Int -> [(Int, Int)]
list' n = [(i,j) | i <- [1..n], j <- [i+1..n]]

main :: IO ()
main = do
    print $ list' 0
    print $ list  0
    print $ list' 3
    print $ list  3
    print $ list' 5
    print $ list  5
