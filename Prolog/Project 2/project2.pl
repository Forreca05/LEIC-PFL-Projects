%:- use_module(library(lists)).

% length(?List, ?Size)
/* length( [ ], 0 ).
   length( [_|T], L ):-
		length(T, L1),
		L is L1+1.*/

% member(?Elem, ?List)
/* member( X, [X|_] ).
   member( X, [_|T] ):-
		member(X, T).*/

% memberchk(?Elem, ?List)
/* memberchk( X, [X|_] ).
   memberchk( X, [Y|T] ):-
		X \= Y,
		memberchk(X, T).*/

% append(?L1, ?L2, ?L3)
/* append( [ ], L2, L2 ).
   append( [H|T], L2, [H|T3] ):-
		append(T, L2, T3).*/

% sort(+List, -SortedList)
% keysort(+PairList, -SortedList)

% nth0(?Pos, ?List, ?Elem) / nth1(?Pos, ?List, ?Elem)
% nth0(?Pos, ?List, ?Elem, ?Rest) / nth1(?Pos, ?List, ?Elem, ?Rest)

% select(?X, ?XList, ?Y, ?YList) finds an occurrence of X in XList, replaces it with Y, and produces YList
% delete(+List, +ToDel, -R)
% delete(+List, +ToDel, +Count, -R) Deletes Count occurrences of ToDel in List, result R
% last(?Init, ?Last, ?List) Last element of List and the rest in Init

% segment(?List, ?Segment) succeed when Segment is a contiguous subsequence of List.
% sublist(+List, ?Part, ?Before, ?Length, ?After) extract a contiguous Part of List with Length size and Before/After pre/suffix

% append(+ListOfLists, -List) concate of Haskell
% reverse(?List, ?Reversed)
% rotate_list(+Amount, ?List, ?Rotated) 

% transpose(?Matrix, ?Transposed) converts rows into columns (and vice-versa)
% remove_dups(+List, ?PrunedList) 
% permutation(?List, ?Permutation) List permutations, with backtracking

% sumlist(+ListOfNumbers, ?Sum)
% max_member(?Max, +List)
% min_member(?Min, +List)
% max_member(:Comp, ?Max, +List) Comp is a comparison predicate of arity 2 used to compare elements
% min_member(:Comp, ?Min, +List)

% maplist(:Pred, +L) / maplist(:Pr, +L1, ?L2) / maplist(:Pr, +L1, ?L2, ?L3) Applies predicate to each element / map / zipWith
% map_product(:Pred, +Xs, +Ys, ?List) Cartesian product

% scanlist(:Pred, +Xs, ?Start, ?Final) foldl
% cumlist(:Pred, +Xs, ?Start, ?List) Similar to accumulate in python

% some(:Pred, +List) any
% include(:P, +X, ?L) / include(:P, +X, +Y, ?L) / include(:P, +X, +Y, +Z, ?L) filter / P(x, y) succeeds, L ⊆ X / P(x, y, z) succeeds, L ⊆ X
% exclude(:P, +X, ?L) / exclude(:P, +X,+Y, ?L) / exclude(:P, +X,+Y,+Z, ?L) 
% group(:Pred, +List, ?Front, ?Back) Group until predicate fails, splitting the list at that point


% read/1 reads a term (by default, from the standard input)
% • Input needs to end with a period (spans multiple lines)
% • If a compound term is being read, input must match term being read
% • Use unnamed variables (_X)

% write/1 writes a term
% nl/0 prints a new line

% get_char obtains a single character
% get_code obtains the ASCII code of a single character
% put_char prints a single character
% put_code prints a single character given its ASCII code
% char_code(?Atom, ?Code) allows converting between character and corresponding ASCII code
% get_byte and put_byte read and write binary data
% peek_char, peek_code and peek_byte obtain a single character /code / byte without consuming it from the input stream
% format prints terms with specified formatting options  format("~s", [T]),
% skip_line skips any input until the end of the line

% see/1 opens a file for reading
%• The file is used for reading instead of the standard input
% seen/0 closes the file that was opened for reading
% tell/1 opens a file for writing
%• The file is used for writing instead of the standard output
% told/0 closes the file that was opened for writing

% repeat always succeeds
%• Can be used to repeat some portion of code until it succeeds
% between(+Lower, +Upper, ?Number) can be used both to test and generate integers between given bounds
%• Necessary to include the between library

% atom_length('Q ', L).
