-- 6.1 モジュールをインポートする
import Data.List

-- 読み込みたい関数を指定する
-- import Data.List (nub, sort)

-- 読み込みたくない関数を指定、それ以外は全てインポート
-- import Data.List hiding (nub)

-- 修飾つきインポート
-- import qualified Data.Map
-- 名前をつけるなら
-- import qualified data.Map as M


-- データにユニークな値がいくつあるか
numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub -- nubはData.Listがエクスポートする関数

main = do 
  print $ numUniques [1,1,1,3,3,6,4,5]

