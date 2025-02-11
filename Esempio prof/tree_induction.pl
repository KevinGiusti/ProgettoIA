/*
il programma che segue utilizza l'indice Gini come misura di
diseguaglianza di un insieme di esempi. Esso è definito così:
Gini = sum from{i <> j} P(i)*P(j)
     = 1 - sum from{classi} P( classe)^2
dopo aver applicato un criterio A, l'indice Gini diventa
Gini = sum from{v} P(v) * sum from{i <> j} P(i|v)*P(j|v)
per esempio: dato l'insieme di esempi iniziale (qui sotto),
interpretando le probabilità come frequenze relative, il coefficiente
di Gini associato agli esempi è:
Gini= 1 - P(dado)^2 - P(bullone)^2 - P(chiave)^-P(penna)^2-P(forbici)^2
    = 1 - (3/12)^2 - (2/12)^2 - (3/12)^2 - (2/12)^2 - (2/12)^2
    = 1 - 9/144- 4/144- 9/144 - 4/144 - 4/144
    = 1 - 30/144
    = 114/144
    =
   P(dado)P(bullone)+P(dado)P(chiave)+P(dado)P(penna)+P(dado)P(forbici)+
   P(bullone)P(dado)+P(bullone)P(chiave)P(bullone)P(penna)+P(bullone)P(forbici)+
   P(chiave)P(dado)+P(chiave)P(bullone)+P(chiave)P(penna)+P(chiave)P(forbici)+
   P(penna)P(dado)+P(penna)P(bullone)+P(penna)P(chiave)+P(penna)P(forbici)+
   P(forbici)P(dado)+P(forbici)P(bullone)+P(forbici)P(chiave)+P(forbici)P(penna)
   = 3/12*2/12 + 3/12*3/12 + 3/12*2/12 + 3/12*2/12 + 2/12*3/12 +
   2/12*3/12 + 2/12*2/12 + 2/12*2/12 + 3/12*3/12 + 3/12*2/12 + +
   3/12*2/12 + 3/12*2/12 + 2/12*3/12 + 2/12*2/12 + 2/12*3/12 + +
   2/12*2/12 + 2/12*3/12 + 2/12*2/12 + 2/12*3/12 + 2/12*2/12 = 1/144
   (6+9+6+6+6+6+4+4+9+6+6+6+6+4+6+4+6+4+6+4)
   = 114/144
   = 0,7916666667

applicando un attributo (per esempio "taglia") il coefficiente Gini
diventa:

Gini(taglia) =
= P(small)*(P(dado|small)   * P(bullone|small) +
            P(dado|small)   * P(chiave|small)  +
            P(dado|small)   * P(penna|small)   +
            P(dado|small)   * P(forbici|small) +
            P(bullone|small)* P(dado|small)    +
            P(bullone|small)* P(chiave|small)  +
            P(bullone|small)* P(penna|small)   +
            P(bullone|small)* P(forbici|small) +
            P(chiave|small) * P(dado|small)    +
            P(chiave|small) * P(bullone|small) +
            P(chiave|small) * P(penna|small)   +
            P(chiave|small) * P(forbici|small) +
            P(penna|small)  * P(dado|small)    +
            P(penna|small)  * P(bullone|small) +
            P(penna|small)  * P(chiave|small)  +
            P(penna|small)  * P(forbici|small) +
            P(forbici|small)* P(dado|small)    +
            P(forbici|small)* P(bullone|small) +
            P(forbici|small)* P(penna|small)   +
            P(forbici|small)* P(chiave|small)) +
  P(large)*(P(dado|large)   * P(bullone|large) +
            P(dado|large)   * P(chiave|large)  +
            P(dado|large)   * P(penna|large)   +
            P(dado|large)   * P(forbici|large) +
            P(bullone|large)* P(dado|large)    +
            P(bullone|large)* P(chiave|large)  +
            P(bullone|large)* P(penna|large)   +
            P(bullone|large)* P(forbici|large) +
            P(chiave|large) * P(dado|large)    +
            P(chiave|large) * P(bullone|large) +
            P(chiave|large) * P(penna|large)   +
            P(chiave|large) * P(forbici|large) +
            P(penna|large)  * P(dado|large)    +
            P(penna|large)  * P(bullone|large) +
            P(penna|large)  * P(chiave|large)  +
            P(penna|large)  * P(forbici|large) +
            P(forbici|large)* P(dado|large)    +
            P(forbici|large)* P(bullone|large) +
            P(forbici|large)* P(penna|large)   +
            P(forbici|large)* P(chiave|large))

= 7/12 *(           3/7*2/7 + 3/7*2/7 + 3/7*0/7 + 3/7*0/7   +
          2/7*3/7 +           2/7*2/7 + 2/7*0/7 + 2/7*0/7   +
          2/7*3/7 + 2/7*2/7 +           2/7*0/7 + 2/7*0/7   +
          0/7*3/7 + 0/7*2/7 + 0/7*2/7 +           0/7*0/7   +
          0/7*3/7 + 0/7*2/7 + 0/7*2/7 + 0/7*0/7           ) +
  5/12 *(           0/5*0/5 + 0/5*1/5 + 0/5*2/5 + 0/5*2/5   +
          0/5*0/5 +           0/5*1/5 + 0/5*2/5 + 0/5*2/5   +
          1/5*0/5 + 1/5*0/5 +           1/5*2/5 + 1/5*2/5   +
          2/5*0/5 + 2/5*0/5 + 2/5*1/5 +           2/5*2/5   +
          2/5*0/5 + 2/5*0/5 + 2/5*1/5 + 2/5*2/5           )

= 7/12 *(           6/49    + 6/49    + 0       + 0         +
          6/49    +           4/49    + 0       + 0         +
          6/49    + 4/49    +           0       +           +
          0       + 0       + 0       +           0         +
          0       + 0       + 0       + 0                 ) +
  5/12 *(           0       + 0       + 0       + 0         +
          0       +           0       + 0       + 0         +
          0       + 0       +           2/25    + 2/25      +
          0       + 0       + 2/25    +           4/25      +
          0       + 0       + 2/25    + 4/25              )
= 7/12 * 32/49 + 5/12 * 16/25
= 1/3 * 8/7 + 1/3 * 4/5  = 0,6476190476

quindi diminuisce. Ovviamente dobbiamo fare lo stesso calcolo per gli
altri attributi (forma e buchi) e trovare quello che lo fa diminuire di
più (cioé fornisce una maggior diminuzione della Gini-disuguaglianza).
Allo scopo questo programma usa il setof, che non è il modo più
efficiente per fare quest'operazione
*/
:- ensure_loaded(training_set).
:- use_module(library(http/json)).

