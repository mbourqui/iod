%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                  %
% Calcul d'un itéré et du pas soit en utilisant    %
% la recherche linéaire soit la formule de Cauchy  %        
% 					                               %
% BOURQUI Marc                                     %
% CONSTANTIN Victor                                %
% SCHORI Ian                                       %
% SIMOND Floriant                                  %
%  					                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function x = pfpInnerLoop(f, x0, alpha, useRL)
    x = x0;

    [fx, gfx] = feval(f, x);
    d = -gfx;
    
	% Calcul du pas
    if useRL
        beta1 = 0.5;
        beta2 = 0.75;
        lambda = 2;
        alpha = rl(f, x, fx, gfx, alpha, beta1, beta2, lambda);
    else
        %Soit on peut utiliser la fonction dans b) pour calculer le pas
        alpha = tp(f,x);
    end
    x = x + alpha * d;
end