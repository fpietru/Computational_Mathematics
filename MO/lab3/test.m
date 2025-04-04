function res = test (n)
  A = randn(n);
  H = hilb(n);
  Z = zla(n);
  [err1, K1, C1] = QRtest(A);
  [err2, K2, C2] = QRtest(H);
  [err3, K3, C3] = QRtest(Z);
  res = [err1, K1, C1; err2, K2, C2; err3, K3, C3]
endfunction
