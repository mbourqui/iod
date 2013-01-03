function x = pfpInnerLoop(f, x0, useRL)
    x = x0;
    alpha = 1;    

    [~, gfx] = feval(f, x);
    
    %iteration = 1;
    
    %while norm(gfx) > epsilon
        %çfprintf('Iteration number %d : x = [%f, %f]\n', iteration, x(1), x(2));
        d = -gfx;
        if useRL
            beta1 = 0.5;
            beta2 = 0.75;
            lambda = 2;
            alpha = rl(f, x, d, alpha, beta1, beta2, lambda);
        else
            %Soit on peut utiliser la fonction dans b) pour calculer le pas
            alpha = tp(f,x);
        end
        x = x + alpha * d;
        %[~, gfx] = feval(f, x);
        
        %iteration = iteration + 1;
    %end
end