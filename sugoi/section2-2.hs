-- 2.2 一般的なHaskellの型

-- Integer とても大きな数
factrial :: Integer -> Integer
factrial n = product [1..n]

-- Float 単精度浮動小数点
circumference :: Float -> Float
circumference r = 2 * pi * r

-- Double 倍精度浮動小数点
circumference' :: Double -> Double
circumference' r = 2 * pi * r

main = do
  print $ factrial 50

  print $ circumference 4.0
  print $ circumference' 4.0

  -- let で宣言するとこんな感じ
  -- let {
  --   factrial :: Integer -> Integer;
  --   factrial n = product [1..n];
  -- }
