function x = pfpInnerLoop(f, x0, useRL)
    x = x0;
    alpha = 1;    

    [fx, gfx] = feval(f, x);
    d = -gfx;
    
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