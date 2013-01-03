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

% Configuration
showDetails = false;
compareSteps = false;

% Valeurs initiales
fct = 'f';
%x0 = x(randsample(x(0), 1)) % choisir ici une paire de valeurs prédéfinies dans x.m
epsilon = 0.00001;


for i = 1:x(0)

    x0 = x(i)
    
    % Notre implémentation de pfp
    pfp(fct, x0, epsilon, true, showDetails); % Ne marche pas, car la fonction tp appelée dans pfpInnerLoop:16
    if compareSteps  
        pfp(fct, x0, epsilon, false, showDetails);
    else 
        % Solution de quasi Newton
        quasiNewton(fct, x0, showDetails);
    end 
end

clear;