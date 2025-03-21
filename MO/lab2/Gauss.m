function x = Gauss (A, b)
  [L,U,P] = lu(A);
  y = L \ (P*b);
  x = U \ y;
 endfunction
