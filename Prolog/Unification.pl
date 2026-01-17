
=Unification

Two terms unify if:
    they are identical terms
    they contain variables that can be consistently instantiated
        with terms in such a way the resulting terms are equal

e.g.
    f(a, Y) and f(X, g(Z)) unify with a = X, Y = g(Z)
    f(h(a, b)), f(U, V) and f(W, f(a, Z))
        U = a, W = h(a, b), Z = V

`=/2` is used to unify two terms (means `=` with arity 2, not the same as `==`)

Recursive definition

Two terms T1 and T2 unify if:
    T1 and T2 are atomic, then T1 and T2 unify if they are the same atom,
        or the same number
    
    T1 is a variable and T2 is any type of term, then T1 and T2 unify, and T1
        is instantiated to T2 (and vice versa)

    T1 and T2 are complex terms then they unify if:
        They have the same functor and arity,
        All their corresponding arguements unify,
        The variable instantiations are compatible

=Unification

=cut