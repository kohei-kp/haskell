putW, putX :: IO ()
putW = putStrLn "W"
putX = putStrLn "X"

makePutY, makePutZ :: IO (IO ())
makePutY = return $ putStrLn "Y"
makePutZ = return $ putStrLn "Z"

main :: IO ()
main = do
  let w = putW
      x = putX

  w -- wが表示される

  -- xがputXに束縛されているが、mainに紐付けられていないのでXは表示されない

  putY <- makePutY -- 生成したYを表示するI/OアクションputYをmainを紐付けていないのでYは表示されない

  putZ <- makePutZ
  putZ -- 生成したI/OアクションputZをmainへ紐付けるとZが表示される
