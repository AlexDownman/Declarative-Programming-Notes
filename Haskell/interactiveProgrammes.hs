import Data.Char (toUpper)
import Prelude hiding (putStr)
import System.IO

{-
    default:
    input s -> Batch Program -> output s

    Haskell Programs itself have no side effects

    interactive:
                keyboard
                    ↓
    inputs -> interactive program -> outputs
                    ↓
                  screen

    Interactive programs have side effects

    IO a -> Input/Ouput action that returns value of type a

    helping my brother one moment

-}

-- getChar :: IO Char
-- putChar :: Char -> IO ()
-- return :: a -> IO a

{-
    Sequencing

    (>>=) :: IO a -> (a -> IO b) -> IO b

    main = getChar >>= putChar

    (>>) :: IO a -> IO b -> IO b

    a >> b = a >>= \_ -> b

    main :: IO ()
    main = getChar >>= \c ->
           putChar (toUpper C) >>
           putChar '\n'

-}

main :: IO ()
main = getChar >>= \c -> putChar (toUpper c) >> putChar '\n'

main2 :: IO ()
main2 = do {
    x <- getChar ; putChar (toUpper x) ; putChar '\n'
}
getString :: IO String
getString = do {
    x <- getChar ;
    if x == '\n'
        then return []
    else do {
        xs <- getLine ;
        return (x:xs)
    }
}

putStr' :: String -> IO ()
putStr' [] = return ()
putStr' (x:xs) = do { putChar x ; putStr' xs }

putStrLn' :: String -> IO ()
putStrLn' xs = do {
    putStr' xs ; putChar '\n'
}

strlen :: IO ()
strlen = do {
    putStr' "Enter a string " ;
    xs <- getLine ;
    putStr' "The string has " ;
    putStr' (show (length xs)) ;
    putStrLn' " characters"
}

sgetLine :: IO String
sgetLine = do {
    x <- getChar ;
    if x == '\n'
        then do { putChar x ; return [] }
        else do { putChar '-' ; xs <- sgetLine ; return (x:xs) }
}

getCh :: IO Char
getCh = do {
    hSetEcho stdin False ;
    c <- getChar ;
    hSetEcho stdin True ;
    return c
}

diff :: String -> String -> String
diff xs ys = [if x `elem` ys then x else '-' | x <- xs]

guess :: String -> IO ()
guess word = do {
    putStr' "> " ;
    xs <- getLine ;
    if xs == word
        then putStrLn "Well Done!"
        else do {
            putStrLn (diff word xs) ;
            guess word
        }
}

hangman :: IO ()
hangman = do {
    putStrLn' "Think of a word: " ;
    word <- sgetLine ;
    putStrLn' "Try to guess it: " ;
    guess word
}

printBoard :: [Int] -> IO ()
printBoard xs = putStr' (unlines [show x ++ ": " ++ replicate x '*' | x <- xs])


