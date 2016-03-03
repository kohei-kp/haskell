-- 3.5 case式

-- case expression of pettern -> result
--                    pettern -> result
--                    ...

-- ↓2つは全く同じ
head' :: [a] -> a
head' [] = error "No head for empty lists!"
head' (x:_) = x

head2' :: [a] -> a
head2' xs = case xs of [] -> error "No head for empty lists2!"
                       (x:_) -> x

describeLiset :: [a] -> String
describeLiset ls = "The list is " 
                   ++ case ls of [] -> "empty."
                                 [x] -> "a singleton list."
                                 xs -> "a longer list."

describeLiset' :: [a] -> String
describeLiset' ls = "The list is " ++ what ls
  where what [] = "empty."
        what [x] = "a singleton list."
        what xs = "a longer list."

main = do
  print $ head2' [1]
  print $ head' [2]

  print $ describeLiset []
  print $ describeLiset' [1]

