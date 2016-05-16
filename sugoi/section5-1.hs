-- 5.1 カリー化関数
multThree :: Int -> Int -> Int -> Int
multThree x y z = x * y * z

compareWithHoundred :: Int -> Ordering
compareWithHoundred x = compare 100 x

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

main = do
  print $ multThree 3 5 9

  let multTwoWithNine = multThree 9
  print $ multTwoWithNine 2 3

  print $ compareWithHoundred 99 -- GT

  print $ divideByTen 200
  print $ 200 / 10
  print $ (/10) 200

  print $ isUpperAlphanum 'B' -- True


