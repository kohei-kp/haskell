-- 1.6 タプル

main = do
  -- 括弧で囲んで、要素をカンマ区切りに
  print $ (1, 3)
  print $ (3, 'a', "Hello")
  print $ (50, 50.4, "Hello", 'b')

  -- タプルを含んだリストでは、ペアとトリプルは混合できない
  -- [(1,2), (8,11,5), (4,5)] エラー

  -- ペアを使う
  -- ※ fst, sndはペアに対してしか使えない
  -- fst ペアの1つめの要素を返す
  print $ fst (8, 11)
  print $ fst ("Wow", False)

  -- snd 2つめの要素を返す
  print $ snd (8, 11)
  print $ snd ("Wow", False)

  -- zip 2つのリストを1つのペアのリストにする
  print $ zip [1..5] $ take 5 $ repeat 5
  print $ zip [1..5] ["one", "two", "three", "four", "five"]

  -- リストの長さが違う場合は、必要な部分だけが使われる
  print $ zip [5,3,2,6,2,7,2,5,4,6,6] ["im","a","turtle"]

  -- 有限リストと無限リストもzip可能
  print $ zip [1..] ["apple", "orange", "cherry", "mango"]

  -- 直角三角形を見つける
  -- 各要素が10以下のトリプルを作る
  -- let triples = [(a,b,c) | c <- [1..10], a <- [1..10], b <- [1..10]] -- 表示したら大変

  -- ピタゴラスの定理(a^2 + b^2 == c^2)が成り立つかを調べる
  -- 辺bが辺aを超えないように。
  let rightTriangles = [(a,b,c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2]
  print $ rightTriangles

  -- 周辺が24のものだけ出力する
  let rightTriangles' = [(a,b,c) | c <- [1..10], a <- [1..c], b <- [1..a], a^2 + b^2 == c^2, a+b+c == 24]
  print $ rightTriangles'
