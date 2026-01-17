{-
    Question 1.
-}

-- a)
billSplit :: Float -> Float -> Float -> Float
billSplit alice eve bill
    | (alice - bill) >= eve = bill
    | otherwise             = alice - ((alice + eve - bill) / 2)

{-
    b)
    i) compile-time error
    ii) rejected because the type requires one side to be surrounded in []
    iii) 
        appendAtTheEnd x xs = xs ++ [x]
-}

-- c)
main :: IO ()
main = do {
    putStrLn "Please Input String " ;
    x <- getLine ;
    if x == "Bye"
        then return ()
        else do { 
            putStrLn "Hi" ; main
        }
}

-- d)
maximalOrderedSublist :: Ord a => [a] -> [a]
maximalOrderedSublist [] = []
maximalOrderedSublist [a] = [a]
maximalOrderedSublist (x:n:xs) | x <= n =  x : maximalOrderedSublist (n:xs)
                               | otherwise = maximalOrderedSublist (x:xs)

-- e)
data Tree a = Leaf a | Node a [Tree a]
leaf :: a -> Tree a
leaf x = Node x []

isLeaf :: Tree a -> Bool
isLeaf (Node _ []) = True
isLeaf _           = False

trimLeaves :: Tree a -> Tree a
trimLeaves (Leaf a) = leaf a
trimLeaves (Node l r) = Node l (map trimLeaves (filter (not . isLeaf) r))
