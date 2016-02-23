-- 1.4 リスト内包表記

-- 10以上の奇数をBANGに置き換え、10より小さい数はBOOMに置き換える
-- odd 奇数が与えられたらtrue, でないときはfalse
boomBangs xs = [ if x < 10 then "BOOM!" else "BANG!" | x <- xs, odd x]

-- リスト内包表記を使って、lengthを独自定義
-- _は取り出した値を使用しないので、使い捨てのため
length' xs = sum [1 | _ <- xs]

-- 大文字だけを残す
removeNonUppercase st = [c | c <- st, c `elem` ['A'..'Z']]

main = do
  -- 1..10のリストから、xが値を受け取る
  print $ [x*2 | x <- [1..10]] -- 2倍した値のリスト

  -- 12以上のものからなるリストがほしい
  print $ [x*2 | x <- [1..10], x*2 >= 12]

  -- 50から100のうち、7で割った余りが3である数のリスト
  print $ [x | x <- [50..100], x `mod` 7 == 3]

  -- 10以上の奇数をBANGに置き換え、10より小さい数はBOOMに置き換える
  print $ boomBangs [7..13]

  -- カンマで区切ると、述語を増やせる
  -- 10から20で13, 15, 19でない数
  print $ [x | x <- [10..20], x /= 13, x /= 15, x /= 19]

  -- 複数のリストから値を取り出す
  print $ [x+y | x <- [1,2,3], y <- [10,100,1000]]
  print $ [x*y | x <- [2,5,10], y <- [8,10,11]]

  -- 50より大きいもの
  print $ [x*y | x <- [2,5,10], y <- [8,10,11], x*y > 50]

  -- 形容詞と名刺のリストを組み合わせて変な言葉を
  let nouns = ["hobo", "frog", "pope"]
  let adjectives = ["lazy", "grouchy", "scheming"]
  print $ [adjective ++ " " ++ noun | adjective <- adjectives, noun <- nouns]

  -- length'
  print $ length' [1..10]

  -- 大文字だけを残す
  print $ removeNonUppercase "Hahaha! Ahaha!"
  print $ removeNonUppercase "IdontLIKEFROGS"

  -- 数のリストから、リストのままで奇数だけを取り除く
  let xxs = [[1,3,5,2,3,1,2,4,5], [1..9], [1,2,4,2,1,6,3,1,3,2,3,6]]
  print $ [ [x | x <- xs, even x ] | xs <- xxs]
