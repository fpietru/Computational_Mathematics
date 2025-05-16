function x = Newton(f, x0, e)
  [f0, f1] = feval(f, x0);
  e1 = abs(f0-1);
  x = x0;
  while e1 > e
    x = x - f0/f1;
    e0 = e1;
    e1 = abs(x-1);
    disp(log(e1)/log(e0));
    [f0, f1] = feval(f, x);
  endwhile

