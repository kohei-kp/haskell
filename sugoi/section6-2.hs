-- 6.2 標準モジュールの関数で問題を解く
import Data.List
import Data.Char

wordNums :: String -> [(String, Int)]
wordNums = map (\ws -> (head ws, length ws)) . group . sort . words
-- 関数合成なしで書くと
-- wordNums xs = map (\ws -> (head ws, length ws)) (group (sort (words xs))

isIn :: (Eq a) => [a] -> [a] -> Bool
needle `isIn` haystack = any (needle `isPrefixOf`) (tails haystack)

-- 指定された数だけ前方向にシフトする
encode :: Int -> String -> String
encode offset msg = map (\c -> chr $ ord c + offset) msg

-- 指定された数だけ後方向にシフトする
decode :: Int -> String -> String
decode shift msg = encode (negate shift) msg

digitSum :: Int -> Int
digitSum = sum . map digitToInt . show

-- 各桁の合計が40になる最初の数
firstTo40 :: Maybe Int
firstTo40 = find (\x -> digitSum x == 40) [1..]

-- 一般化
firstTo :: Int -> Maybe Int
firstTo n = find (\x -> digitSum x == n) [1..]

main = do 
  -- 単語を数える
  -- words関数 空白で区切ってリスト化
  print $ words "hey these are the words in this centence"

  -- 同じ単語をグループ化する
  print $ group [1,1,1,1,2,2,2,2,3,3,2,2,2,5,6,7]

  -- 同じ要素が隣接していないときはboomを含むリストが複数得られる
  print $ group ["boom","bip","bip","boom","boom"]

  -- ソートしてからやると解決
  print $ sort ["boom","bip","bip","boom","boom"]
  print $ wordNums "boom bip bip boom boom"

  -- 干し草の山から針を探す
  -- 2つのリストを受け取り、1つ目のリストが2つ目のリストのどこに含まれているか
  print $ tails "party"
  print $ tails [1,2,3]

  -- isPrefixOf → 二つ目のリストが一つ目のリストで始まっているか
  print $ "hawaii" `isPrefixOf` "hawaii joe"
  print $ "haha" `isPrefixOf` "ha"
  print $ "ha" `isPrefixOf` "ha"

  -- any 述語とリストを受け取って、要素のどれかが述語を満たすか
  print $ any (> 4) [1,2,3]
  print $ any (=='F') "Frank Sobotka"
  print $ any (\x -> x > 5 && x < 10) [1,4,11]

  -- 組み合わせる
  print $ "art" `isIn` "party"
  print $ [1,2] `isIn` [1,3,5]

  -- Data.ListにisInと同じ関数が。。。
  print $ "art" `isInfixOf` "party"
  print $ [1,2] `isIn` [1,3,5]

  -- シーザー暗号
  print $ ord 'a' -- Unicodeテーブルの何番目か
  print $ chr 97  -- 対応する文字

  print $ map ord "abcdefgh"

  print $ encode 3 "hey mark"
  print $ encode 5 "please instruct your men"
  print $ encode 1 "to party hard"

  print $ decode 3 "kh|#pdum"
  print $ decode 5 "ugjfxj%nsxywzhy%~tzw%rjs"
  print $ decode 1 "up!qbsuz!ibse"

  -- 正格な左畳み込みにて
  -- foldlはコンピュータのメモリの特定の領域を使いすぎたときに起こるスタックオーバーフローを引き起こすことがある。
  -- 問題なし
  print $ foldl (+) 0 (replicate 100 1)
  -- スタックオーバーフローする? 100万個(しなかった)
  print $ foldl (+) 0 (replicate 1000000 1)

  -- Data.Listにfoldl'がある(評価遅延させずすぐに評価する)
  print $ foldl' (+) 0 (replicate 1000000 1)

  -- かっこいい数を見つけよう
  print $ digitToInt '2'
  print $ digitToInt 'F'
  -- print $ digitToInt 'z'

  print $ firstTo40

  print $ firstTo 27
  print $ firstTo 1
  print $ firstTo 13
