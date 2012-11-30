function [ output_args ] = pfp( input_args )
%PFP Trouve une approximation de la solution du probleme suivant en 
% appliquant la methode de la plus forte pente:
% min_{x in R^2} (x_1-2)^4 + (x_1-2)^2x_2^2 + (x_2+1)^2
%   Detailed explanation goes here

% (a) Implementer la methode de la plus forte pente (alog 11.3).
% Determiner la taille du pas en appliquant la recherche linéaire, algo
% 11.2 (les deux conditions de Wolfe).

% (b) Implementer une fonction qui donne la taille du pas suivant:
% cf énoncé
% Quelle est la nature de ce pas? D'ou cette formule vient-elle?

% (c) Comparer le comportement de l'algorithme en utilisant les pas (a) et
% (b)

% (d) Comparer la methode de plus forte pente et la methode quasi-Newton
% (qui est deja implementee - Serie 3).

end

