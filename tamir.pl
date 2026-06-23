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
