module Main (main) where

import Control.Monad (forM_)

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

newtype ScreenContext a = ScreenContext {
  runContext :: Screen -> (a, Screen)
}

instance Functor ScreenContext where
  fmap f ctx = undefined

instance Applicative ScreenContext where
  pure a = undefined
  ctxF <*> ctxX = undefined

instance Monad ScreenContext where
  return = pure
  ctxX >>= f = undefined

get :: ScreenContext Screen
get = undefined

put :: Screen -> ScreenContext ()
put screen = undefined

screenWidth :: ScreenContext Int
screenWidth = undefined

screenHeight :: ScreenContext Int
screenHeight = undefined

getPixelM :: Int -> Int -> ScreenContext Char
getPixelM x y = undefined

putPixel :: Int -> Int -> Char -> ScreenContext ()
putPixel x y chr = undefined

drawRect :: Int -> Int -> Int -> Int -> Char -> ScreenContext ()
drawRect x y w h chr = undefined

initScreen :: ScreenContext ()
initScreen = do
  w <- screenWidth
  h <- screenHeight
  drawRect 0 0 w h '#'
  drawRect 1 1 (w -2) (h -2) ' '

displayScreen :: Screen -> IO ()
displayScreen screen = do
  let (_, screen') = runContext initScreen screen
  putStrLn $ unlines screen'

main :: IO ()
main = displayScreen blankScreen
