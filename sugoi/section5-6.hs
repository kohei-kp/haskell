-- 5.6 $を使った関数適用

main = do

  print $ sum (filter (> 10) (map (*2) [2..10]))
  -- $で置き換える
  print $ sum $ filter (> 10) $ map (*2) [2..10]

  print $ map ($ 3) [(4+), (10*), (^2), sqrt]


