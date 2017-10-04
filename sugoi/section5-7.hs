-- 5.7 関数合成

-- ポイントフリースタイル
sum' :: (Num a) => [a] -> a
sum' xs = foldl (+) 0 xs

sum2' :: (Num a) => [a] -> a
sum2' = foldl (+) 0

fn x = ceiling (negate (tan (cos (max 50 x))))

fn' = ceiling . negate . tan . cos . max 50

oddSquareSum :: Integer
oddSquareSum = sum (takeWhile (<10000) (filter odd (map (^2) [1..])))

oddSquareSum' :: Integer
oddSquareSum'  = sum . takeWhile (<10000) . filter odd $ map (^2) [1..]
main = do

  print $ map (\x -> negate (abs x)) [5,-3,-6,7,-3,2,-19,24]
  -- 関数合成を使う
  print $ map (negate . abs) [5,-3,-6,7,-3,2,-19,24]

  print $ map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
  print $ map (negate . sum . tail) [[1..5],[3..6],[1..7]]

  -- 他引数関数の関数合成
  print $ sum (replicate 5 (max 6.7 8.9))
  print $ (sum . replicate 5) (max 6.7 8.9)
  print $ sum . replicate 5 $ max 6.7 8.9

  print $ replicate 2 (product (map (*3) (zipWith max [1,2] [4,5])))
  print $ replicate 2 . product . map (*3) $ zipWith max [1,2] [4,5]

  print $ zipWith max [1,2] [4,5]
  print $ map (*3) $ zipWith max [1,2] [4,5]
  print $ product . map (*3) $ zipWith max [1,2] [4,5]
  print $ replicate 2 . product . map (*3) $ zipWith max [1,2] [4,5]


