module Game.History where

import System.IO
import Game.Utils (fileExists, padFixed, sortScores, splitNameScoreInt)

saveHistory :: String -> Int -> IO ()
saveHistory name score =
  appendFile "history.txt" (name ++ " " ++ show score ++ "\n")

showHistory :: IO ()
showHistory = do
  exists <- fileExists "history.txt"
  if not exists then do
      putStrLn "[=====================================]"
      putStrLn "|              HISTORY                |"
      putStrLn "[=====================================]"
      putStrLn "|   No history found.                 |"
      putStrLn "[=====================================]"
  else do
      contents <- readFile "history.txt"
      length contents `seq` return ()
      let ls = lines contents
      let pairs = map splitNameScoreInt ls
      let sorted = sortScores pairs
      let rows = zipWith formatLine [1..] (map formatPair sorted)

      putStrLn "[=====================================]"
      putStrLn "|              HISTORY                |"
      putStrLn "[=====================================]"
      putStrLn "| No.   Name               Score      |"
      mapM_ putStrLn rows
      putStrLn "[=====================================]"

formatLine :: Int -> (String, String) -> String
formatLine no (name, scoreStr) =
  let noCol     = padFixed 6 (show no)
      nameCol   = padFixed 20 name
      scoreCol  = padFixed 10 scoreStr
      content   = noCol ++ nameCol ++ scoreCol
  in "| " ++ content ++ "|"


formatPair :: (String, Int) -> (String, String)
formatPair (n, s) = (n, show s)


