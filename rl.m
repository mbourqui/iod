function alpha = rl(f, x, d, alpha0, beta1, beta2, lambda)
    alpha = alpha0;
    alphal = 0;
    alphar = inf;
    
    [fx, fgx] = feval(f, x);
    
    [fxad, fgxad] = feval(f, x + alpha * d);
    
    while (fxad > fx + alpha * beta1 * fgx' * d) || (fgxad' * d < beta2 * fgx' * d)
        if fxad > fx + alpha * beta1 * fgx' * d 
            alphar = alpha
            alpha = (alphal + alphar)/2;
        elseif fgxad' * d < beta2 * fgx' * d
            alphal = alpha
            if alphar < inf
                alphal
                alphar
                alpha = (alphal + alphar)/2
            else
                123
                alpha = lambda * alpha
            end
        end
        
        [fxad, fgxad] = feval(f, x + alpha * d);
        
    end
end   