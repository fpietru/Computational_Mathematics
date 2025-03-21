function M = zla(n)
  M = eye(n);
  M(:,n) = 1;
  for i=2:n
    M(i, 1:i-1) = -1;
  endfor

