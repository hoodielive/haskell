fac :: (Integral a) => a -> a -- Integral --> for ex: int/integer
fac 0 = 1
fac n = n * fac (n - 1)

main :: IO ()
main = print $ fac 5


