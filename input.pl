/** FLP 2020
Toto je ukazkovy soubor zpracovani vstupu v prologu.
Tento soubor muzete v projektu libovolne pouzit.

autor: Martin Hyrs, ihyrs@fit.vutbr.cz
preklad: swipl -q -g start -o flp19-log -c input2.pl
*/


/** cte radky ze standardniho vstupu, konci na LF nebo EOF */
read_line(L,C) :-
	get_char(C),
	(isEOFEOL(C), L = [], !;
		read_line(LL,_),% atom_codes(C,[Cd]),
		[C|LL] = L).


/** testuje znak na EOF nebo LF */
isEOFEOL(C) :-
	C == end_of_file;
	(char_code(C,Code), Code==10).


read_lines(Ls) :-
	read_line(L,C),
	( C == end_of_file, Ls = [] ;
	  read_lines(LLs), Ls = [L|LLs]
	).


/** rozdeli radek na podseznamy */
split_line([],[[]]) :- !.
split_line([' '|T], [[]|S1]) :- !, split_line(T,S1).
split_line([32|T], [[]|S1]) :- !, split_line(T,S1).    % aby to fungovalo i s retezcem na miste seznamu
split_line([H|T], [[H|G]|S1]) :- split_line(T,[G|S1]). % G je prvni seznam ze seznamu seznamu G|S1


/** vstupem je seznam radku (kazdy radek je seznam znaku) */
split_lines([],[]).
split_lines([L|Ls],[H|T]) :- split_lines(Ls,T), split_line(L,H).

list_concat([],L,L).
list_concat([X1|L1],L2,[X1|L3]) :- list_concat(L1,L2,L3).

parseInput([
	A1, A2, A3,
	[B1, C1, D1, E1|_],
	[B2,C2,D2,E2|_],
	[B3,C3,D3,E3|_],
	F1, F2, F3|_
	], Res) :-
		flatten([A1, A2, A3], RA) ,
		flatten([B1, B2, B3], RB) ,
		flatten([C1, C2, C3], RC) ,
		flatten([D1, D2, D3], RD) ,
		flatten([E1, E2, E3], RE) ,
		flatten([F1, F2, F3], RF) ,
		Res = [RA, RB, RC, RD, RE, RF].

transposeRight([S1,S2,S3,S4,S5,S6,S7,S8,S9], [S7,S4,S1,S8,S5,S2,S9,S6,S3]).
transposeLeft([S1,S2,S3,S4,S5,S6,S7,S8,S9], [S3,S6,S9,S2,S5,S8,S1,S4,S7]).

swapTopRow(T,B,Res) :-
	[T1,T2,T3|_] = T ,
	[_,_,_,B4,B5,B6,B7,B8,B9] = B ,
	Res = [T1,T2,T3,B4,B5,B6,B7,B8,B9].

moveCubeRight(S, Res) :-
	[E,A,B,C,D,F|_] = S ,
	 transposeRight(E,En)  ,
	 transposeLeft(F,Fn)   ,
	 Res = [En,B,C,D,A,Fn] .

moveCubeLeft([E,A,B,C,D,F], Res) :-
	 transposeRight(F,Fn)  ,
	 transposeLeft(E,En)   ,
	 Res = [En,D,A,B,C,Fn] .

moveCubeBack([E,A,B,C,D,F], Res) :-
	 transposeRight(B,Bn)  ,
	 transposeRight(E,En)  ,
	 transposeRight(En,Enn)  ,
	 transposeLeft(D,Dn)   ,
	 transposeRight(C,Cn)  ,
	 transposeRight(Cn,Cnn)  ,
	 Res = [A,F,Bn,Enn,Dn,Cnn] .

moveCubeFront([A,F,B,E,D,C], Res) :-
	 transposeLeft(B,Bn)  ,
	 transposeLeft(E,En)  ,
	 transposeLeft(En,Enn)  ,
	 transposeRight(D,Dn)   ,
	 transposeLeft(C,Cn)  ,
	 transposeLeft(Cn,Cnn)  ,
	 Res = [Enn,A,Bn,Cnn,Dn,F] .

/* _____ MOVES _____ */
u(S, Res) :-
	[E,A,B,C,D,F|_] = S     ,
	transposeRight(E, En)   ,
	swapTopRow(B,A,An)      ,
	swapTopRow(C,B,Bn)      ,
	swapTopRow(D,C,Cn)      ,
	swapTopRow(A,D,Dn)      ,
	Res = [En,An,Bn,Cn,Dn,F].

ur(S, Res) :-
	[E,A,B,C,D,F|_] = S     ,
	transposeLeft(E, En)   ,
	swapTopRow(D,A,An)      ,
	swapTopRow(A,B,Bn)      ,
	swapTopRow(B,C,Cn)      ,
	swapTopRow(C,D,Dn)      ,
	Res = [En,An,Bn,Cn,Dn,F].

f(S, Res) :-
	moveCubeBack(S, S1) ,
	u(S1, S2)         ,
	moveCubeFront(S2, Res) .

fr(S, Res) :-
	moveCubeBack(S, S1) ,
	ur(S1, S2)         ,
	moveCubeFront(S2, Res) .

