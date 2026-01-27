%author(AuthorID, Name, YearOfBirth, CountryOfBirth).
author(1, 'John Grisham', 1955, 'USA').
author(2, 'Wilbur Smith', 1933, 'Zambia').
author(3, 'Stephen King', 1947, 'USA').
author(4, 'Michael Crichton', 1942, 'USA').

%book(Title, AuthorID, YearOfRelease, Pages, Genres).
book('The Firm', 1, 1991, 432, ['Legal thriller']).
book('The Client', 1, 1993, 422, ['Legal thriller']).
book('The Runaway Jury', 1, 1996, 414, ['Legal thriller']).
book('The Exchange', 1, 2023, 338, ['Legal thriller']).

book('Carrie', 3, 1974, 199, ['Horror']).
book('The Shining', 3, 1977, 447, ['Gothic novel', 'Horror', 'Psychological horror']).
book('Under the Dome', 3, 2009, 1074, ['Science fiction', 'Political']).
book('Doctor Sleep', 3, 2013, 531, ['Horror', 'Gothic', 'Dark fantasy']).

book('Jurassic Park', 4, 1990, 399, ['Science fiction']).
book('Prey', 4, 2002, 502, ['Science fiction', 'Techno-thriller', 'Horror',
'Nanopunk']).
book('Next', 4, 2006, 528, ['Science fiction', 'Techno-thriller', 'Satire']).

book_author(Title,Author):-
    book(Title, AuthorID,_,_,_),
    author(AuthorID,Author,_,_).

multi_genre_book(Title):-
    book(Title,_,_,_,Genres),
    length(Genres,N),
    N > 1.

shared_genres(Title1,Title2,Common):-
    book(Title1,_,_,_,Genres1),
    book(Title2,_,_,_,Genres2),
    Title1 \= Title2,
    common(Genres1,Genres2,[],Common).

common([],_,Acc,Acc).
common([A|T],Genres2,Acc,Common):-
    (member(A,Genres2),
     \+ member(A,Acc)
     -> common(T,Genres2,[A|Acc],Common);
     common(T,Genres2,Acc,Common)).
  
similarity(Title1,Title2,Sim):-
    book(Title1,_,_,_,Genres1),
    book(Title2,_,_,_,Genres2),
    shared_genres(Title1,Title2,Common),
    length(Common,Union),
    length(Genres1,L1),
    length(Genres2,L2),
    Intersect is L1 + L2 - Union,
    Sim is Union / Intersect.

%  gives_gift_to(Giver, Gift, Receiver)
gives_gift_to(bernardete, 'The Exchange', celestina).
gives_gift_to(celestina, 'The Brethren', eleuterio).
gives_gift_to(eleuterio, 'The Summons', felismina).
gives_gift_to(felismina, 'River God', juvenaldo).
gives_gift_to(juvenaldo, 'Seventh Scroll', leonilde).
gives_gift_to(leonilde, 'Sunbird', bernardete).
gives_gift_to(marciliano, 'Those in Peril', nivaldo).
gives_gift_to(nivaldo, 'Vicious Circle', sandrino).
gives_gift_to(sandrino, 'Predator', marciliano).

:- use_module(library(lists)).

circle_size(Person,Size):-
    gives_gift_to(Person,_,Next),
    circle_size_aux(Person,Next,1,Size).

circle_size_aux(P,P,Acc,Acc).
circle_size_aux(Start,Current,Acc,Size):-
    gives_gift_to(Current,_,Next),
    Acc2 is Acc + 1,
    circle_size_aux(Start,Next,Acc2,Size).

circle_sizes([],Acc,Acc).
circle_sizes([A|T],Acc,Sizes):-
    circle_size(A,S),
    circle_sizes(T,[S|Acc],Sizes).

largest_circle(People):-
    findall(P, gives_gift_to(P,_,_), AllPeople),
    circle_sizes(AllPeople,[],Sizes),
    max_member(M, Sizes),
    findall(P, (member(P,AllPeople), circle_size(P,M)), People).

