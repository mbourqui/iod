function [ x ] = x( row )
%x : Donne un vecteur x à deux dimensions. Indice 0 donne le nombre de paires
% disponibles.

m(:,1) = [1;1];
m(:,2) = [2; 4];
m(:,3) = [-2; -1];
m(:,4) = [2; 1];
m(:,5) = [-2; 1];
m(:,6) = [2; -1];
m(:,7) = [0; 0];
m(:,8) = [1; 2];
m(:,9) = [-1; -2];
m(:,10) = [-1; -2];
if (row == 0)
    x = size(m,2);
else if (row < 1 || row > size(m,2))
    x=m(:,1);
else
    x=m(:,row);
end

end

