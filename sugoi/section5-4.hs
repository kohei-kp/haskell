-- 5.4 ラムダ式

-- numLongChainsのwhereの束縛をラムダ式に変える
--numLongChains :: Int
--numLongChains = length (filter(\xs -> length > 15) (map chain [1..100]))

addTree :: Int -> Int -> Int -> Int
addTree x y z = x + y + z

addTree' :: Int -> Int -> Int -> Int
addTree' = \x -> \y -> \z -> x + y + z

flip' :: (a -> b -> c) -> b -> a -> c
flip' f = \x y -> f y x -- flip' f x y = f y xと同じ

main = do

  -- ふたつは同じ
  print $ map (+3) [1,6,3,2]
  print $ map (\x -> x + 3) [1,6,3,2]

  print $ zipWith (\a b -> (a * 30 + 3) / b) [5,4..1] [1,2..5]

  print $ map (\(a,b) -> a + b) [(1,2), (3,5), (6,3), (2,6), (2,5)]

  print $ zipWith (flip (++)) ["love you", "love me"] ["i ", "you "]
  print $ map (flip subtract 20) [1,2,3,4]
