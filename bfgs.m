function h = bfgs(fonc,H,x,xold)

s=x-xold;
[a,b]=feval(fonc,x);
[c,d]=feval(fonc,xold);
y=b-d;

h = H + ((y*y')/(y'*s)) - ((H*s*s'*H)/(s'*H*s));
