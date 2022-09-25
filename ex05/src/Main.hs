module Main (main) where

import Control.Applicative
import Data.Char

newtype Parser a = Parser {
  runParser :: String -> Either String (a, String)
}

instance Functor Parser where
  fmap f (Parser p) = undefined

instance Applicative Parser where
  pure a = undefined
  Parser p <*> Parser q = undefined

instance Monad Parser where
  return = pure
  Parser p >>= f = undefined 

instance Alternative Parser where
  empty = undefined
  Parser p <|> Parser q = undefined

satisfy :: (Char -> Bool) -> Parser Char
satisfy p = undefined

char :: Char -> Parser Char
char c = undefined

many1 :: Parser a -> Parser [a]
many1 p = undefined

digit :: Parser Char
digit = undefined

digit1 :: Parser Char
digit1 = undefined

digits :: Parser String
digits = undefined

data AST = Num Integer | BinOp Char AST AST
  deriving (Show)

-- expression
--     : term (('+'|'-') term)*
--     ;

expression :: Parser AST
expression = undefined

-- term
--     : factor (('*'|'/'|'%') factor)*
--     ;

term :: Parser AST
term = undefined

-- factor
--     : primary
--     | ('-'|'+') factor
--     ;

factor :: Parser AST
factor = undefined

-- primary
--     : NUMBER
--     | '(' expression ')'
--     ;

primary :: Parser AST
primary = undefined

evaluate :: AST -> Either String Integer
evaluate ast = undefined

parseThenEval :: String -> Either String Integer
parseThenEval s = case runParser expression s of
  Nothing -> Left "invalid expression"
  Just (a, []) -> evaluate a
  Just (_, s') -> Left $ "invalid expression: " ++ s'

main :: IO ()
main = do
  test "(12+34)*(15-5)"
  test "(12+34)/(5-5)"
  test "(12+34)%(15-5)"
  where
    test expr = do
      case parseThenEval expr of
        Left error -> putStrLn $ "Error: " ++ error
        Right value -> putStrLn $ expr ++ ": " ++ show value
