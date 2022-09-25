module Main (main) where

type Screen = [String]

blankScreen :: Screen
blankScreen =
  [ "                ",
    "                ",
    "                ",
    "                ",
    "                ",
    "                ",
    "                ",
    "                ",
    "                "
  ]

screenHeight :: Screen -> Int
screenHeight screen = undefined

screenWidth :: Screen -> Int
screenWidth screen = undefined

getPixel :: Screen -> Int -> Int -> Char
getPixel screen x y = undefined

putPixel :: Screen -> Int -> Int -> Char -> Screen
putPixel screen x y chr = undefined

drawRect :: Screen -> Int -> Int -> Int -> Int -> Char -> Screen
drawRect screen x y w h chr = undefined

initScreen :: Screen -> Screen
initScreen screen =
  let width = screenWidth screen
      height = screenHeight screen
   in drawRect (drawRect screen 0 0 width height '#') 1 1 (width - 2) (height - 2) ' '

displayScreen :: Screen -> IO ()
displayScreen screen = do
  putStrLn (unlines $ initScreen screen)
  return ()

main :: IO ()
main = displayScreen blankScreen
