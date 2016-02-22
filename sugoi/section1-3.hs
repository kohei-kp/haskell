-- 1.3 リスト入門

main = do
  -- 名前を定義するときは let
  let lostNumbers = [4, 8, 15, 16, 23, 42]
  print $ lostNumbers

  -- リスト連結 ++ で連結
  print $ [1,2,3,4] ++ [9,10,11,12]
  -- haskellでは文字列はリストとして表されている
  print $ "Hello" ++ " " ++ "world"
  print $ ['w', 'o'] ++ ['o', 't']

  -- ++ は長いリストを扱うときは注意する (左辺を最後まで操作するため)
  -- リストの先頭に何かを追加するときは :(cons演算子)を使う
  print $ 'A':" SMALL CAT"
  print $ 5:[1,2,3,4,5]

  -- リスト要素へのアクセス
  -- 先頭からの位置で取得 !!演算子
  print $ "Steve Bescemi" !! 6
  print $ [9.4, 33.2, 96.2, 11.2, 23.25] !! 1

  -- リストの中のリスト
  -- 違う型は許されない
  let b = [[1,2,3,4], [5,3,3,3], [1,2,2,3,4], [1,2,3]]
  print $ b

  print $ b ++ [[1,1,1,1]]
  print $ [6,6,6]:b
  print $ b !! 2

  -- リストの比較
  print $ [3,2,1] > [2,1,0]
  print $ [3,2,1] > [2,10,100]
  print $ [3,4,2] < [3,4,3]
  print $ [3,4,2] > [2,4]
  print $ [3,4,2] == [3,4,2]

  -- さらなるリスト操作
  -- head 先頭要素を返す
  print $ head [5,4,3,2,1]

  -- tail 先頭を取り除いた残りを返す
  print $ tail [5,4,3,2,1]

  -- last 最後の要素を返す
  print $ last [5,4,3,2,1]

  -- init 最後の要素を取り除いた残りを返す
  print $ init [5,4,3,2,1]

  -- print $ head [] 頭がないからエラー

  -- length リストの長さを返す
  print $ length [5,4,3,2,1]

  -- null リストが空かどうか
  print $ null [1,2,3]
  print $ null []

  -- reverse リストを逆順に
  print $ reverse [5,4,3,2,1]

  -- take 先頭から指定された数を要素を取り出す
  print $ take 3 [5,4,3,2,1]
  print $ take 1 [3,9,3]
  print $ take 5 [1,2] -- 全て返す
  print $ take 0 [6,6,6] -- 空が返る

  -- drop 指定された数の要素を先頭から削除
  print $ drop 3 [8,4,2,1,5,6]
  print $ drop 0 [1,2,3,4] -- 全て返る
  print $ drop 100 [1,2,3,4] -- 空

  -- maximum リストの中の最大の要素を返す
  -- minimum リストの中の最初の要素を返す
  print $ maximum [1,9,2,3,4]
  print $ minimum [8,4,2,1,5,6]

  -- sum リスト内の和を返す
  -- product リスト内の積を返す
  print $ sum [5,2,1,6,3,2,5,7]
  print $ product [6,2,1,2]
  print $ product [1,2,5,6,7,9,2,0]

  -- elem リストに含まれているかどうか
  print $ 4 `elem` [3,4,5,6]
  print $ 10 `elem` [3,4,5,6]
