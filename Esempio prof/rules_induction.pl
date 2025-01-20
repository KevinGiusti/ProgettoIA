:- ensure_loaded(training_set).
:- op(300,xfx,<==).

/* classifica( +Oggetto, -Classe)
 *  Oggetto: [Attributo1=Valore1, .. ,AttributoN=ValoreN]
 *  Classe:  classe a cui potrebbe appartenere un oggetto caratterizzato
 *           da quelle coppie Attributo=Valore
 *  presuppone che sia stata effettuata la classificazione
 */

classifica(Oggetto,Classe) :-
	Classe <== Descrizione,
	member(CongiunzioneAttributi,Descrizione),
	soddisfa(Oggetto,CongiunzioneAttributi).

% soddisfa(+Oggetto,+Congiunzione)
% non compare lo stesso attributo in Oggetto ed in Congiunzione con
% valori diversi
soddisfa( Oggetto, Congiunzione) :-
	\+ (member(Att=Valx,Congiunzione), member(Att=Valy,Oggetto), Valx \== Valy).

% apprendi(Classe) raccoglie il training set in una lista
% costruisce e manda in output una descrizione per la Classe
% e asserisce la corrispondente Regola

apprendi(Classe) :-
	bagof( e(C,O), e(C,O), Esempi),	       % raccoglie  gli Esempi
	apprendi(Esempi, Classe, Descrizione), % induce la Descrizione della Classe
	nl,write(Classe),write('<=='),nl,      % la stampa
	writelist(Descrizione),
	assert( Classe <== Descrizione ).      % e la asserisce

% apprendi(Esempi,Classe,Descrizione)
% Descrizione copre esattamente gli esempi di Classe nella lista Esempi

apprendi( Esempi, Classe, []) :-                % Descrizione vuota perché non ci sono
	\+ member( e(Classe,_), Esempi ).       % esempi da coprire di quella Classe
apprendi( Esempi, Classe, [Cong|Congi] ) :-
	apprendi_cong( Esempi, Classe, Cong),   % induce una Cong di coppie Attr=Val che copre
						% almeno un esempio di Classe e nessun esempio
						% di una qualunque altra classe
	rimuovi( Esempi, Cong, RestoEsempi ),   % rimuove gli esempi coperti da Cong
	apprendi( RestoEsempi, Classe, Congi ). % copre gli esempi rimasti

% apprendi_cong(Esempi,Classe,Cong)
% Cong è una lista di coppie Attr=Val soddisfatti da alcuni esempi
% di Classe e da nessun esempio di un'altra classe

apprendi_cong( Esempi, Classe, []) :-
	\+ (member( e(Cl,_), Esempi), Cl \== Classe),
	!.	                               % non ci sono esempi di altre classi
apprendi_cong( Esempi, Cl, [Cond|Conds] ) :-
	scegli_cond( Esempi, Cl, Cond ),       % sceglie una coppia Attr=Val
	filtra( Esempi, [Cond], Esempi1 ),     % seleziona in Esempi1 quelli che hanno Attr=Val
	apprendi_cong( Esempi1, Cl, Conds ).

scegli_cond( Esempi, Classe, AttVal) :-
	findall( AV/Punti, punteggioAV(Esempi,Classe,AV,Punti), AVs),
	best( AVs, AttVal).

best([AttVal/_],AttVal).
best([AV0/S0,AV1/S1|AVSlist],AttVal) :-
	S1 > S0, !,    % AV1 è meglio di AV0
	best([AV1/S1|AVSlist],AttVal)
	;
	best([AV0/S0|AVSlist],AttVal).

% filtra(Esempi,Condizione,Esempi1)
% Esempi1 contiene elementi di Esempi che soddisfano Condizione

filtra(Esempi,Cond,Esempi1) :-
	findall(e(Classe,Ogg), (member(e(Classe,Ogg),Esempi),soddisfa(Ogg,Cond)), Esempi1).

% rimuovi(Esempi,Cong,RestoEsempi)
% rimuove da Esempi quelli coperti da Cong e restituisce Esempi1

rimuovi([],_,[]).
rimuovi([e(_,Ogg)|Es],Conge,Es1) :-
	soddisfa(Ogg,Conge), !, % il primo esempio matcha Conge
	rimuovi(Es,Conge,Es1).  % lo rimuove

rimuovi([E|Es],Conge,[E|Es1]) :- % mantiene il primo esempio
	rimuovi(Es,Conge,Es1).

punteggioAV( Esempi, Classe, AttVal, Punti ) :-
	candidato( Esempi, Classe, AttVal),  % un attributo/valore adatto
	filtra(Esempi,[AttVal],Esempi1),  % gli Esempi1 soddisfano la condizione Att=Val
	length(Esempi1,N1),
	conta_pos(Esempi1,Classe,Npos1),  % numero di esempi positivi
	Npos1 > 0,                        % almeno un esempio positivo
	Punti is (Npos1 + 1) / (N1 + 2).

candidato(Esempi,Classe,Att=Val) :-
	a(Att, Valori),                  % un attributo
	member(Val,Valori),              % un valore
	adatto(Att=Val,Esempi,Classe).

% almeno un esempio negativo deve non matchare con AttVal
adatto(AttVal,Esempi,Classe) :-
	member(e(ClasseX,OggX),Esempi),	% esempio
	ClasseX \== Classe,		% negativo
	\+ soddisfa(OggX,[AttVal]), !.	% non soddisfatto dalla coppia Att=Val

% conta_pos(Esempi,Classe,N)
% N è il numero degli esempi positivi di Classe

conta_pos([],_,0).
conta_pos([e(ClasseX,_)|Esempi],Classe,N) :-
	conta_pos(Esempi,Classe,N1),
	(ClasseX=Classe,!,N is N1+1 ; N=N1).

writelist([]).
writelist([X|L]) :-
	tab(2), write(X), nl,
	writelist(L).



