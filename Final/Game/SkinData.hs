-- Game/SkinData.hs
module Game.SkinData (skins, getTip) where

skins :: [String]
skins =
  [ "Champion 2025"
  , "Gaia's Vengeance"
  , "Ion"
  , "Ora By Onetap"
  , "Prime"
  , "RGX 11Z Pro"
  , "Crimsonbeast"
  , "Dolmir's Revenge"
  , "Evori Dreamwings"
  , "EX.O"
  , "Forsaken"
  , "Recon"
  , "Ruination"
  , "Radiant Entertainment System"
  , "Neptune"
  ]

tips :: [(String, String)]
tips =
  [ ("Champion 2025",   "Rhythmic shots with music and team highlight.")
  , ("Gaia's Vengeance","Tree-branch look with crystal and crisp shooting feel.")
  , ("Ion",             "Smooth sci-fi shooting effects.")
  , ("Ora By Onetap",   "Inspect plays songs and kill-feedback dances.")
  , ("Prime",           "Kill effect shows a wolf with strong hit feedback.")
  , ("RGX 11Z Pro",     "Looks like a glowing gaming graphics card.")
  , ("Crimsonbeast",    "Flames appear on the gun after each kill.")
  , ("Dolmir's Revenge","Made of stone with a shining triangular gem.")
  , ("Evori Dreamwings","Cat-themed inspect and kill animations.")
  , ("EX.O",            "Ninja appears in kill animation.")
  , ("Forsaken",        "Two color variants with different kill visuals.")
  , ("Recon",           "Military-style colors with a clean sound.")
  , ("Ruination",       "A crossover skin inspired by the dark magical aesthetic seen in League of Legends.")
  , ("Radiant Entertainment System", "Arcade-themed skin where inspecting the weapon lets you casually play a small retro game.")
  , ("Neptune",         "Aquarium-themed gun with fish inside.")
  ]

getTip :: String -> String
getTip name = findTip name tips
  where
    findTip _ [] = "No tip available."
    findTip n ((s,t):xs)
      | n == s    = t
      | otherwise = findTip n xs
