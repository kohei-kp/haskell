-- 2.4 型クラス初級講座
-- GHCiで
-- :t (==)

main = do
  -- Eq型クラス 等価性をテストできる型に使われる == /=
  print $ 5 == 5
  print $ 5 /= 5
  print $ 'a' == 'a'
  print $ "Ho Ho" == "Ho Ho"
  print $ 3.432 == 3.432

  -- Ord型クラス 何らかの順序を付けられる型のための型クラス
  -- :t (>)
  print $ "Abrakadabra" < "Zebra"

  -- compare 比べる GT, LT, EQでどれか
  print $ "Abrakadabra" `compare` "Zebra"

  print $ 5 >= 2
  print $ 5 `compare` 3
  print $ 'b' > 'a'

  -- Show型クラス show型クラスは文字列として表現できる
  -- show 指定した値を文字列として表示する
  print $ show 3
  print $ show 5.334
  print $ show True

  -- Read型クラス showの対。
  -- read 文字列を受け取り、readのインスタンスの型の値を返す
  print $ read "True" || False
  print $ read "8.2" + 3.2
  print $ read "5" - 2
  print $ read "[1,2,3,4]" ++ [3]

  -- print $ read "4" エラー
  -- 何を返せば良いかが分からない
  -- :t read

  -- 型注釈
  print $ (read "5" :: Int)
  print $ (read "5" :: Float)
  print $ ((read "5" :: Float) * 5)
  print $ (read "[1,2,3,4]" :: [Int])
  print $ (read "(3, 'a')" :: (Int, Char))

  -- Enum型クラス 要素の値を列挙できる型
  print $ ['a'..'e']
  print $ [LT .. GT]
  print $ [3..5]
  print $ succ 'B'

  -- Bounded型クラス 上限と下限を持ち、minBound, maxBoundで調べることができる
  print $ (minBound :: Int)
  print $ (maxBound :: Char)
  print $ (maxBound :: Bool)
  print $ (minBound :: Bool)
  print $ (maxBound :: (Bool, Int, Char))

  -- Num型クラス 数のように振る舞う
  -- Int, Integer, Float, Doubleなど
  -- :t 20
  -- :t (*)
  -- (*) :: (Num a) => a -> a -> a

  -- Floating型クラス 浮動小数点に使う

  -- Integral型クラス 整数(全体)のみ
  print $ fromIntegral (length [1..4]) + 3.2


