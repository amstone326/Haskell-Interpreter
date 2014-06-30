module Parse where

import TokenParser
import Data.Char

data Token = Number | Arithmetic | Comparison | Logical | Stack | IfElse | FuncDef | FuncCall
type TokenizedString = (String, Token)


isNumeric :: String -> Bool
isNumeric (c1:(c2:cs)) = firstValid && secondValid && restValid where
  firstValid      = isNumber c1 || c1 `elem` ['x','X','-']
  secondValid     = isNumber c2 || (if c1 == '0' then c2 `elem` ['x','X'] else False)
  restValid       = and $ map isNumber cs
                                            
                    
parseToken :: FilePath -> TokenizedString -> TokenParser ()
parseToken file (str, tok) = undefined --case tok of                                                                                                                                 

tokenizeString :: String -> TokenizedString
tokenizeString s = (s, tok)
  where tok = if isNumeric s                                 then Number     else
              if s `elem` ["+","-","*","/","%"]              then Arithmetic else
              if s `elem` ["lt","le","eq","ge","gt"]         then Comparison else
              if s `elem` ["and","or","not"]                 then Logical    else
              if s `elem` ["drop","dup","rot","swap","pick"] then Stack      else
              if s == "if"                                   then IfElse     else              
              if s == "defun"                                then FuncDef    else FuncCall
                                                                                                                                                                                  