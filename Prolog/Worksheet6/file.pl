double(X, Y):- Y is X*2.

map(_,[],[]).
map(F,[H|T],[L|Rest]):-
    call(F,H,L),
    map(F,T,Rest).

sum(A, B, S):- S is A+B.

fold(_, S, [], S).
fold(F, S, [H|T], M):-
    call(F,S,H,L),
    fold(F,L,T,M).
fold(sum, 0, [2, 4, 6], F).