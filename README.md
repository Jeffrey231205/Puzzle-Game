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


## 🛠️ Tech Stack


- Haskell
- Glasgow Haskell Compiler (GHC)
- Functional programming
- Console-based user interface
- Text-file data persistence


## 🎮 Game Menu


The program provides three main options:


1. New Game
2. View History
3. Quit

## Installation and How to Run

Vainuess runs in a terminal on your computer. It is not a browser game. VS Code is optional: it is an editor, and you can also use PowerShell, Command Prompt, or a terminal on macOS or Linux.

### 1. Download the project

1. On this repository page, select **Code → Download ZIP**.
2. Extract the ZIP file completely.
3. Open the extracted project folder. It contains the `Final` folder.

### 2. Choose a way to run the game

#### Option A: Run the source code (Windows, macOS, or Linux)

1. Follow the instructions for your operating system on the official [GHCup installation page](https://www.haskell.org/ghcup/install/) and install GHC. GHC includes `runghc`. A Haskell extension for VS Code is not required.
2. After installation, open a new terminal and check that GHC is available:

```bash
ghc --version
runghc --version
```

3. Open a terminal in the extracted project folder, then enter:

```bash
cd Final
runghc Main.hs
```

If your terminal is already inside `Final`, run only `runghc Main.hs`. Keep the `Game` folder alongside `Main.hs`, because the game imports the modules inside it.

These instructions are based on the source layout and imports; they have not been verified on every operating system.

#### Option B: Use the included Windows executable

The repository includes `Final/Main.exe`. This is an alternative for a compatible Windows computer; it is not a macOS or Linux executable.

Open PowerShell inside the extracted `Final` folder and enter:

```powershell
.\Main.exe
```

You can also try double-clicking `Main.exe` from the extracted `Final` folder. Running it in PowerShell keeps any error messages visible if it exits unexpectedly.

VS Code is not needed for this method. The included executable has not been tested on a clean Windows computer, so additional runtime dependencies may be needed. If it fails to start, use Option A.

### Using VS Code (optional)

Open the extracted project folder in VS Code, select **Terminal → New Terminal**, and use the same commands shown above. When running the source, GHC must still be installed and available in the terminal.

### How to play

1. Enter `1` in the main menu to start a new game.
2. Enter your player name.
3. Use the displayed hints and tips to guess each skin.
4. Each correct answer earns 5 points. Each incorrect answer uses one of the five attempts shared across the game.
5. Enter `2` in the main menu to view score history, or `3` to quit.

### Saved scores and troubleshooting

- Scores are appended to `history.txt` in the current working folder. Run from `Final` to use the history file included there, and keep the project somewhere you have permission to write files.
- **`ghc` or `runghc` is not recognised:** finish the GHC installation and PATH setup, then reopen your terminal. If using VS Code, restart it as well.
- **Cannot find `Main.hs` or a `Game.*` module:** make sure the ZIP is extracted, your terminal is inside `Final`, and the `Game` subfolder is present.
- **The executable fails to start:** run it from PowerShell to see the error, or use the source-code method.

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
```
