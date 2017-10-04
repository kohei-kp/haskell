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

-- Flip
-- filp' :: (a -> b -> c) -> (b -> a -> c)
-- flip' f = g
--   where g x y = f y x
flip' :: (a -> b -> c) -> b -> a -> c
flip' f y x = f x y

main = do

  print $ applyTwice (+3) 10
  print $ applyTwice (++ " HANA") "HEY"
  print $ applyTwice ("HANA " ++) "HEY"
  print $ applyTwice (multThree 2 2) 9
  print $ applyTwice (3:) [1] -- [3,3,1]

  print $ zipWith' (+) [4,2,5,6] [2,6,2,3]
  print $ zipWith' max [6,3,2,1] [7,3,1,5]
  print $ zipWith' (++) ["foo ", "bar ", "baz "] ["fighters", "hoppers", "aldrin"]
  print $ zipWith' (zipWith' (*)) [[1,2,3],[3,5,6],[2,3,4]] [[3,2,2],[3,4,5],[5,4,3]]

  print $ zip [1,2,3,4,5] "hello"
  print $ flip' zip [1,2,3,4,5] "hello"
  print $ zipWith div [2,2..] [10,8,6,4,2]
  print $ zipWith (flip' div) [2,2..] [10,8,6,4,2]
