/*
 * **********************************************
 * Printing result depth
 *
 * You can enlarge it, if needed.
 * **********************************************
 */
maximum_printing_depth(100).

:- current_prolog_flag(toplevel_print_options, A),
   (select(max_depth(_), A, B), ! ; A = B),
   maximum_printing_depth(MPD),
   set_prolog_flag(toplevel_print_options, [max_depth(MPD)|B]).

% Signature: sub_list(Sublist, List)/2
% Purpose: All elements in Sublist appear in List in the same order.
% Precondition: List is fully instantiated (queries do not include variables in their second argument).

sub_list([], []).
sub_list([H|Rest], [H|T]) :- sub_list(Rest, T).
sub_list(Sub, [_|T]) :- sub_list(Sub, T).


% Signature: swap_list(List, InversedList)/2
% Purpose: InversedList is the ‘mirror’ representation of List, i.e, each item in the list is recursively replaced with the item at the position, with refers to the beginning and the end of the list.   


my_is_list([]).
my_is_list([_|Xs]) :- my_is_list(Xs).

my_append([], Xs, Xs):- my_is_list(Xs).
my_append([X | Xs], Ys, [X | Zs]) :- my_append(Xs, Ys, Zs).

swap_list([], []).

swap_list([H|T], Result) :-
	my_is_list(H),
	swap_list(H, RevH),
	swap_list(T, RevT),
	my_append(RevT, [RevH], Result), !.

swap_list([H|T], Result) :-
	swap_list(T, RevT),
	my_append(RevT, [H], Result).


% Signature: sub_tree(Subtree, Tree)/2
% Purpose: Tree contains Subtree.

sub_tree(T, T) :- T \= void.
sub_tree(Sub, tree(_, Left, _)) :-sub_tree(Sub, Left).
sub_tree(Sub, tree(_, _, Right)) :-sub_tree(Sub, Right).

% Signature: swap_tree(Tree, InversedTree)/2
% Purpose: InversedTree is the �mirror� representation of Tree.
