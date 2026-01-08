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
