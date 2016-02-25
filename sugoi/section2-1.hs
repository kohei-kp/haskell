-- section 2 型を信じろ!
-- 2.1 明示的な型宣言

-- 型宣言を行う
removeNonUppercase :: [Char] -> [Char]
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

addThree :: Int -> Int -> Int -> Int
addThree x y z = z + y + z

main = do
  -- GHCiで:tコマンドに続けて式を入力すると型を知ることができる
  -- :t 'a'

  print $ removeNonUppercase "AiiA"

  print $ addThree 2 5 4
