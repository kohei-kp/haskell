-- 4.2 さらにいくつかの再帰関数

-- replicate
replicate' :: Int -> a -> [a]
replicate' n x
  | n <= 0  = []
  | otherwise = x : replicate' (n - 1) x

-- take
take' :: Int -> [a] -> [a]
take' n _
    | n <= 0 = []
take' _ []   = []
take' n (x:xs) = x : take' (n - 1) xs

-- reverse
reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

-- repeart
repeart' :: a -> [a]
repeart' x = x : repeart' x

-- zip
zip' :: [a] -> [b] -> [(a,b)]
zip' _ [] = []
zip' [] _ = []
zip' (x:xs) (y:ys) = (x,y) : zip' xs ys

-- elem
elem' :: (Eq a) => a -> [a] -> Bool
elem' a [] = False
elem' a (x:xs)
  | a == x    = True
  | otherwise = a `elem` xs

main = do

  print $ replicate' 3 2    -- [2,2,2]
  print $ take' 2 [2,3,4]   -- [2,3]
  print $ reverse' [2,3,4]  -- [4,3,2]
  -- print $ repeart' 3 2
  print $ zip' [2,3] [4,5]  -- [(2,4),(3,5)]
  print $ elem' 2 [3,4,5,2] -- True
