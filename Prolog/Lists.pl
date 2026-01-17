
=Lists
A finite sequence of elements

`|` defines the head and tail of a list
[Head|Tail]
[X,Y|Tail]
[X,Y,Z|Tail]

e.g.
    [X1,X2,X3,X4|X5] = [mia, vincent, marsellus, jody, yolanda]
    -> X1 = mia
       X2 = vincent
       X3 = marsellus
       X4 = jody
       X5 = [yolanda]
    
    the tail is a list

=Lists

=Member

`member/2` -> Given term X and a list L,
                it tells us whether or not X belongs to L

member(X,[X|T]).
member(X,[H|T]):- member(X,T).

=Member

=Anonymous-Variables

`_` -> the anonymous variable

e.g.
    [_, X2, _, X4|_] = [mia, vincent, marsellus, jody, yolanda].
    X2 = vincent
    X4 = jody

=Anonymous-Variables

=Example

    member(X,[X|_]).
    member(X,[_|T]):- member(X,T).

=Example

=List-Recursion

    a2b([],[]).
    a2b([a|L1],[b|L2]):- a2b(L1,L2).

=List-Recursion

=cut