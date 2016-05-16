-- 4.3 クイックソート

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerOrEqual = [a | a <- xs, a <= x]
      larger = [a | a <- xs, a > x]
  in quicksort smallerOrEqual ++ [x] ++ quicksort larger

main = do

  print $ quicksort [10,2,5,3,1,6,7,4,2,3,4,8,9]
  print $ quicksort "the quick brown fox jumps over the lazy dog"

