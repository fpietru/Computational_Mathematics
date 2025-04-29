function [V, L] = EigAll(A, m, e, k)
  n = size(A, 2);
  m = min(m, n);
  for s=1:m
    v = randn(n, 1);
    for i=1:k
      for j=1:s-1
        v = v - V(:,j) * (v' * V(:,j));
      endfor
    endfor
    v = v / norm(v);
    z = A * v;
    l = z' * v;
    v = z / norm(z);

    if norm(A*v - v*l) < e
      break
    end
    V(:,s)=v;
    L(s,s)=l;
  endfor

  norm(A*V - V*L)
end
