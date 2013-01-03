function [ x ] = x( row )
%x : Donne un vecteur x à deux dimensions. Indice 0 donne le nombre de paires
% disponibles.

m(:,1) = [0;0];
m(:,2) = [1; 1];
m(:,3) = [2; -1]; % Solution
m(:,4) = [3; -1];
m(:,5) = [1; -1];
m(:,6) = [2; 0];
m(:,7) = [2; -2];
m(:,8) = [3; 0];
m(:,9) = [4; -2];
m(:,10) = [50; 72];
if (row == 0)
    x = size(m,2);
else if (row < 1 || row > size(m,2))
    x=m(:,1);
else
    x=m(:,row);
end

end

