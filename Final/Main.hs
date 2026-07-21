module Main where

import System.IO
import Game.Menu

main :: IO ()
main = do
    hSetBuffering stdout NoBuffering
    hSetBuffering stdin LineBuffering
    mainMenu
