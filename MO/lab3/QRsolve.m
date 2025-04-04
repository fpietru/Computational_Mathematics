function x = QRsolve (A, b)
  [Q, R] = qr(A);
  x = R \ (Q'*b);
endfunction
