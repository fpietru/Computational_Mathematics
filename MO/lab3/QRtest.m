function [err, K, C] = QRtest (A)
  n = size(A, 2);
  x = ones(n); # albo x = rand(n)
  b = A*x;
  z = QRsolve(A, b);
  err = norm(z-x) / norm(x) / eps;
  K = norm(b-A*z) / norm(A) / norm(z) / eps;
  C = cond(A);
endfunction
