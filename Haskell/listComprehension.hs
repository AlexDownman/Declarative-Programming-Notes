{-
    mathematical notation
    {x^2 | x ε {1..5}}

    haskell version
    [x^2 | x <- [1..5]]

    x <- [1..5] is the generator. States how to generate values of x
    
    multi-generator
    [(x,y) | x <- [1, 2, 3], y <- [4, 5, 6]]
-}

-- >>> [x^2 | x <- [1..5]]
-- [1,4,9,16,25]

-- >>> [(x,y) | x <- [1, 2, 3], y <- [4, 5]]
-- [(1,4),(1,5),(2,4),(2,5),(3,4),(3,5)]

-- >>> [(x,y) | y <- [4, 5], x <- [1, 2, 3]]
-- [(1,4),(2,4),(3,4),(1,5),(2,5),(3,5)]

-- >>> [(x, y) | x <- [1..3], y <- [x..3]]
-- [(1,1),(1,2),(1,3),(2,2),(2,3),(3,3)]


-- List comprehension uses guards to restrict values produced by earlier generators

-- >>> [x | x <- [1..10], even x]
-- [2,4,6,8,10]

factors' :: Int -> [Int]
factors' n =
    [x | x <- [1..n], n `mod` x == 0]

-- >>> factors' 15
-- [1,3,5,15]

prime' :: Int -> Bool
prime' n = factors' n == [1, n]

getPrimesUpTo :: Int -> [Int]
getPrimesUpTo n = [x | x <- [2 .. n], prime' x]

-- >>> prime' 7
-- True

-- >>> prime' 15
-- False

-- >>> getPrimesUpTo 30
-- [2,3,5,7,11,13,17,19,23,29]

pyths :: Int -> [(Int, Int, Int)]
pyths 0 = []
pyths n = [(x, y, z) | x <- [1..n], y <- [1..n], z <- [1..n], x^2 + y^2 == z^2]

-- >>> pyths 5
-- [(3,4,5),(4,3,5)]

perfects :: Int -> [Int]
perfects 0 = []
perfects n = [x | x <- [1..n], sum (init (factors' x)) == x]

-- >>> perfects 500
-- [6,28,496]
