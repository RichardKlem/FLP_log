WARNING: UNFINISHED PROJECT!
===================
# FLP_log
Logic programming project in Prolog language.
Task is to solve Rubik's cube, see input and output format bellow.

# Useful thoughts
 - Associative - the permutations in the row can be grouped together: ex. (RB')L = R(B'L)
 - Neutral element - there is a permutation which doesn't rearrange the set: ex. RR'
 - Inverse element - every permutation has an inverse permutation: ex. R - R'
 - Commutative - it's not a necessary condition of the permutation group but notice that FB = BF but FR != RF
 - Degree of permutations - see above. ex: 4 x F = 1, 6 x (R'D'RD) = 1, 336 x (UUR'LLDDB'R'U'B'R'U'B'R'U) = 1


# Tahy
## Slozeno:
555<br>
555<br>
555<br>
111 222 333 444<br>
111 222 333 444<br>
111 222 333 444<br>
666<br>
666<br>
666<br>

E1,E2,E3<br>
E4,E5,E6<br>
E7,E8,E9<br>
A1,A2,A3 B1,B2,B3 C1,C2,C3 D1,D2,D3<br>
A4,A5,A6 B4,B5,B6 C4,C5,C6 D4,D5,D6<br>
A7,A8,A9 B7,B8,B9 C7,C8,C9 D7,D8,D9<br>
F1,F2,F3<br>
F4,F5,F6<br>
F7,F8,F9<br>

## F
555<br>
555<br>
444<br>
111 522 333 446<br>
111 522 333 446<br>
111 522 333 446<br>
222<br>
666<br>
666<br>

E1,E2,E3<br>
E4,E5,E6<br>
D3,D6,D9<br>
A1,A2,A3 E1,B2,B3 C1,C2,C3 D1,D2,F3<br>
A4,A5,A6 E4,B5,B6 C4,C5,C6 D4,D5,F6<br>
A7,A8,A9 E7,B8,B9 C7,C8,C9 D7,D8,F9<br>
B1,B2,B3<br>
F4,F5,F6<br>
F7,F8,F9<br>

[//]: # (u&#40;R, Res1&#41;,)
[//]: # (write&#40;Res1&#41;,)
[//]: # (write&#40;' -- u\n'&#41;,)
[//]: # (ur&#40;R, Res2&#41;,)
[//]: # (write&#40;Res2&#41;,)
[//]: # (write&#40;' -- ur\n'&#41;,)
[//]: # (d&#40;R, Res3&#41;,)
[//]: # (write&#40;Res3&#41;,)
[//]: # (write&#40;' -- d\n'&#41;,)
[//]: # (dr&#40;R, Res4&#41;,)
[//]: # (write&#40;Res4&#41;,)
[//]: # (write&#40;' -- dr\n'&#41;,)
[//]: # (r&#40;R, Res5&#41;,)
[//]: # (write&#40;Res5&#41;,)
[//]: # (write&#40;' -- r\n'&#41;,)
[//]: # (rr&#40;R, Res6&#41;,)
[//]: # (write&#40;Res6&#41;,)
[//]: # (write&#40;' -- rr\n'&#41;,)
[//]: # (l&#40;R, Res7&#41;,)
[//]: # (write&#40;Res7&#41;,)
[//]: # (write&#40;' -- l\n'&#41;,)
[//]: # (lr&#40;R, Res8&#41;,)
[//]: # (write&#40;Res8&#41;,)
[//]: # (write&#40;' -- lr\n'&#41;,)
[//]: # (f&#40;R, Res9&#41;,)
[//]: # (write&#40;Res9&#41;,)
[//]: # (write&#40;' -- f\n'&#41;,)
[//]: # (fr&#40;R, Res10&#41;,)
[//]: # (write&#40;Res10&#41;,)
[//]: # (write&#40;' -- fr\n'&#41;,)
[//]: # (b&#40;R, Res11&#41;,)
[//]: # (write&#40;Res11&#41;,)
[//]: # (write&#40;' -- b\n'&#41;,)
