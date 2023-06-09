first_name(abner; bruce; chuck; duane).
last_name(engels; foster; gunter; halevy).
pet(iguana; jackal; king_cobra; llama).

% a unique last name and unique pet species are chosen for
% each first name.
{full_name(F, L): last_name(L)}=1 :- first_name(F).
{owns(F, P): pet(P)}=1 :- first_name(F).

% the chosen names and pets are pairwise
F1=F2 :- full_name(F1, L), full_name(F2, L).
F1=F2 :- owns(F1, P), owns(F2, P).

% Abner’s last name is neither Engels nor Foster.
:- full_name(abner,engels).
:- full_name(abner,foster).

% iguana belongs neither to Chuck nor to Duane
:- owns(chuck,iguana).
:- owns(duane,iguana).

% Mr.Foster owns neither jackal nor king cobra.
:- full_name(F,foster), owns(F,jackal).
:- full_name(F,foster), owns(F,king_cobra).

% Duane’s pet is not llama
:- owns(duane,llama).

% Duane’s last name is not Engels.
:- full_name(duane,engels).

% Abner’s pet is not king cobra.
:- owns(abner,king_cobra).

% Abner’s last name is not Gunter.
:- full_name(abner,gunter).

% Bruce’s last name is not Foster.
:- full_name(bruce,foster).

% Mr. Halevy’s pet is not iguana.
:- full_name(F,halevy), owns(F,iguana).

answer(F,L) :- full_name(F,L), owns(F,jackel).

#show answer/2.
