module Lib
  ( mainFunc
  ) where

import Control.Monad
import Control.Monad.Trans

addTail :: Maybe [Int] -> Maybe [Int]
addTail xs = fmap (mappend [4, 5, 6]) xs

ops :: Maybe [Int]
ops = do
  nums1 <- addTail $ Just [1, 2, 3]
  nums2 <- Just [7, 8, 9]
  return $ mappend nums1 nums2

readPrintNTimes :: IO ()
readPrintNTimes = do
  n <- readLn
  mapM_ (\_ -> putStrLn "Hello") [0 .. n]

mainFunc :: IO ()
mainFunc = do
  putStrLn "N times = "
  readPrintNTimes
  putStrLn "Opt lists = "
  nums <- return ops
  mapM_ (putStrLn . show) nums
