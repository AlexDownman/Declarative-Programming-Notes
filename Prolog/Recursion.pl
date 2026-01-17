
=Recursion

Recursion is formulated using relations instead of functions

=Recursion

=cut

%Descendants Example

child(bridget, caroline).
child(caroline, donna).

% bridget <- caroline <- donna

descend(X,Y):- child(X,Y).
descend(X,Y):- child(X,Z), child(Z,Y).

%Descendants Example 2

child(anne, bridget).
child(bridget, caroline).
child(caroline, donna).
child(donna, emily).

% anne <- briget <- caroline <- donna <- emily
% emily is not a descendant


