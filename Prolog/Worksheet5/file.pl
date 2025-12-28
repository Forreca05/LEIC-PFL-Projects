:- consult('family.pl').

children(Person, Children):-
    findall(Child, parent(Person,Child), Children).

children_of([], []).
children_of([H|T], [H-C|Rest]):-
    children(H,C),
    children_of(T,Rest).
    
family(F):-
    findall(P, (male(P) ; female(P)), L),
    sort(L, F).

couple(X-Y) :-
    parent(X, C),
    parent(Y, C),
    X @< Y.

couples(L):-
    setof(X-Y,couple(X-Y),L).
