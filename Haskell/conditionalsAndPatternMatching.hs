
-- examples of conditionals
-- if statements
abs' :: Int -> Int
abs' x = if x >= 0 then x else -x

signum :: Int -> Int
signum x = if x < 0 then -1 else
               if x == 0 then 0 else 1

-- guarded equations
abs2' :: Int -> Int
abs2' x | x >= 0    = x
        | otherwise = -x

signum2 :: Int -> Int
signum2 x | x < 0     = -1
          | x == 0    = 0
          | otherwise = 1

-- examples of pattern matching
not' :: Bool -> Bool
not' True  = False
not' False = True

customAnd :: Bool -> Bool -> Bool
customAnd True True   = True
customAnd False False = False
customAnd True False  = False
customAnd False True  = False
-- or using wildcards
customAnd2 :: Bool -> Bool -> Bool
customAnd2 True True = True
customAnd2 _    _    = False

customAnd3 :: Bool -> Bool -> Bool
customAnd3 True b    = b
customAnd3 False _   = False
-- _ is a wildcard that matches anything
-- patterns are matched in order from top to bottom

{-
    customAnd4 :: Bool -> Bool -> Bool
    customAnd4 _ _ = False
    customAnd4 True True = False -- unreachable code

    patterns may not repeat variables
    customAnd b b = b -- incorrect -> should be customAnd5 b1 b2
-}

-- Tuple pattern matching
fst' :: (a, b) -> a
fst' (x, _) = x

-- List pattern matching
-- [1, 2, 3, 4] == 1 : (2 : (3 : (4 : [])))
isEmpty' :: [a] -> Bool
isEmpty' []    = True
isEmpty' (_:_) = False

head' :: [a] -> a
head' (x:_) = x

tail' :: [a] -> [a]
tail' (_:xs) = xs

consInverse' :: [a] -> (a, [a])
consInverse' (x:xs) = (x, xs)

{- 
    patterns only match non-empty lists
    patterns must be parenthesized
-}

safetail :: [a] -> [a]
safetail []    = []
safetail xs | null xs = []
safetail (_:xs) = xs

customOr :: Bool -> Bool -> Bool
customOr True _    = True
customOr False b = b
