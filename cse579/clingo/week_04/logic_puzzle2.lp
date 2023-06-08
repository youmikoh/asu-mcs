
animal(alpaca; bear; cat; dog).
name(eva; fred; george; hana).
food(icecream; jam; kiwi; lime).

% each animal A has a unique name N and eats different food F
{named(A, N): name(N)}=1 :- animal(A).
{eats(A, F): food(F)}=1 :- animal(A).

% each name and food are pairwise
A1=A2 :- named(A1, N), named(A2, N).
A1=A2 :- eats(A1, F), eats(A2, F).

% 1. Eva (who only eats red food), the alpaca, and Fred are dancing.
% the alpaca is not named eva or fred
:- named(alpaca, eva).
:- named(alpaca, fred).

% 2. The icecream is not being eaten by the cat or the dog.
% the cat and dog are not eating icecream
:- eats(cat, icecream).
:- eats(dog, icecream).

% 3. Neither jam nor kiwi is being eaten by Fred.
:- named(A, fred), eats(A, jam).
:- named(A, fred), eats(A, kiwi).

% 4. The lime is not being eaten by the dog (who only eats blue food).
:- eats(dog, lime).
:- named(dog, eva).

% 5. The alpaca, who is not eating the kiwi, is not named George.
:- eats(alpaca, kiwi).
:- named(alpaca, george).

% 6. The bear and Fred are best friends.
% the bear is not named fred
:- named(bear, fred).

% 7. Hana hates icecream.
:- named(A, hana), eats(A, icecream).

answer(A, N) :- named(A, N), eats(A, jam).

#show answer/2.
