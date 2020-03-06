import Data.List
import Data.Function

main :: IO ()
main = do
   print $ maximumBy compare [1,3,2]
   print $ maximumBy compare [(1,"X"),(3,"Y"),(2,"Z")]
   print $ maximumBy compare [("X",1),("Y",3),("Z",2)]
   print $ maximumBy (compare `on` snd) [("X",1),("Y",3),("Z",2)]
