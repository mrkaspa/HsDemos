module CSVLib
  ( text2Quotes
  , QuoteData(..)
  ) where

import Data.Fixed
import qualified Data.Text as T
import Data.Time

data E4

instance HasResolution E4 where
  resolution _ = 10000

type Fixed4 = Fixed E4

data QuoteData = QuoteData
  { day :: Day
  , close :: Fixed4
  , volume :: Fixed4
  , open :: Fixed4
  , high :: Fixed4
  , low :: Fixed4
  } deriving (Show)

text2Quotes :: T.Text -> [QuoteData]
text2Quotes = map (mkQuote . toComponents) . tail . T.lines
  where
    toComponents = map T.unpack . T.splitOn ","
    mkQuote (d:rest@[_, _, _, _, _]) =
      let day = parseTimeOrError False defaultTimeLocale "%Y/%m/%d" d
          [close, volume, open, high, low] = map read rest
      in QuoteData {..}
    mkQuote _ = error "Incorrect format"
