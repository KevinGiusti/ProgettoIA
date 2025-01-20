a(taglia, [small,large]).
a(forma,  [oblunga,compatta,altra]).
a(buchi,  [0,1,2,3,molti]).

e(dado,	  [taglia=small, forma=compatta, buchi=1]).
e(dado,	  [taglia=small, forma=compatta, buchi=1]).
e(dado,	  [taglia=small, forma=compatta, buchi=1]).
%e(dado,	  [taglia=large, forma=compatta, buchi=1]).

e(bullone,[taglia=small, forma=compatta, buchi=0]).
e(bullone,[taglia=small, forma=oblunga,  buchi=0]).

e(chiave, [taglia=small, forma=altra,    buchi=2]).
e(chiave, [taglia=small, forma=oblunga,  buchi=1]).
e(chiave, [taglia=large, forma=oblunga,  buchi=1]).
%e(chiave, [taglia=small, forma=compatta, buchi=1]).  % esempio sporco

e(penna,  [taglia=large, forma=oblunga,  buchi=0]).
e(penna,  [taglia=large, forma=oblunga,  buchi=0]).

e(forbici,[taglia=large, forma=oblunga,  buchi=2]).
e(forbici,[taglia=large, forma=altra,    buchi=2]).