induce_albero( Albero ) :-
	findall( e(Classe,Oggetto), e(Classe,Oggetto), Esempi),
        findall( Att,a(Att,_), Attributi),
        induce_albero( Attributi, Esempi, Albero),
        mostra(Albero),
        salva_json(Albero, 'albero.json').

% induce_albero( +Attributi, +Esempi, -Albero):
% l'Albero indotto dipende da questi tre casi:
% (1) Albero = null: l'insieme degli esempi è vuoto
% (2) Albero = l(Classe): tutti gli esempi sono della stessa classe
% (3) Albero = t(Attributo, [Val1:SubAlb1, Val2:SubAlb2, ...]):
%     gli esempi appartengono a più di una classe
%     Attributo è la radice dell'albero
%     Val1, Val2, ... sono i possibili valori di Attributo
%     SubAlb1, SubAlb2,... sono i corrispondenti sottoalberi di
%     decisione.
% (4) Albero = l(Classi): non abbiamo Attributi utili per
%     discriminare ulteriormente
induce_albero( _, [], null ) :- !.			         % (1)
induce_albero( _, [e(Classe,_)|Esempi], l(Classe)) :-	         % (2)
	\+ ( member(e(ClassX,_),Esempi), ClassX \== Classe ),!.  % no esempi di altre classi (OK!)
induce_albero( Attributi, Esempi, t(Attributo,SAlberi) ) :-	 % (3)
	sceglie_attributo( Attributi, Esempi, Attributo), !,     % implementa la politica di scelta
	del( Attributo, Attributi, Rimanenti ),			 % elimina Attributo scelto
	a( Attributo, Valori ),					 % ne preleva i valori
	induce_alberi( Attributo, Valori, Rimanenti, Esempi, SAlberi).
induce_albero( _, Esempi, l(Classi)) :-                          % finiti gli attributi utili (KO!)
	findall( Classe, member(e(Classe,_),Esempi), Classi).

% sceglie_attributo( +Attributi, +Esempi, -MigliorAttributo):
% seleziona l'Attributo che meglio discrimina le classi; si basa sul
% concetto della "Gini-disuguaglianza"; utilizza il setof per ordinare
% gli attributi in base al valore crescente della loro disuguaglianza
sceglie_attributo( Attributi, Esempi, MigliorAttributo )  :-
	setof( Disuguaglianza/A,
	      (member(A,Attributi) , disuguaglianza(Esempi,A,Disuguaglianza)),
	      [MinorDisuguaglianza/MigliorAttributo|_] ).

% disuguaglianza(+Esempi, +Attributo, -Dis):
% Dis è la disuguaglianza combinata dei sottoinsiemi degli esempi
% partizionati dai valori dell'Attributo
disuguaglianza( Esempi, Attributo, Dis) :-
	a( Attributo, AttVals),
	somma_pesata( Esempi, Attributo, AttVals, 0, Dis).

