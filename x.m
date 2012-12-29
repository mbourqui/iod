function [ x ] = x( row )
%X Donne un vecteur x à deux dimensions. Indice 0 donne le nombre de paires
% disponibles.
%   Detailed explanation goes here

m(:,1) = [1;1];
m(:,2) = [2; 4];
m(:,3) = [3; 9];
m(:,4) = [4; 16];
m(:,5) = [100; 150];
m(:,6) = [100; 150];
m(:,7) = [100; 150];
m(:,8) = [100; 150];
m(:,9) = [100; 150];
m(:,10) = [100; 150];
if (row == 0)
    x = size(m,2);
else if (row < 1 || row > size(m,2))
    x=m(:,1);
else
    x=m(:,row);
end

end

