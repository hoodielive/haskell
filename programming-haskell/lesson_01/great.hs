doubleMe x = x + x

doubleUs x y = (x * 2) + (y * 2)

doubleSmallNumber x = if x > 100 
                        then x
                        else x*2

doubleSmallNumberAddOne x = (if x > 100 then x else x * 2) + 1

-- ' is a valid character in functions 

osa'meji = "This is odu ifa and very powerful it is!"

let lostNumbers = [4,8,15,16,23,42]