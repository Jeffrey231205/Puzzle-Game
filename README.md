# Vainuess – Valorant Skin Guessing Game

This repository contains the source code and documentation for an individual Haskell programming project.

## Project Overview

Vainuess is a console-based guessing game inspired by weapon skins from Valorant. Players must identify different weapon skins using progressively revealed hints and short descriptions.

The game includes a scoring system, limited attempts, randomized question ordering, and persistent player history. It was developed using functional programming principles in Haskell.

## ✨ Features

- Guess from 15 different Valorant weapon skins
- Progressive hints reveal more characters after incorrect answers
- Additional tips describe the appearance or animation of each skin
- Five attempts are provided during the game
- Correct answers award points to the player
- Maximum score of 75 points
- Questions are arranged based on the player's name
- Player scores are automatically saved
- View previous player results through the history menu
- History results are ranked from highest to lowest score
- Case-insensitive answer checking
- Supports answers containing spaces and special characters

## 🎮 Game Menu

The program provides three main options:

1. New Game
2. View History
3. Quit

## 🛠️ Tech Stack

- Haskell
- Glasgow Haskell Compiler (GHC)
- Functional programming
- Console-based user interface
- Text-file data persistence

## 📁 Project Structure

```text
Final/
├── Main.hs
├── Main.exe
├── history.txt
└── Game/
    ├── Game.hs
    ├── Menu.hs
    ├── History.hs
    ├── SkinData.hs
    └── Utils.hs
