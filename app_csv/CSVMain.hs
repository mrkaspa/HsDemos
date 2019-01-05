module Main where

import CSVLib
import Control.Monad

main :: IO ()
main = prt . filterByVol . text2Quotes $ dat
  where
    volGt max QuoteData {..} = volume > max
    filterByVol = filter $ volGt 20000000.0
    dat =
      "day,close,volume,open,high,low\n\
    \2017/10/11,156.5500,16861450.0000,155.9700,156.9800,155.7500\n\
    \2017/10/10,155.9000,15603520.0000,156.0550,158.0000,155.1000\n\
    \2017/10/09,155.8400,16243080.0000,155.8100,156.7300,155.4850\n\
    \2017/10/06,155.3000,17223790.0000,154.9700,155.4900,154.5600\n\
    \2017/10/05,155.3900,21215870.0000,154.1800,155.4400,154.0500"

prt :: [QuoteData] -> IO ()
prt rows =
  forM_ rows (putStrLn . show)
