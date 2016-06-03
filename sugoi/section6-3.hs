-- 6.3 キーから値へのマッピング
import qualified Data.Map as Map
import Data.Char

-- 与えられたキーに対して値を検索
findKey :: (Eq k) => k -> [(k, v)] -> v
findKey key xs = snd . head . filter (\(k, v) -> key == k) $ xs

-- クラッシュしないようにする
findKey' :: (Eq k) => k -> [(k, v)] ->  Maybe v
findKey' key [] = Nothing
findKey' key ((k, v) :xs)
  | key == k  = Just v
  | otherwise = findKey' key xs

-- 畳み込みで実装する
findKey'' :: (Eq k) => k -> [(k, v)] -> Maybe v
findKey'' key xs = foldr
  (\(k, v) acc -> if key == k then Just v else acc) Nothing xs

phoneBook' :: Map.Map String String
phoneBook' = Map.fromList $
  [("betty", "555-2938")
  ,("bonnie", "452-2928")
  ,("patsy", "493-2928")
  ,("patsy", "333-2928")
  ,("lucille", "205-2928")
  ,("wendy", "939-8282")
  ,("penny", "853-2492")
  ]

string2digits :: String -> [Int]
string2digits = map digitToInt . filter isDigit

-- fromListWithだと重複が削除されない
-- 重複時にどうするかの関数を受け取る
phoneBookToMap :: (Ord k) => [(k, String)] -> Map.Map k String
phoneBookToMap xs = Map.fromListWith add xs
  where add number1 number2 = number1 ++ ", " ++ number2

main = do 
  let phoneBook = [("betty", "555-2938") ,("bonnie", "452-2928") ,("patsy", "493-2928") ,("lucille", "205-2928") ,("wendy", "939-8282") ,("penny", "853-2492") ]

  print $ findKey "betty" phoneBook
  -- ないキーを検索したらエラー
  -- print $ findKey "a" phoneBook

  -- ないキー検索したらNothing
  print $ findKey' "a" phoneBook

  print $ findKey'' "a" phoneBook
  print $ findKey'' "betty" phoneBook


  -- fromListで遊ぶ
  print $ Map.fromList [(3, "shoes"), (4, "trees"), (9, "bees")]
  -- 重複キーがあると、後の方が使われる
  print $ Map.fromList [("MS", 1), ("MS", 2), ("MS", 3)]

  print $ Map.lookup "betty" phoneBook'
  print $ Map.lookup "wendy" phoneBook'
  print $ Map.lookup "grace" phoneBook'

  -- phonebookに挿入する
  let newBook = Map.insert "grace" "341-9021" phoneBook'
  print $ Map.lookup "grace" newBook

  -- いくつあるか
  print $ Map.size phoneBook'
  print $ Map.size newBook

  print $ string2digits "948-9282" -- [9,4,8,9,2,8,2]

  -- Intのリストで電話番号を表現する
  let intBook = Map.map string2digits phoneBook'
  print $ Map.lookup "betty" intBook

  print $ phoneBookToMap phoneBook'
