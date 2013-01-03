%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Implémente la recherche linéaire %
% 					               %
% BOURQUI Marc                     %
% CONSTANTIN Victor                %
% SCHORI Ian                       %
% SIMOND Floriant                  %
%                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function alpha = rl(f, x, d, alpha0, beta1, beta2, lambda)
    alpha = alpha0;
    alphal = 0;
    alphar = inf;

    [fxad, fgxad] = feval(f, x + alpha * -gfx);
    
    while (fxad > fx + alpha * beta1 * gfx' * -gfx) || (fgxad' * -gfx < beta2 * gfx' * -gfx)
        if fxad > fx + alpha * beta1 * gfx' * -gfx 
            alphar = alpha;
            alpha = (alphal + alphar)/2;
        elseif fgxad' * -gfx < beta2 * gfx' * -gfx
            alphal = alpha;
            if alphar < inf
                alpha = (alphal + alphar)/2;
            else
                alpha = lambda * alpha;
            end
        end
        
        [fxad, fgxad] = feval(f, x + alpha * -gfx);        
    end
end   