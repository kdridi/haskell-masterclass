module Main (main) where

import Data.List (delete)

myLT :: Ord a => a -> a -> Bool
myLT x y = x < y

myMin :: Ord p => p -> p -> p
myMin x y =
  if x `myLT` y
    then x
    else y

myMinimum :: Ord a => [a] -> a
myMinimum [] = error "myMinimum: empty list"
myMinimum [x] = x
myMinimum (x : xs) = myMin x (myMinimum xs)

selectionSort :: Ord t => [t] -> [t]
selectionSort [] = []
selectionSort xs =
  let x = myMinimum xs
   in x : selectionSort (delete x xs)

newtype TracerContext a = TracerContext {
  runTrace :: Integer -> (a, Integer)
}

instance Functor TracerContext where
  fmap f ctx = undefined

instance Applicative TracerContext where
  pure x = undefined
  ctxF <*> ctxX = undefined

instance Monad TracerContext where
  return = pure
  ctx >>= f = undefined

inc :: TracerContext ()
inc = undefined

myLTM :: Ord a => a -> a -> TracerContext Bool
myLTM x y = undefined

myMinM :: Ord p => p -> p -> TracerContext p
myMinM x y = undefined

myMinimumM :: Ord a => [a] -> TracerContext a
myMinimumM values = undefined

selectionSortM :: Ord t => [t] -> TracerContext [t]
selectionSortM values = undefined

main :: IO ()
main = do
  let values = [3.3, 5, 9.89, -6]
      (count, array) = runTrace (selectionSortM values) 0
  putStrLn $ "selectionSort : " ++ show (selectionSort values)
  putStrLn $ "selectionSortM: " ++ show count
  putStrLn $ "selectionSortM: " ++ show array
