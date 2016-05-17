-- 5.5 畳み込み

-- foldl 左畳み込み

-- 0はアキュムレータの初期値 xsは畳み込みたいリスト
sum' :: (Num a) => [a] -> a
sum' xs = foldl (\acc x -> acc + x) 0 xs

-- カリー化を踏まえる
sum2' :: (Num a) => [a] -> a
sum2' = foldl (+) 0

-- foldr 右畳み込み
map' :: (a -> b) -> [a] -> [b]
map' f xs = foldr (\x acc -> f x : acc) [] xs

-- 左畳みで
map2' :: (a -> b) -> [a] -> [b]
map2' f xs = foldl (\acc x -> acc ++ [f x]) [] xs

-- 右
elem' :: (Eq a) => a -> [a] -> Bool
elem' y ys = foldr (\x acc -> if x == y then True else acc) False ys

maximum' :: (Ord a) => [a] -> a
maximum' = foldl1 max

reverse' :: [a] -> [a]
reverse' = foldl (\acc x -> x : acc) []

reverse'' :: [a] -> [a]
reverse'' = foldl (flip (:)) []

product' :: (Num a) => [a] -> a
product' = foldl (*) 1

filter' :: (a -> Bool) -> [a] -> [a]
filter' p = foldr (\x acc -> if p x then x : acc else acc) []

last' :: [a] -> a
last' = foldl1 (\_ x -> x)

-- 無限リストを畳み込む
and' :: [Bool] -> Bool
and' xs = foldr (&&) True xs

-- スキャン
sqrtSums :: Int
sqrtSums = length (takeWhile (<1000) (scanl1 (+) (map sqrt [1..]))) + 1

main = do

  print $ sum' [3,5,2,1]
  print $ sum2' [3,5,2,1]

  print $ map' (+3) [1,2,3]

  print $ and' (repeat False)

  print $ scanl (+) 0 [3,5,2,1]
  print $ scanr (+) 0 [3,5,2,1]
  print $ scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1]
  print $ scanl (flip (:)) [] [3,2,1]

  print $ sqrtSums
