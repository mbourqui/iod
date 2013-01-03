%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     	        
%                                                           %
% Implémete la fonction a minimiser et fournit son gradiant %              
% et sa matrice hessienne                                   %              
% 					                                        % 
% BOURQUI Marc                                              %
% CONSTANTIN Victor                                         %
% SCHORI Ian                                                %
% SIMOND Floriant                                           %
%  					                                        % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

function [f, g, h] = f(x)

	%f : fonction d'origine
    f = (x(1) - 2)^4 + ((x(1) - 2)^2) * x(2)^2 + (x(2) + 1)^2;
	
	%g : gradient de f
    g = [4 * ((x(1) - 2)^3) + 2 * (x(2)^2) * (x(1) - 2); 2 * ((x(1) - 2)^2) * x(2) + 2 * (x(2) + 1)];
	%h : matrice hessienne de f
    h = [12 * ((x(1) - 2)^2) + 2 * (x(2)^2)    4 * x(2) * (x(1) - 2);
        x(2)                                  2 * ((x(1) - 2)^2) + 2];
		
end