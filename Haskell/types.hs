import Control.Arrow (Arrow(second))
-- Basic Types

{-
    Bool - True | False
    Char - single Unicode character
    String - Sequence of characters
    Int - fixed-precision integer
    Integer - arbitrary-precision integer
    Float - single-precision floating point
-}

-- Example usage:
isEven :: Int -> Bool
isEven x = x `mod` 2 == 0

greet :: String
greet = "Hello, World" ++ "!"

charExample :: Char
charExample = 'A'

bigNumber :: Integer
bigNumber = 123456789012345678901234567890

smallNumber :: Int
smallNumber = 42

piValue :: Float
piValue = 3.14

-- Collection Types

{-
    Lists - [t] a sequence of elements of same types t, length of a list is not part of its type
    Tuples - (t1, t2, ..., tn) a sequence of values that can have different types, the size is encoded in the its type
-}

-- Example usage:
numbers :: [Int]
numbers = [1, 2, 3, 4, 5]

pair :: (Int, String)
pair = (1, "one")

triple :: (Int, Char, Bool)
triple = (42, 'a', True)

-- Function Types

{- 
    Curried Functions - functions that take multiple arguments are represented as a series of functions that each take a single argument
        e.g. add' :: Int -> Int -> Int is equivalent to add' :: Int -> (Int -> Int)

    Polymorphic Functions - functions that use type variables to work with any type
        e.g. length :: [a] -> Int work with lists of any type a
-}

-- Example usage:

add' :: Int -> Int -> Int
add' x y = x + y

add2' :: Int -> (Int -> Int)
add2' x y = x + y

-- Also recursive function example
length' :: [a] -> Int
length' xs = case xs of
    [] -> 0
    (_:ys) -> 1 + length' ys

-- Type classes

{-
    Num - numeric types that support basic arithmetic operations (+,-,*, etc.)
    Eq - Equality types that support equality testing (==, /=)
    Ord - Ordered types that support comparison operations (<, <=, >, >=)
    Show - types whose values can be converted into strings (for display)
    Read - types whose values can be parsed from strings
-}

-- Example usage:
addNum :: Num a => a -> a -> a
addNum x y = x + y

-- >>> addNum 3 5
-- 8

isEqual :: Eq a => a -> a -> Bool
isEqual x y = x == y

-- >>> isEqual 3 5
-- False

-- >>> isEqual 3 3
-- True

compareInts :: Ord a => a -> a -> Ordering
compareInts x y = compare x y
-- compare returns LT, EQ, or GT (less than, equal, greater than)
compare' :: Ord a => a -> a -> String
compare' x y
  | x == y = "EQ"
  | x <= y = "LT"
  | otherwise = "GT"
-- >>> compareInts 3 5
-- LT

-- >>> compareInts 5 3
-- GT

-- >>> compareInts 3 3
-- EQ

showValue :: Show a => a -> String
showValue x = show x

-- >>> showValue 42
-- "42"

readValue :: Read a => String -> a
readValue str = read str

-- >>> readValue "42" :: Int
-- 42

{- 
    (a, b) -> b -- incorrect -> should be [a] -> a
    (a, b) -> (b, a)
    a -> b -> (a, b)
    double -> double -- incorrect -> should be Num a => a -> a
    a -> a -- incorrect -> should be Eq a => a -> Bool
    (f -> x) -> f (f x) -- incorrect -> should be (a -> a) -> a -> a
-}

twice :: (a -> a) -> a -> a
twice f x = f (f x)