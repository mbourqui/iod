function taillePas = tp(f, x)
    [~, fgx, fghx] = feval(f,x);
    top = fgx' * fgx;
    bottom = fgx' * fghx * fgx;
    
    taillePas = top / bottom;
   
    %Cette formule est le point de Cauchy,
    %Elle vient du modèle quadratique.
    %C'est le point qui minimise le modèle quadratique de la fonction
    %dans la direction de la plus forte descente

end