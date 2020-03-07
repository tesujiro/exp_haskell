import Data.Function
import Data.List

main :: IO ()
main = do
   print $ sort [2,1,3]
   print $ sort [(1, 'X'), (2, 'Y'), (3, 'Z')]
   print $ sort [((3,1),'X'),((2,1),'a'),((2, 2),'Y'), ((1, 3), 'Z'),((1,1),'b')]
   print $ (groupBy((==) `on` (fst .fst)) . sort) [((3,1),'X'),((2,1),'a'),((2, 2),'Y'), ((1, 3), 'Z'),((1,1),'b')]
   print $ (map (map snd) . groupBy((==) `on` (fst .fst)) . sort) [((3,1),'X'),((2,1),'a'),((2, 2),'Y'), ((1, 3), 'Z'),((1,1),'b')]
   print $ (map (map snd) . transpose . groupBy((==) `on` (fst .fst)) . sort) [((3,1),'X'),((2,1),'a'),((2, 2),'Y'), ((1, 3), 'Z'),((1,1),'b')]
