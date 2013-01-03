function pas = taillepasCauchy(f, x)
    [~, fgx, fghx] = feval(f,x);
    top = fgx' * fgx;
    bottom = fgx' * fghx * fgx;
    
    pas = top / bottom;

end