b(S, Res) :-
	moveCubeFront(S, S1) ,
	u(S1, S2)         ,
	moveCubeBack(S2, Res) .

br(S, Res) :-
	moveCubeFront(S, S1) ,
	ur(S1, S2)         ,
	moveCubeBack(S2, Res) .

d(S, Res) :-
	moveCubeBack(S, S1)    ,
	moveCubeBack(S1, S2)    ,
	u(S2, S3)          ,
	moveCubeFront(S3, S4) ,
	moveCubeFront(S4, Res) .

dr(S, Res) :-
	moveCubeBack(S, S1)    ,
	moveCubeBack(S1, S2)    ,
	ur(S2, S3)          ,
	moveCubeFront(S3, S4) ,
	moveCubeFront(S4, Res) .

r(S, Res) :-
	moveCubeRight(S,S1),
	moveCubeBack(S1,S2),
	u(S2,S3),
	moveCubeFront(S3,S4),
	moveCubeLeft(S4, Res).

rr(S, Res) :-
	moveCubeRight(S,S1),
	moveCubeBack(S1,S2),
	ur(S2,S3),
	moveCubeFront(S3,S4),
	moveCubeLeft(S4, Res).

l(S, Res) :-
	moveCubeLeft(S,S1),
	moveCubeBack(S1,S2),
	u(S2,S3),
	moveCubeFront(S3,S4),
	moveCubeRight(S4, Res).

lr(S, Res) :-
	moveCubeLeft(S,S1),
	moveCubeBack(S1,S2),
	ur(S2,S3),
	moveCubeFront(S3,S4),
	moveCubeRight(S4, Res).

start :-
		prompt(_, ''),
		read_lines(LL),
		split_lines(LL,S),
		parseInput(S, R),
		u(R, Res1),
		write(Res1),
		write(' -- u\n'),
		ur(R, Res2),
		write(Res2),
		write(' -- ur\n'),
		d(R, Res3),
		write(Res3),
		write(' -- d\n'),
		dr(R, Res4),
		write(Res4),
		write(' -- dr\n'),
		r(R, Res5),
		write(Res5),
		write(' -- r\n'),
		rr(R, Res6),
		write(Res6),
		write(' -- rr\n'),
		l(R, Res7),
		write(Res7),
		write(' -- l\n'),
		lr(R, Res8),
		write(Res8),
		write(' -- lr\n'),
		f(R, Res9),
		write(Res9),
		write(' -- f\n'),
		fr(R, Res10),
		write(Res10),
		write(' -- fr\n'),
		b(R, Res11),
		write(Res11),
		write(' -- b\n'),
		br(R, Res12),
		write(Res12),
		write(' -- br\n'),
		halt.


/** nacte zadany pocet radku */
read_lines2([],0).
read_lines2(Ls,N) :-
	N > 0,
	read_line(L,_),
	N1 is N-1,
	read_lines2(LLs, N1),
	Ls = [L|LLs].


/** vypise seznam radku (kazdy radek samostatne) */
write_lines2([]).
write_lines2([H|T]) :- writeln(H), write_lines2(T). %(writeln je "knihovni funkce")


/** rozdeli radek na podseznamy -- pracuje od konce radku */
%zalozit prvni (tzn. posledni) seznam:
split_line2([],[[]]) :- !.
%pridat novy seznam:
split_line2([' '|T], [[]|S1]) :- !, split_line2(T,S1).
%pridat novy seznam, uchovat oddelujici znak:
split_line2([H|T], [[],[H]|S1]) :- (H=','; H=')'; H='('), !, split_line2(T,S1).
%pridat znak do existujiciho seznamu:
split_line2([H|T], [[H|G]|S1]) :- split_line2(T,[G|S1]).


/** pro vsechny radky vstupu udela split_line2 */
% vstupem je seznam radku (kazdy radek je seznam znaku)
split_lines2([],[]).
split_lines2([L|Ls],[H|T]) :- split_lines2(Ls,T), split_line2(L,H).


/** nacte N radku vstupu, zpracuje, vypise */
start2(N) :-
		prompt(_, ''),
		read_lines2(LL, N),
		split_lines2(LL,S),
		write_lines2(S).


/** prevede retezec na seznam atomu */
% pr.: string("12.35",S). S = ['1', '2', '.', '3', '5'].
retezec([],[]).
retezec([H|T],[C|CT]) :- atom_codes(C,[H]), retezec(T,CT).


/** prevede seznam cislic na cislo */
% pr.: cislo([1,2,'.',3,5],X). X = 12.35
cislo(N,X) :- cislo(N,0,X).
cislo([],F,F).
cislo(['.'|T],F,X) :- !, cislo(T,F,X,10).
cislo([H|T],F,X) :- FT is 10*F+H, cislo(T,FT,X).
cislo([],F,F,_).
cislo([H|T],F,X,P) :- FT is F+H/P, PT is P*10, cislo(T,FT,X,PT).


/** existuje knihovni predikat number_chars(?Number, ?CharList) */
% pr.: number_chars(12.35, ['1', '2', '.', '3', '5']).
