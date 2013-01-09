[X,Y]=meshgrid(-80:2:120,-100:2:100);

% calcul de la taille de [X,Y]
[m,n] = size([X,Y]);

% construction de la matrice Z de dessin
for j=1:m
   for i=1:m
      % artifice afin d'utiliser la valeur de la fonction avec le meshgrid
      x(1) = X(1,j);
      x(2) = Y(i,1);
      Z(i,j)=feval('f',x);
      i=i+1;
   end
   j=j+1;
end

surf(X,Y,Z);
pause;
close;