-- fibs !! n <- f(n)

fibn n = fibs !! n 
    where
        fibs = 0 : 1 : map f [2..]
        f n = fibs !! (n-1) + fibs !! (n-2)

