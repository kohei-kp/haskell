-- section3 関数の構成
-- 3.1 パターンマッチ

-- 渡された数が7かを調べる 7以外だと xの方になる
lucky :: Int -> String
lucky 7 = "LUCKY NUMBER SEVEN!"
lucky x = "Sorry, you're out of luck, pal!"

-- 1から5は単語として出力して、それ以外はエラーメッセージ ifで書くと辛い
-- パターンマッチだと
sayMe :: Int -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

-- factrialを再帰的に定義する
factrial :: Int -> Int
factrial 0 = 1
factrial n = n * factrial (n - 1)

-- パターンマッチが失敗するとき
charName :: Char -> String
charName 'a' = "Albert"
charName 'b' = "Broseph"
charName 'c' = "Cecil"

-- タプルのパターンマッチ
-- 2つの二次元空間のベクトルを受け取り、足し合わせる
-- パターンマッチを使わない場合...
-- addVectors (Double, Double) -> (Double, Double) -> (Double, Double)
-- addVectors a b = (fst a + fst b, snd a + snd b)

-- パターンマッチを使った場合
addVectors :: (Double, Double) -> (Double, Double) -> (Double, Double)
addVectors (x1, y1) (x2, y2) = (x1 + x2, y1 + y2)

-- トリプルの3番目を取り出す関数
first :: (a, b, c) -> a
first (x, _, _) = x

second :: (a, b, c) -> b
second (_, y, _) = y

third :: (a, b, c) -> c
third (_, _, z) = z

-- 独自のhead関数を作ってみる
head' :: [a] -> a
head' [] = error "Can't call head on an empty list, dummy!"
head' (x:_) = x

-- リストの要素を回りくどくて不便な書式で出力する関数w
tell :: (Show a) => [a] -> String
tell [] = "The list is empty"
tell (x:[]) = "The list has one element: " ++ show x
tell (x:y:[]) = "The list has two elements: " ++ show x ++ " and " ++ show y
tell (x:y:_) = "This list is long. The first two elements are: " ++ show x ++ " and " ++ show y

-- 3要素のリストを扱う方法しか知らない関数
badAdd :: (Num a) => [a] -> a
badAdd (x:y:z:[]) = x + y + z

-- asパターン
-- パターンマッチの対象になった値自体を参照できる
firstLetter :: String -> String
firstLetter "" = "Empty string, whoops!"
firstLetter all@(x:xs) = "The first letter of " ++ all ++ " is " ++ [x]

main = do
  print $ lucky 7
  print $ lucky 5

  print $ sayMe 4
  print $ sayMe 6

  print $ factrial 5

  print $ charName 'b'
  -- 予期していない値が入力されるとエラーになる
  -- print $ charName 'h'

  -- パターンを作るときは、すべてに合致するパターンを入れておく

  print $ addVectors (2, 4) (3, 5)

  print $ first (1, 2, 3)
  print $ second (1, 2, 3)
  print $ third (1, 2, 3)

  -- リスト内包表記でパターンマッチ
  let xs = [(1,3), (4,3), (2,4), (5,3), (5,6), (3,1)]
  print $ [a + b | (a, b) <- xs]
  print $ [x * 100 + 3 | (x, 3) <- xs]

  -- x:xsというパターンはリストの先頭をxに束縛、残りをxsに束縛
  -- haskellプログラマはx:xsを再帰でよく使うらしい?

  print $ head' [4,5,6]
  print $ head' "Hello"

  print $ tell [1]
  print $ tell [True, False]
  print $ tell [1..4]
  -- print $ tell [] --なんかエラーなる No instance for (Show a... 型が悪い・・・?

  -- 予期しないリストを与えるとエラー
  -- print $ badAdd [100, 20]

  print $ firstLetter "Dracula"
