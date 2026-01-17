
lenList :: [a] -> Int
lenList [] = 0
lenList (_:xs) = 1 + lenList xs

-- >>> lenList [1, 2, 3, 4, 5]
-- 5

reverse' :: [a] -> [a]
reverse' [] = []
reverse' (x:xs) = reverse' xs ++ [x]

listAnd :: [Bool] -> Bool
listAnd [] = True
listAnd (x:xs) = x && listAnd xs

-- >>> listAnd [True, True, True, True, False]
-- False

-- >>> listAnd [True]
-- False

concat' :: [[a]] -> [a]
concat' [] = []
concat' (x:xs) = x ++ concat' xs

-- >>> concat' [["H"], ["i"]]
-- ["H","i"]

replicate' :: Int -> a -> [a]
replicate' 0 _ = []
replicate' n x = x : replicate (n - 1) x

-- >>> replicate' 5 ""
-- ["","","","",""]

nthElem :: [a] -> Int -> a 
nthElem (x:_) 0 = x 
nthElem (_:xs) n = nthElem xs (n-1)

-- >>> nthElem [3, 5, 1, 2, 5, 2, 3] 1
-- 5

isElem :: Eq a => a -> [a] -> Bool
isElem _ [] = False
isElem x (h:t) | x == h = True
               | otherwise = isElem x t 

-- >>> isElem 5 [1, 3, 2, 3, 2, 4, 5]
-- True

-- >>> isElem 100 [1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1]
-- False

merge' :: [Int] -> [Int] -> [Int]
merge' [] x = x
merge' x [] = x 
merge' (x:xs) (n:ns) = if x < n then x : merge' xs (n:ns) 
                                else n : merge' (x:xs) ns

-- >>> merge' [2, 5, 6] [1, 3, 4]
-- [1,2,3,4,5,6]

-- >>> merge' [2] [1, 4, 5]
-- [1,2,4,5]

mSort :: [Int] -> [Int]
mSort [] = []
mSort [x] = [x]
mSort xs = merge' (mSort left) (mSort right) where (left, right) = splitAt (length xs `div` 2) xs

-- >>> mSort [5, 1, 3, 2, 3, 7, 2, 3, 5]
-- [1,2,2,3,3,3,5,5,7]
