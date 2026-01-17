{-
    (>>=) bind operator
    action1 >>= \result -> action2

    do notation equivalent
    x <- action1

    (>>) Then/sequence operator
    action1 >> action2
    action1 ; action2

    (=<<) reverse bind operator
    action2 =<< action1

    (>>=) :: Monad m => m a -> (a -> m b) -> m b
    return :: Monad m => a -> m a
-}

-- State monad

data State s a = Stateful (s -> (a, s))

return :: a -> State s a
return x = Stateful (\m -> (x, m))

