fac :: (Integral a) => a -> a -- Integral is the class of integral num types 
fac 0 = 1
fac n = n * fac (n - 1)

main :: IO ()
main = print $ fac 5