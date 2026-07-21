module Game.Game where

import Game.SkinData (skins, getTip)
import Game.Utils (normalize, makeHints, permuteBy)
import Game.History
import System.IO

newGame :: IO ()
newGame = do
    putStr "Enter your name: "
    player <- getLine

    let rotation = sum (map fromEnum player)
    let shuffled = permuteBy player rotation skins

    (score, _) <- playAll shuffled player rotation 5 0

    putStrLn ""
    putStrLn "[=====================================]"
    putStrLn "|               RESULT                |"
    putStrLn "[=====================================]"

    putStrLn ("| Player : " ++ player ++ takePlayerSpace player ++ "|")
    putStrLn ("| Score  : " ++ show score ++ " / 75" ++ scoreSpaces score ++ "|")

    putStrLn "[=====================================]"

    saveHistory player score


takePlayerSpace :: String -> String
takePlayerSpace name =
    let spaces = "                           "
    in drop (length name) spaces

scoreSpaces :: Int -> String
scoreSpaces s =
    let spaces = "                           "
        txt = show s ++ " / 75"
    in drop (length txt) spaces


playAll :: [String] -> String -> Int -> Int -> Int -> IO (Int, Int)
playAll [] _ _ attempts score = return (score, attempts)
playAll _ _ _ attempts score | attempts <= 0 = return (score, 0)
playAll (s:rest) player rotation attempts score = do
    (pts, cont, newAtts) <- playSingle s player rotation attempts
    let newScore = score + pts
    if cont
        then playAll rest player rotation newAtts newScore
        else return (newScore, newAtts)


playSingle :: String -> String -> Int -> Int -> IO (Int, Bool, Int)
playSingle secret player rotation attempts =
    loop secret (makeHints secret rotation) 1 attempts


loop :: String -> [String] -> Int -> Int -> IO (Int, Bool, Int)
loop secret hints hintIndex attempts =
    if attempts <= 0 then do
        putStrLn "Out of attempts! GAME OVER!"
        return (0, False, 0)
    else do
        let hintText = hints !! (hintIndex - 1)
        let tipText  = getTip secret

        putStrLn ""
        putStrLn "[=====================================]"
        putStrLn "|           Guess the Skin            |"
        putStrLn "[=====================================]"
        putStrLn ("Hint: " ++ hintText)
        putStrLn ("Tip : " ++ tipText)
        putStrLn ("Attempts Left: " ++ show attempts)
        putStrLn "[=====================================]"

        putStr "Guess: "
        guess <- getLine

        if normalize guess == normalize secret
            then return (5, True, attempts)
            else loop secret hints (hintIndex + 1) (attempts - 1)