% somma_pesata( +Esempi, +Attributo, +AttVals, +SommaParziale, -Somma)
% restituisce la Somma pesata delle disuguaglianze
% Gini = sum from{v} P(v) * sum from{i <> j} P(i|v)*P(j|v)
somma_pesata( _, _, [], Somma, Somma).
somma_pesata( Esempi, Att, [Val|Valori], SommaParziale, Somma) :-
	length(Esempi,N),                                            % quanti sono gli esempi
	findall( C,						     % EsempiSoddisfatti: lista delle classi ..
		 (member(e(C,Desc),Esempi) , soddisfa(Desc,[Att=Val])), % .. degli esempi (con ripetizioni)..
		 EsempiSoddisfatti ),				     % .. per cui Att=Val
	length(EsempiSoddisfatti, NVal),			     % quanti sono questi esempi
	NVal > 0, !,                                                 % almeno uno!
	findall(P,			           % trova tutte le P robabilità
                (bagof(1,		           %
                       member(_,EsempiSoddisfatti),
                       L),
                 length(L,NVC),
                 P is NVC/NVal),
                ClDst),
        gini(ClDst,Gini),
	NuovaSommaParziale is SommaParziale + Gini*NVal/N,
	somma_pesata(Esempi,Att,Valori,NuovaSommaParziale,Somma)
	;
	somma_pesata(Esempi,Att,Valori,SommaParziale,Somma). % nessun esempio soddisfa Att = Val

% gini(ListaProbabilità, IndiceGini)
%    IndiceGini = SOMMATORIA Pi*Pj per tutti i,j tali per cui i\=j
%    E' equivalente a 1 - SOMMATORIA Pi*Pi su tutti gli i
gini(ListaProbabilità,Gini) :-
	somma_quadrati(ListaProbabilità,0,SommaQuadrati),
	Gini is 1-SommaQuadrati.
somma_quadrati([],S,S).
somma_quadrati([P|Ps],PartS,S)  :-
	NewPartS is PartS + P*P,
	somma_quadrati(Ps,NewPartS,S).

% induce_alberi(Attributi, Valori, AttRimasti, Esempi, SAlberi):
% induce decisioni SAlberi per sottoinsiemi di Esempi secondo i Valori
% degli Attributi
induce_alberi(_,[],_,_,[]).     % nessun valore, nessun sottoalbero
induce_alberi(Att,[Val1|Valori],AttRimasti,Esempi,[Val1:Alb1|Alberi])  :-
	attval_subset(Att=Val1,Esempi,SottoinsiemeEsempi),
	induce_albero(AttRimasti,SottoinsiemeEsempi,Alb1),
	induce_alberi(Att,Valori,AttRimasti,Esempi,Alberi).

% attval_subset( Attributo = Valore, Esempi, Subset):
%   Subset è il sottoinsieme di Examples che soddisfa la condizione
%   Attributo = Valore
attval_subset(AttributoValore,Esempi,Sottoinsieme) :-
	findall(e(C,O),(member(e(C,O),Esempi),soddisfa(O,[AttributoValore])),Sottoinsieme).

% soddisfa(Oggetto, Descrizione):
soddisfa(Oggetto,Congiunzione)  :-
	\+ (member(Att=Val,Congiunzione),
	    member(Att=ValX,Oggetto),
	    ValX \== Val).

del(T,[T|C],C) :- !.
del(A,[T|C],[T|C1]) :-
	del(A,C,C1).

mostra(T) :-
        mostra(T,0).
mostra(null,_) :- write(' ==> SCONOSCIUTO'),nl.
mostra(l(X),_) :- write(' ==> '),write(X),nl.
mostra(t(A,L),I) :-
        nl,tab(I),write(A),nl,I1 is I+2,
        mostratutto(L,I1).
mostratutto([],_).
mostratutto([V:T|C],I) :-
        tab(I),write(V), I1 is I+2,
        mostra(T,I1),
        mostratutto(C,I).

% Punto di ingresso principale 
salva_json(Albero, NomeFile) :-     
        converti_albero_json(Albero, JSONTerm),     
        open(NomeFile, write, Stream),     
        json_write_dict(Stream, JSONTerm),     % Scrive il JSON nel file     
        close(Stream). 

% Conversione dell'albero in una struttura compatibile con JSON
converti_albero_json(null, 'SCONOSCIUTO'). % Nodo sconosciuto → oggetto vuoto
converti_albero_json(l(X), Y) :- number_string(X, Y). % Nodo foglia con valore numerico
converti_albero_json(t(A, L), json(['name'=A, 'children'=Lista])) :-
    converti_lista_json(L, Lista).   % Converte la lista di figli
 
% Conversione della lista di figli in JSON
converti_lista_json([], []).
converti_lista_json([V:T | C], [json(['name'=String, 'children'=Figlio]) | ListaRestante]) :-
    term_string(V, String),
    converti_albero_json(T, Figlio),
    converti_lista_json(C, ListaRestante).

