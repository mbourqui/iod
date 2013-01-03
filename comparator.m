%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compare les deux méthodes pour un jeu de données commun.		%
%																%
%																%
% BOURQUI Marc													%	
% CONSTANTIN Victor												%
% SCHORI Ian                                                    %
% SIMOND Floriant                                               %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;

% Valeurs initiales
fct = 'f';
x0 = x(randsample(x(0), 1)) % choisir ici une paire de valeurs prédéfinies dans x.m

% Notre implémentation de pfp
pfp(fct, x0, 1, true); % Ne marche pas, car la fonction tp appelée dans pfpInnerLoop:16

% Solution de quasi Newton
quasiNewton(fct, x0);


clear;