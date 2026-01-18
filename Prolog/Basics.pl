=Basic
Facts -> Statements stored typically in a knowledge/data base
Queries -> Questions about the information stored in the knowledge base
Rules -> Hold information that is conditionally true
=Basic
=cut

%example knowledge bases

%kb1

woman(mia).
woman(jody).
woman(yolanda).
playsAirGuitar(jody).
party.

%kb2

happy(yolanda).
playsAirGuitar(mia) :- listensToMusic(mia).
playsAirGuitar(yolanda) :- listensToMusic(yolanda).
listensToMusic(mia).
listensToMusic(yolanda) :- happy(yolanda).

%kb3

% :- means if
% facts separated by ',' are similar to AND operators
% facts separated by ';' are similar to OR operators

happy(vincent).
listensToMusic(butch).

playsAirGuitar(vincent) :-
                listensToMusic(vincent), happy(vincent).
playsAirGuitar(butch) :-
                happy(butch).
playsAirGuitar(butch) :-
                listensToMusic(butch).

=Syntax
Atoms -> a seqeunce of characters of upper-case letters, lower-case letters, digits
            or underscore, starting with a lower-case letter
            Can be cheated by using single quotes ' '
            A sequence of special characters -> , ; . :- =>

Numbers -> Integers
           Floats

Variables -> A sequence of upper-case letters, lower-case letters, digits similar
             to Atoms however they start with an upper-case letter or underscore

=Terms
Terms -> Basic data structure of Prolog

Terms are built up from Basic terms (atoms, numbers, variables)

A functor applied directly to a sequence of terms 
So if `f` is a functor and t1,t2,...tn are terms then
f(t1, t2, ..., tn) is a term

e.g. 
man(bill).
f(a, X, g(b, c)).
father(father(bill)).

A functor must be an atom
The arity of functor f is the num of arguements it takes
An n-ary functor is denoted f/n
Example: in above man/1, f/3 and father/1

=cut
