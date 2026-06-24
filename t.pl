swap_tree(tree(T, void, void), tree(T, void, void)).
swap_tree(tree(T, L1, R1), tree(T, L2, R2)) :- swap_tree(L1, R2), swap_tree(L2, R1).