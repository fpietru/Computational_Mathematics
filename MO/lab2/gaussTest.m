function e = gaussTest (A, x)
  b = A*x;
  y = Gauss(A,b);
  e = norm(x-y, inf) / norm(x, inf);
endfunction
