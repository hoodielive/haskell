module Quadratic where

data Quadratic = Quadratic { a :: Double, b :: Double, c :: Double }

deriving Show

type RootT = Complex Double
