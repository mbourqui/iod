% Direction de Wolfe étant donné beta...

function pas = taillepas_wolfe(fonc,xold,direc)

beta = 0.5;

gamma = 0.5;
      
% fonction, grad et hess en x(k)
[f,g,h] = feval(fonc,xold);

i = 0;

alpha = gamma^i;
x1 = xold + alpha * direc;

while (feval(fonc,x1) > f + alpha*beta*g'*direc)
    i = i+1;
    alpha = gamma^i;
    x1 = xold + alpha * direc;
end

pas = alpha;
 
