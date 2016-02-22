-- section1
main = do
  -- 1.0
  -- 簡単な計算をしてみる
  print $ 2 + 15
  print $ 49 * 100
  print $ 1892 - 1472
  print $ 5 / 2

  -- 括弧を使って演算の順序を明示する
  print $ (50 * 100) - 4999
  print $ 50 * 100 - 4999
  print $ 50 * (100 - 4999)

  -- ブール代数
  print $ True && False
  print $ True && True
  print $ False || True
  print $ not False
  print $ not (True && True)

  -- 値が等しいか等しくないか
  print $ 5 == 5
  print $ 1 == 0
  print $ 5 /= 5
  print $ 5 /= 4
  print $ "Hello" == "Hello"

  -- 1.1
  -- succ関数を呼び出す
  -- succ = successor(後者)が明確に定義されているものを引数にとり、次を返す
  print $ succ 8
  -- min, max引数のそれぞれ小さいやつ、大きいやつを返す
  print $ min 9 10
  print $ min 3.4 3.2
  print $ max 100 101

  -- 関数の適用は、すべての演算の中で最も高い優先度を持つ
  -- 次の式は等価
  print $ succ 9 + max 5 4 + 1
  print $ (succ 9) + (max 5 4) + 1

  -- 優先度があるから次のように書いても9 * 10の後者は得られない
  print $ succ 9 * 10 -- 100

  print $ succ (9 * 10) -- こうすると91

  -- 関数が2引数のときは、その関数をバッククオートで囲うと中置関数として呼べる
  print $ div 92 10
  print $ 92 `div` 10
