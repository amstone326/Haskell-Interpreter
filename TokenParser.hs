module TokenParser where

import Control.Monad
import Control.Monad.Error

type TokenParser a = ErrorT String IO a

doParse :: TokenParser () -> IO ()
doParse p = do e <- runErrorT p
               case e of
                 Left s  -> putStrLn s
                 Right _ -> return ()
                 
write :: String -> TokenParser ()                 
write = liftIO . putStrLn