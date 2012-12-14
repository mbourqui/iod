function [f, g, h] = f(x)
    %f fonction d'origine
    %g gradient de f
    %h dérivée 2e de f
    f = (x(1) - 2)^4 + ((x(1) - 2)^2) * x(2)^2 + (x(2) + 1)^2;
    g = [4 * ((x(1) - 2)^3) + 2 * (x(2)^2) * (x(1) - 2); 2 * ((x(1) - 2)^2) * x(2) + 2 * (x(2) + 1)];
    h = [12 * ((x(1) - 2)^2) + 2 * (x(2)^2) ; 2 * ((x(1) - 2)^2) + 2];
end