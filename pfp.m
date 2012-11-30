function x = pfp(f, x0, epsilon)
    x = x0;
    alpha = 1;

    beta1 = 0.5;
    beta2 = 0.75;
    lambda = 0.6;

    iteration = 1;
    [~, gfx] = feval(f, x);
    while abs(gfx) > epsilon
        fprintf('Iteration number %d : x = [%f, %f]\n', iteration, x(1), x(2));
% (c) Comparer le comportement de l'algorithme en utilisant les pas (a) et
% (b)

% (d) Comparer la methode de plus forte pente et la methode quasi-Newton
% (qui est deja implementee - Serie 3).
        
        [~, gfx] = feval(f, x);
        d = -gfx;
        alpha = rl(f, x, d, alpha, beta1, beta2, lambda);
        x = x + alpha * d;
        iteration = iteration + 1;
    end
end