%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compare les deux méthodes pour un jeu de données commun.		%
%																%
% (adapter pfp_launcher et optSerie en fonction de ce script)	%
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
x(0)
x0 = x(randsample(x(0),1)) % choisir ici une paire de valeurs prédéfinies dans x.m

% Notre implémentation de pfp
pfp(fct, x0, 1);

% Solution de quasi Newton
quasiNewton(fct, x0);


clear;