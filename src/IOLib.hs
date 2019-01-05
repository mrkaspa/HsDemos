module IOLib
  ( mainFunc
  ) where

import Control.Monad

addTail :: Maybe [Int] -> Maybe [Int]
addTail xs = fmap (mappend [4, 5, 6]) xs

ops :: Maybe [Int]
ops = do
  nums1 <- addTail $ Just [1, 2, 3]
  nums2 <- Just [7, 8, 9]
  return $ nums1 <> nums2

readPrintNTimes :: IO ()
readPrintNTimes = do
  n <- readLn
  forM_ [0 .. n] (\_ -> putStrLn "Hello")

mainFunc :: IO ()
mainFunc = do
  putStrLn "N times = "
  readPrintNTimes
  putStrLn "Opt lists = "
  forM_ ops (putStrLn . show)
