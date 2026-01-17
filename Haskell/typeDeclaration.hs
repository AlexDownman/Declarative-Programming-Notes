{- 
    Type declaration
    cannot be recursive declaration
    declarations can be nested
-}
type Pos = (Int, Int)

origin :: Pos
origin = (0, 0)

left :: Pos -> Pos
left (x, y) = (x-1, y)

right :: Pos -> Pos
right (x, y) = (x+1, y)

up :: Pos -> Pos
up (x, y) = (x, y+1)

down :: Pos -> Pos
down (x, y) = (x, y-1)

type Pair a = (a,a)

mult :: Pair Int -> Int
mult (m, n) = m*n

copy :: a -> Pair a
copy x = (x, x)

-- nested type declaration
type Trans = Pos -> Pos

{-
    Data declarations
    data Name = Constructor
    type and constructor names must begin with an upper-case letter
    values of new types can be used the same way as built-in types (Int, Bool, String, etc)
    constructors in a data declaration can have parameters
-}

data Bool = False | True

data Answer = Yes | No | Unknown

answers :: [Answer]
answers = [Yes, No, Unknown]

flip :: Answer -> Answer
flip Yes = No
flip No = Yes
flip Unknown = Unknown

-- Circle and Rect can be viewed as functions
data Shape = Circle Float | Rect Float Float
{-
    Circle :: Float -> Shape
    Rect :: Float -> Float -> Shape
-}

square :: Float -> Shape
square n = Rect n n

area :: Shape -> Float
area (Circle r) = pi * r^2
area (Rect x y) = x * y

data Maybe' a = Nothing' | Just' a

safediv :: Int -> Int -> Maybe' Int
safediv _ 0 = Nothing'
safediv m n = Just' (m `div` n)

{-
    Recursive Types
-}

data Nat = Zero | Succ Nat
  deriving Show -- allows print
{-
    Zero :: Nat
    Succ :: Nat -> Nat

    value of type Nat is either Zero or the form Succ n where n :: Nat
    Nat contains the infinite sequence of values Zero -> Succ Zero -> Succ (Succ Zero) -> ...
    Zero = 0
    Succ = Successor Func (1+)
    Therefore Succ (Succ (Succ Zero)) == 1+(1+(1+ 0)) = 3
-}

nat2int :: Nat -> Int
nat2int Zero = 0
nat2int (Succ n) = 1 + nat2int n

int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Succ (int2nat (n-1))

-- >>> nat2int (Succ (Succ (Succ Zero)))
-- 3

-- >>> int2nat 5
-- Succ (Succ (Succ (Succ (Succ Zero))))

add' :: Nat -> Nat -> Nat
add' m n = int2nat (nat2int m + nat2int n)

-- >>> add' (Succ (Succ Zero)) (Succ Zero)
-- Succ (Succ (Succ Zero))

data Expr = Val Int
            | Add Expr Expr
            | Mul Expr Expr

{-
    Val :: Int -> Expr
    Add :: Expr -> Expr -> Expr
    Mul :: Expr -> Expr -> Expr
-}

size :: Expr -> Int
size (Val n) = 1
size (Add x y) = size x + size y
size (Mul x y) = size x + size y

eval :: Expr -> Int
eval (Val n) = n
eval (Add x y) = eval x + eval y
eval (Mul x y) = eval x * eval y