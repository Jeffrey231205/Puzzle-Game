module Game.Menu where

import Game.Game (newGame)
import Game.History

mainMenu :: IO ()
mainMenu = do
    putStrLn ""
    putStrLn "[=====================================]"
    putStrLn "|              VAINUESS               |"
    putStrLn "[=====================================]"
    putStrLn "| 1. New Game                         |"
    putStrLn "| 2. History                          |"
    putStrLn "| 3. Quit                             |"
    putStrLn "[=====================================]"
    putStr   "Please select an option (1, 2 or 3): "
    ch <- getLine
    case ch of
        "1" -> do
            newGame
            mainMenu
        "2" -> do
            showHistory
            askReturn
        "3" -> quitProgram
        _   -> do
            putStrLn "Invalid."
            mainMenu


askReturn :: IO ()
askReturn = do
    putStrLn ""
    putStrLn "Do you want to go back? (Yes/No)"
    ans <- getLine
    case ans of
        "Yes" -> mainMenu
        "yes" -> mainMenu
        "Y"   -> mainMenu
        "y"   -> mainMenu
        "No"  -> quitProgram
        "no"  -> quitProgram
        "N"   -> quitProgram
        "n"   -> quitProgram
        _     -> do
            putStrLn "Invalid."
            askReturn


quitProgram :: IO ()
quitProgram = do
    putStrLn "Exiting......"
    putStrLn "GoodBye, Have a Nice Day!"
