{-
    Question 1.
-}

-- a)

billSplit :: Float -> Float -> Float -> (Float, Float, Float)
billSplit alice eve bill = if eve - bill > alice then (alice, eve-bill, bill)
                           else (alice-((bill - (eve-alice)) / 2),
                            eve-((bill - (eve-alice)) / 2), bill)

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
        then putStrLn "" ;
        else do putStrLn "Hi" ; main
}

-- d)
maximalOrderedSublist :: Ord a -> [a] -> [a] -> [a]
maximalOrderedSublist l r = r