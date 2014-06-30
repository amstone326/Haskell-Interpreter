module Main where

import System.Environment
import Data.List.Split
import TokenParser 
import Stack
import Parse

main :: IO ()
main = do
  in_file:tl <- getArgs
  file_string <- readFile in_file
  let strings_list = filter cleanupStrings $ wordsBy (==' ') file_string
      tokens = map tokenizeString strings_list
      out_file = take (length in_file - 2) in_file ++ ".asm" 
  sequence_ $ map doParse $ map (parseToken out_file) tokens

cleanupStrings :: String -> Bool
cleanupStrings = undefined