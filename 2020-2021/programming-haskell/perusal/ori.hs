fs <*> xs = [f x | f <- fs, x <- xs]

pure x = [x]

data Stream a = Stream { headS :: a, tailS :: Stream a }

instance Applicative Stream where
    pure x = let s = Stream x s in s
    Stream f fs <*> Stream x xs = Stream (f x) (fs <*> xs)

newType ZipList a = ZipList { getZipList :: [a] }

instance Applicative ZipList where
    ZipList xs <*> ZipList ys = ZipList $ zipWith ($) xs ys

    pure a = ZipList (repeat a)

getZipList $ ZipList [(+1), (+2)] <*> [3, 30, 300]
