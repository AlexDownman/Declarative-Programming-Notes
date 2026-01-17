
{-
    Defined as a single leaf node with data 
    or
    A Node with a left Tree, int data, right Tree
-}
data Tree = Leaf Int
            | Node Tree Int Tree

-- A defined tree
myTree :: Tree
myTree = Node (Node (Leaf 1) 3 (Leaf 4)) 5 (Node (Leaf 6) 7 (Leaf 9))

-- Traverses all paths to discover a value
occurs :: Int -> Tree -> Bool
occurs m (Leaf n) = m==n
occurs m (Node l n r) = m==n || occurs m l || occurs m r -- l = left node, r = right node

-- >>> occurs 5 myTree
-- True

-- This version is more efficient since it traverses one path
occurs' :: Int -> Tree -> Bool
occurs' m (Leaf n) = m==n
occurs' m (Node l n r) | m==n = True
                       | m<n = occurs' m l
                       | m>n = occurs' m r

-- >>> occurs' 5 myTree
-- True

-- returns all values in the tree
flatten :: Tree -> [Int]
flatten (Leaf n) = [n]
flatten (Node l n r) = flatten l ++ [n] ++ flatten r

-- >>> flatten myTree
-- [1,3,4,5,6,7,9]
