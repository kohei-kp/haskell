-- Headと残りの要素の最大値でどちらが大きいかを調べる
maximum' :: (Ord a) => [a] -> a
maximum' [] = error "maximum of empty list!"
maximum' [x] = x
maximum' (x:xs) = max x (maximum' xs)

main = do
  print $ maximum' [2,5,1,6]
