-- 1.2 赤ちゃんの最初の関数

-- 数を1つ受け取り、それを2倍する関数
doubleMe x = x + x

-- 2つの引数をそれぞれ2倍してから足す関数
doubleUs x y = x * 2 + y * 2

-- 関数の中で定義した関数を呼ぶ
doubleUs' x y = doubleMe x + doubleMe y

-- 100以下のときだけ2倍する関数
doubleSmallNumber x = if x > 100
                        then x
                        else x * 2

-- 返す値に+1
doubleSmallNumber' x = (if x > 100 then x else x * 2) + 1

-- haskellの関数は大文字から始められない
-- 関数が1つも値を取らないとき、定義とか名前とか言う
conanO'Brien = "It's a-me, Conan O'Brien!"

main = do
  print $ doubleMe 9
  print $ doubleMe 8.3

  print $ doubleUs 4 9
  print $ doubleUs 2.3 34.2
  print $ doubleUs 28 88 + doubleMe 123

  print $ doubleUs' 4 9

  print $ doubleSmallNumber 100
  print $ doubleSmallNumber 101

  print $ doubleSmallNumber' 100
  print $ doubleSmallNumber' 101

  print $ conanO'Brien

