% Cover 8x8 chessboard by 21 3x1 tiles and 1 1x1 tile.
% h (X,Y) represents a tile at (X,Y) .. (X+2,Y).
% V (X,Y) represents a tile at (X,Y) .. (X,Y+2).

21 {h(1..6,1..8) ; v(1..8,1..6)} 21.

:- h(X,Y),h(X+(1..2),Y).
:- v(X,Y),v(X,Y+(1..2)).

:- h(X,Y) , v( X + (0..2) , Y - (0..2)).
