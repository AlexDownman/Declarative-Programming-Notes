{-
    higher order -> function that takes a function as an arguement or returns a function as a result
-}

-- example

-- map :: (a -> b) -> [a] -> [b]
-- >>> map (+1) [1, 3, 5, 7]
-- [2,4,6,8]

map' :: (a -> b) -> [a] -> [b]
map' f [] = []
map' f (x:xs) = f x : map f xs

filter' :: (a -> Bool) -> [a] -> [a]
filter' f [] = []
filter' f (x:xs) | f x = x : filter' f xs
                 | otherwise = filter' f xs

-- applies a function to the entire list and the v arguement, unless list is empty then v
foldr' :: (a -> b -> b) -> b -> [a] -> b
foldr' f v [] = v
foldr' f v (x:xs) = f x (foldr f v xs)

-- >>> foldr (+) 0 [1, 2, 3]
-- 6

{-
    lambda -> anonymous function defined by \
    e.g. \a -> a + a

    sections -> an operator between two arguements can be converted into a curried function written before its two arguements by using parenthesis

    Examples of sections:
    (1+) -> Successor func
    (1/) -> Reciprocation func
    (*2) -> Doubling func
    (/2) -> Halving func

    e.g. 1+2 == (+) 1 2
-}

-- >>> (+) 1 2
-- 3

-- >>> (/2) 4
-- 2.0

-- >>> (*2) 4
-- 8

-- >>> (1/) 4
-- 0.25

length2 :: [a] -> Int
length2 = foldr (\_ -> (1+)) 0

-- >>> length2 [1, 2, 3, 4]
-- 4

{-
    (.) -> library function, returns composition of two functions as a single function
    (.) :: (b -> c) -> (a -> b) -> (a -> c)
    f . g = \x -> f (g x)
-}

odd' :: Int -> Bool
odd' = not . even

-- >>> odd' 3
-- True

-- >>> odd' 2
-- False

{-
    all -> decides if every elem of a list satisfies a given predicate
    all :: (a -> Bool) -> [a] -> Bool
    all p xs = and [p x | x <- xs]
-}

all' :: (a -> Bool) -> [a] -> Bool
all' p xs = and [p x | x <- xs]

-- >>> all' even [1, 2, 3, 4, 5, 6]
-- False

{-
    any -> decides if at least one elem of a list satisfies a given predicate
    any :: (a -> Bool) -> [a] -> Bool
    any p xs = or [p x | x <- xs]
-}

any' :: (a -> Bool) -> [a] -> Bool
any' p xs = or [p x | x <- xs]

-- >>> any' even [1, 2, 3, 4, 5, 6, 7]
-- True

{-
    takeWhile -> selects elements from a list while a predicate holds of all the elements
                 stops when the base case or else condition is reached
    takeWhile :: (a -> Bool) -> [a] -> [a]
    takeWhile p [] = []
    takeWhile p (x:xs) | p x = x : takeWhile p xs
                       | otherwise = []
-}

takeWhile' :: (a -> Bool) -> [a] -> [a]
takeWhile' p [] = []
takeWhile' p (x:xs) | p x = x : takeWhile' p xs
                    | otherwise = []

-- >>> takeWhile' odd' [1, 3, 5, 7, 2, 3, 4, 5, 6]
-- [1,3,5,7]

{-
    dropWhile -> removes elements while a predicate holds of all the elements
                 stops when the base case or else condition is reached
    dropWhile :: (a -> Bool) -> [a] -> [a]
    dropWhile p [] = []
    dropWhile p (x:xs) | p x = dropWhile p xs
                       | otherwise = x:xs
-}

dropWhile' :: (a -> Bool) -> [a] -> [a]
dropWhile' p [] = []
dropWhile' p (x:xs) | p x = dropWhile' p xs
                    | otherwise = x:xs

-- >>> dropWhile' odd' [1, 3, 5, 7, 2, 3, 4, 5, 6]
-- [2,3,4,5,6]

