function err = SrednKwadr(f, a, b, n, m)
  x = linspace(a, b, m+1);
  y = feval(f, x);
  w = polyfit(x, y, n);
  t = linspace(a, b, 10^4);
  f1 = feval(f, t);
  y1 = polyval(w, t);
  plot(t, f1, 'b', t, y1, 'r');
  grid;
  err = norm(y1-f1, 2) / 10^2;
endfunction
