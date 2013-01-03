function [ x ] = xrand( max )
%x : Donne un vecteur x à deux dimensions. Indice 0 donne le nombre de paires
% disponibles.

x = [randsample(max, 1); randsample(max, 1)];

end

