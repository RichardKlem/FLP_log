# FLP_log
Logic programming project in Prolog language

# Useful thoughts
 - Associative - the permutations in the row can be grouped together: ex. (RB')L = R(B'L)
 - Neutral element - there is a permutation which doesn't rearrange the set: ex. RR'
 - Inverse element - every permutation has an inverse permutation: ex. R - R'
 - Commutative - it's not a necessary condition of the permutation group but notice that FB = BF but FR != RF
 - Degree of permutations - see above. ex: 4 x F = 1, 6 x (R'D'RD) = 1, 336 x (UUR'LLDDB'R'U'B'R'U'B'R'U) = 1


# Tahy
## Slozeno:
555
555
555
111 222 333 444
111 222 333 444
111 222 333 444
666
666
666

E1,E2,E3
E4,E5,E6
E7,E8,E9
A1,A2,A3 B1,B2,B3 C1,C2,C3 D1,D2,D3
A4,A5,A6 B4,B5,B6 C4,C5,C6 D4,D5,D6
A7,A8,A9 B7,B8,B9 C7,C8,C9 D7,D8,D9
F1,F2,F3
F4,F5,F6
F7,F8,F9

## F
555
555
444
111 522 333 446
111 522 333 446
111 522 333 446
222
666
666

E1,E2,E3
E4,E5,E6
D3,D6,D9
A1,A2,A3 E1,B2,B3 C1,C2,C3 D1,D2,F3
A4,A5,A6 E4,B5,B6 C4,C5,C6 D4,D5,F6
A7,A8,A9 E7,B8,B9 C7,C8,C9 D7,D8,F9
B1,B2,B3
F4,F5,F6
F7,F8,F9


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
