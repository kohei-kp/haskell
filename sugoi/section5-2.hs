-- 5.2 高階実演

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

-- zipWith
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' _ [] _ = []
zipWith' _ _ [] = []
zipWith' f (x:xs) (y:ys) = f x y : zipWith' f xs ys

main = do

  print $ applyTwice (+3) 10
  print $ applyTwice (++ " HANA") "HEY"
  print $ applyTwice ("HANA " ++) "HEY"
  print $ applyTwice (multThree 2 2) 9
  print $ applyTwice (3:) [1] -- [3,3,1]

  print $ zipWith' (+) [4,2,5,6] [2,6,2,3]
