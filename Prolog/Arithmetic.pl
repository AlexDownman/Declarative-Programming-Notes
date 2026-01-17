
=Arithmetic

+, *, -, /, mod(X,Y).

=Arithmetic

=is/2

    Two arguement predicate
    `Something` is `condition`
    Does `something` satisfy `condition`

    `X is Y`

    We can use variables on either side of the predicate
    variables must be instantiated with a variable-free Prolog term
    Prolog term must be an arithmetic expression

=is/2

=Notation

    3+2 is the same as +(3,2) and similar for other arithmetic operators

    is predicate is a two-place Prolog predicate
    can also be used like:
        is(X,+(3,2)).

=Notation

=cut

%Defining predicates

addThreeAndDouble(X,Y):- Y is (X+3) * 2.

=Accumulators

    `acclen/3` -> Initial Value of the accumulator is 0,
                  Add 1 to the accumulator each time we can recursively take the
                  head of the list
                  When we reach the empty list, the accumulator contains the length

=Accumulators

=cut

acclen([],Acc,Length):- Length = Acc.
acclen([_|L],OldAcc,Length):- NewAcc is OldAcc + 1, acclen(L,NewAcc,Length).

length(List,Length):- acclen(List,0,Length).

=Tail-Recursion

`acclen/3` is tail-recursive
`len/2` is not tail-recursive

tail-recursion -> the result is fully calculated once we reach the base clause
non-tail-recursion -> there are still goals on the stack 
                      once we reach the base clause

=Tail-Recursion

=Comparison-Operators

x < y -> X < y
x <= y -> X =< Y
x = y -> X =:= Y
x /= y -> X =\= Y
x >= y -> X >= Y
x > y -> X > Y

=Comparison-Operators

=cut

