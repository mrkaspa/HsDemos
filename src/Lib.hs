module Lib
  ( someFunc
  ) where

addTail :: Maybe [Int] -> Maybe [Int]
addTail xs = fmap (mappend [4, 5, 6]) xs

ops :: Maybe [Int]
ops = do
  nums1 <- addTail $ Just [1, 2, 3]
  nums2 <- Just [7, 8, 9]
  return $ mappend nums1 nums2

someFunc :: IO ()
someFunc =
  case ops of
    Just res -> putStrLn $ "Res " ++ (show res)
    Nothing -> putStrLn "None"
