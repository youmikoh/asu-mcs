animal(a; b; c; d).
named(e; f; g; h).
food(i; j; k; l).

% a unique last name and unique food species are chosen for
% each first name.
{named(F, L): named(L)}=1 :- animal(F).
{eats(F, P): food(P)}=1 :- animal(F).

% the chosen names and foods are pairwise
F1=F2 :- named(F1, L), named(F2, L).
% L1=L2 :- named(F, L1), named(F, L2).
F1=F2 :- eats(F1, P), eats(F2, P).

% Abner’s last name is neither Engels nor Foster.
:- named(a,e).
:- named(a,f).

% i belongs neither to Chuck nor to Duane
:- eats(c,i).
:- eats(d,i).

% Mr.Foster eats neither j nor king cobra.
:- named(F,f), eats(F,j).
:- named(F,f), eats(F,k).

% Duane’s food is not l
:- eats(d,l).

% Duane’s last name is not Engels.
:- named(d,e).

% Abner’s food is not king cobra.
:- eats(a,k).

% Abner’s last name is not Gunter.
:- named(a,g).

% Bruce’s last name is not Foster.
:- named(b,f).

% Mr. Halevy’s food is not i.
:- named(F,h), eats(F,i).

answer(F, L) :- named(F,L), eats(F,jackel).
#show answer/2.
