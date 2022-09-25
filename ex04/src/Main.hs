{-# LANGUAGE FlexibleInstances #-}

module Main (main) where

data AST
  = ASTValue Integer
  | ASTBinary String AST AST
  | ASTUnary String AST
  deriving (Show)

evaluate :: AST -> Integer
evaluate ast = undefined

evaluateSafe :: AST -> Either String Integer
evaluateSafe ast = undefined

instance MonadFail (Either String) where
  fail = Left

evaluateSafeM :: AST -> Either String Integer
evaluateSafeM ast = undefined

main :: IO ()
main = do
  putStrLn "hello world"
