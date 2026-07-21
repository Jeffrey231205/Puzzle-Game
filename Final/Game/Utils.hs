module Game.Utils where

import Prelude hiding (catch)
import System.IO.Error (catchIOError)

fileExists :: FilePath -> IO Bool
fileExists f =
  catchIOError (readFile f >> return True)
               (\_ -> return False)

normalize :: String -> String
normalize [] = []
normalize (x:xs)
  | isAlphaNum x = toLower x : normalize xs
  | otherwise    = normalize xs

isAlphaNum :: Char -> Bool
isAlphaNum c =
  (c >= 'A' && c <= 'Z') ||
  (c >= 'a' && c <= 'z') ||
  (c >= '0' && c <= '9')

toLower :: Char -> Char
toLower c
  | c >= 'A' && c <= 'Z' = toEnum (fromEnum c + 32)
  | otherwise            = c

prng :: Int -> Int -> Int
prng seed i =
  let a = 1103515245
      c = 12345
      modulus = 2147483647
  in (a * (seed + i) + c) `mod` modulus

seedFrom :: String -> Int -> Int
seedFrom s rot = (sum (map fromEnum s) + rot * 97) `mod` 100000

indices :: Int -> [Int]
indices n = go 0 n
  where
    go i m | i >= m    = []
           | otherwise = i : go (i + 1) m


padFixed :: Int -> String -> String
padFixed n s =
  let spaces = replicate n ' '
  in take n (s ++ spaces)


splitNameScoreInt :: String -> (String, Int)
splitNameScoreInt str =
  let ws = words str
      scoreStr = last ws
      name = unwords (init ws)
  in (name, read scoreStr)


scorePairs :: Int -> Int -> [Int] -> [(Int, Int)]
scorePairs seed n xs = [ (i, prng seed i) | i <- xs ]


sortScores :: [(String, Int)] -> [(String, Int)]
sortScores [] = []
sortScores (x:xs) = insertScore x (sortScores xs)

insertScore :: (String, Int) -> [(String, Int)] -> [(String, Int)]
insertScore x [] = [x]
insertScore x (y:ys)
    | snd x >= snd y = x : y : ys
    | otherwise      = y : insertScore x ys


insertBySnd :: (Int,Int) -> [(Int,Int)] -> [(Int,Int)]
insertBySnd x [] = [x]
insertBySnd x (y:ys)
  | snd x <= snd y = x : y : ys
  | otherwise      = y : insertBySnd x ys

sortBySnd :: [(Int,Int)] -> [(Int,Int)]
sortBySnd [] = []
sortBySnd (x:xs) = insertBySnd x (sortBySnd xs)

permuteIndices :: String -> Int -> Int -> [Int]
permuteIndices key rot n =
  let seed  = seedFrom key rot
      idxs  = indices n
      pairs = scorePairs seed n idxs
      sorted = sortBySnd pairs
  in map fst sorted

permuteBy :: String -> Int -> [a] -> [a]
permuteBy key rot xs =
  let n = length xs
      idxs = permuteIndices key rot n
  in [ xs !! i | i <- idxs ]

isVowel :: Char -> Bool
isVowel c =
  let x = toLower c
  in x == 'a' || x == 'e' || x == 'i' || x == 'o' || x == 'u'

consonantIndices :: String -> [Int]
consonantIndices s =
  [ i | (c,i) <- zip s [0..], isAlphaNum c, not (isVowel c) ]

vowelIndices :: String -> [Int]
vowelIndices s =
  [ i | (c,i) <- zip s [0..], isAlphaNum c, isVowel c ]

permuteList :: String -> Int -> [Int] -> [Int]
permuteList secret seed xs =
  let pairs = map (\i -> (i, prng seed i)) xs
      sorted = sortBySnd pairs
  in map fst sorted

buildHint :: String -> [Int] -> String
buildHint s revealSet =
  [ if not (isAlphaNum c) then c
    else if i `elem` revealSet then c else '_'
  | (c,i) <- zip s [0..] ]

increasingReveals :: Int -> [Int]
increasingReveals total =
  let first = if total > 6 then 3 else 1
      lst   = [first, first + 2, first + 4, first + 6, first + 7]
  in map (min (max 0 (total - 1))) lst

makeHints :: String -> Int -> [String]
makeHints secret rotation =
  let cons = consonantIndices secret
      vows = vowelIndices secret
      consShuffled = permuteList secret (rotation + 11) cons
      vowShuffled  = permuteList secret (rotation + 22) vows
      consCount = length cons
      vowCount  = length vows
      consRevealTargets = take 5 (increasingReveals consCount)
      vowRevealTargets  = [0,0, min 1 vowCount, min 3 vowCount, max 0 (vowCount - 1)]
      revealSets = [ take cr consShuffled ++ take vr vowShuffled | (cr,vr) <- zip consRevealTargets vowRevealTargets ]
  in [ buildHint secret rs | rs <- revealSets ]
