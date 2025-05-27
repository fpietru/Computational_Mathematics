function e = test(n)

  % losowa macierz
  L = randn(n);
  % macierz Hilberta
  H = hilb(n);
  % macierz A
  A = zeros(n, n);
  for i=1:n
    A(i,i)=1;
    A(i,n)=1;
    for j=1:i-1
      A(i,j)=-1;
    endfor
  endfor
  % losowy wektor B
  B = randn(n, 1);

  e = zeros(3, 2);
  M = {L, H, A};
  for i=1:3
    Mi = M{i};
    for s=0:1
      x = LAB2(Mi, B, s);
      e(i, s+1) = norm(Mi * x - B);
    endfor
  endfor

endfunction
