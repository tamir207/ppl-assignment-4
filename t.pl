sub_tree(T, T) :- T \= void.
sub_tree(Sub, tree(_, Left, _)) :-sub_tree(Sub, Left).
sub_tree(Sub, tree(_, _, Right)) :-sub_tree(Sub, Right).