:- consult('bk.pl').
:- consult('learned.pl').

% Cells are 0..80 (row-major). Asg is a list of Cell-Value pairs.
solve(Asg, Asg, 81) :- !.
solve(Asg0, Sol, C) :-
    (   memberchk(C-_, Asg0)
    ->  Asg = Asg0
    ;   between(1, 9, V),
        \+ ( member(P-V, Asg0), P \== C, peer(C, P) ),
        Asg = [C-V|Asg0]
    ),
    C1 is C + 1,
    solve(Asg, Sol, C1).

puzzle([5,3,0,0,7,0,0,0,0,
        6,0,0,1,9,5,0,0,0,
        0,9,8,0,0,0,0,6,0,
        8,0,0,0,6,0,0,0,3,
        4,0,0,8,0,3,0,0,1,
        7,0,0,0,2,0,0,0,6,
        0,6,0,0,0,0,2,8,0,
        0,0,0,4,1,9,0,0,5,
        0,0,0,0,8,0,0,7,9]).

main :-
    puzzle(L),
    findall(I-V, (nth0(I, L, V), V \= 0), Givens),
    solve(Givens, Sol, 0),
    msort(Sol, Sorted),
    pairs_values(Sorted, Vs),
    forall(between(0, 8, R),
           ( findall(V, (between(0, 8, C), I is R*9+C, nth0(I, Vs, V)), Row),
             writeln(Row) )).