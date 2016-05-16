-- 5.3 関数プログラマの道具箱

quicksort :: (Ord a) => [a] -> [a]
quicksort [] = []
quicksort (x:xs) =
  let smallerOrEqual = filter (<= x) xs
      larger = filter (> x) xs
  in quicksort smallerOrEqual ++ [x] ++ quicksort larger

-- 10万以下の数のうち3829で割り切れる最大の数
largestDivisible :: Integer
largestDivisible = head (filter p [100000,99999..])
  where p x = x `mod` 3829 == 0

-- コラッツ列
-- 任意の自然数から開始
-- 数が1なら終了
-- 数が偶数なら2で割る
-- 奇数なら3倍して1を足す
-- 新しい値で繰り返す
chain :: Integer -> [Integer]
chain 1 = [1]
chain n
  | even n = n : chain (n `div` 2)
  | odd n  = n : chain (n * 3 + 1)

numLongChains :: Int
numLongChains = length (filter isLong  (map chain [1..100]))
  where isLong xs = length xs > 15

main = do

  -- map
  print $ map (+3) [1,5,3,1,6]
  print $ map (++ "!") ["BIFF", "BANG", "POW"]
  print $ map (replicate 3) [3..6]
  print $ map (map (^2)) [[1,2],[3,4,5,6],[7,8]]
  print $ map fst [(1,2), (3,5), (6,3), (2,6), (2,5)]

  -- filter
  print $ filter (>3) [1,5,3,2,1,6,4,3,2,1]
  print $ filter (==3) [1..5]
  print $ filter even [1..10]

  -- let notNull x = not (null x) in filter notNull [[1,2,3], [], [3,4,5], [2,2], [], [], []]

  print $ filter (`elem` ['a'..'z']) "u  LaUgH aT mE BeCaUsE I aM diFfeRent"
  print $ filter (`elem` ['A'..'Z']) "i LAuGh at you bEcause u R all the same"

  print $ filter (<15) (filter even [1..20])
  -- リスト内包表記
  print $ [x | x <- [1..20], x < 15, even x]

  print $ quicksort [3,4,5,8,4,4,1,46,6]

  print $ largestDivisible

  print $ takeWhile(/= ' ') "elephants know how to party"

  -- 10000より小さいすべての奇数の平方数の和
  print $ sum (takeWhile (< 10000) (filter odd (map (^2) [1..])))
  -- リスト内包表記
  print $ sum (takeWhile (< 10000) [m | m <- [n^2 | n <- [1..]], odd m])

  print $ chain 10
  print $ chain 1
  print $ chain 30

  print $ numLongChains

  let listOfFunc = map (*) [0..]
  print $ (listOfFunc !! 4) 5
