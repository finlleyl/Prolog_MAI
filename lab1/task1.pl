% predicate my_length
my_length([], 0).
my_length([_|Y], N) :- my_length(Y, N1), N is N1 + 1.

% predicate member
member(A, [A|_]).
member(A, [_|Z]) :- member(A, Z).

% predicate append
append([], X, X).
append([A | X], Y, [A | Z]) :- append(X, Y, Z).

% predicate delete
remove(X, [X | Y], Y).
remove(X, [Y | Z], [Y | Z1]) :- remove(X, Z, Z1).

% predicate permute
permute([], []).
permute(L, [X | T]) :- remove(X, L, R), permute(R, T).

% predicate sublist
sublist(S, L) :- append(_, L1, L), append(S, _, L1).

% predicate add (8)
add(X, [], [X]).
add(X, [Y | Z], [Y | W]) :- add(X, Z, W).

% predicate index_of_min_element (12)
min([H | T], Pos) :- min_pos(T, H, 0, 1, Pos).

% help predicate (list, min_val, pos_of_min, cur_pos, res)
min_pos([], _, Pos, _, Pos).
min_pos([H | T], Min, _, CurPos, Res) :-
    H < Min,
    NewPos is CurPos,
    NextCurPos is CurPos + 1,
    min_pos(T, H, NewPos, NextCurPos, Res).
min_pos([H | T], Min, Pos, CurPos, Res) :-
    H >= Min,
    NextCurPos is CurPos + 1,
    min_pos(T, Min, Pos, NextCurPos, Res).
