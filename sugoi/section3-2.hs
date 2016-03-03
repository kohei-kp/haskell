-- 3.2 場合分けして、きっちりガード！

-- BMIよって異なる叱り方をする関数
-- | パイプに続く真理値式、trueのときの式 falseになると↓に落ちていく
bmiTell :: Double -> String
bmiTell bmi
  | bmi <= 18.5 = "You're underweight, you emo, you!"
  | bmi <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
  | bmi <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise   = "You're a whale, congratulations!"

-- 身長と体重を受け取るようにして、BMIの計算も行う
bmiTell' :: Double -> Double -> String
bmiTell' weight height
  | weight / height ^ 2 <= 18.5 = "You're underweight, you emo, you!"
  | weight / height ^ 2 <= 25.0 = "You're supposedly normal. Pffft, I bet you're ugly!"
  | weight / height ^ 2 <= 30.0 = "You're fat! Lose some weight, fatty!"
  | otherwise   = "You're a whale, congratulations!"

-- 独自のmax関数を定義する
max' :: (Ord a) => a -> a -> a
max' a b
  | a <= b    = b
  | otherwise = a

-- 独自のcompare
myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
  | a == b    = EQ
  | a <= b    = LT
  | otherwise = GT

main = do
  print $ bmiTell 23.4
  print $ bmiTell' 85 1.90

  print $ 3 `myCompare` 2
