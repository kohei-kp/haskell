-- 3.4 let it be
--
-- let式
-- whereは関数の終わりで変数束縛 → 関数全体から見える
-- letはどこでも変数を束縛できる。 let式が作る束縛は局所的で、ガード間では共有されない

-- 円柱の表面積を高さと半径から求める
cylinder :: Double -> Double -> Double
cylinder r h =
  let sideArea = 2 * pi * r * h
      topArea = pi * r ^ 2
  in sideArea + 2 + topArea

-- リスト内包表記でのlet
calcBmis :: [(Double, Double)] -> [Double]
calcBmis xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2]

-- 肥満な人だけ返す (letより後ろのリスト内包表記の全てから見えるため)
calcBmis' :: [(Double, Double)] -> [Double]
calcBmis' xs = [bmi | (w, h) <- xs, let bmi = w / h ^ 2, bmi > 25.0]

main = do
  print $ cylinder 20.0 10.0

  -- letはコード中のほとんどどんな場所でも使える
  print $ 4 * (let a = 9 in a + 1) + 2

  -- letはローカルスコープに関数を作るのに使える
  print $ [let square x = x * x in (square 5, square  3, square 2)]

  -- letはセミコロン区切りを使える。
  print $ (let a = 100; b = 200; c = 300 in a * b * c, let foo = "Hey "; bar = "there!" in foo ++ bar)

  -- let式とパターンマッチでタプルを要素に分解、名前に束縛
  print $ (let (a, b, c) = (1, 2, 3) in a + b + c) * 100

  print $ calcBmis [(75, 19.0)]
  print $ calcBmis [(75, 19.0)]

  -- GHCiでletはinを省略できる
