{-
    Question 1.
    a)
    i) (+3) 2 = 5
    ii) "Hello " ++ (reverse "Hi") = "Hello iH"
    iii) [x / 2 | x <- [4, 6, 9]] = [2.0, 3.0, 4.5]
    iv) filter (< 5) [1..100] = [1, 2, 3, 4]
    v) map (\_ x -> [x, x]) [1, 5] = [[1, 1], [5, 5]]
-}

-- b)

calcFinalGrade :: (Integral a) => a -> a -> a -> a
calcFinalGrade exam cw lab = round (
                             (fromIntegral exam * 0.70)
                             + (fromIntegral cw * 0.15)
                             + (fromIntegral lab * 0.15))

{-
    i) polymorphic is a function that takes in any type
    ii) higher-order is a function which takes a function as an arguement

    One example is map
-}

-- f
data BTree a = Leaf a | BNode (BTree a) a (BTree a)

isHeapRec :: Ord a => a -> BTree a -> Bool
isHeapRec m (Leaf n) = True
isHeapRec m (BNode l n r) = m > n && isHeapRec m l && isHeapRec m r

isHeap :: Ord a => BTree a -> Bool
isHeap (Leaf a) = True
isHeap (BNode l n r) = isHeapRec n l && isHeapRec n r
                       && isHeap l && isHeap r

treeMax :: Ord a => BTree a -> a
treeMax (Leaf a) = a
treeMax (BNode l n r) = max (treeMax l) (treeMax r)
