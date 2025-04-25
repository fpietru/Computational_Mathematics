function [v,l] = Potegowa (A, e, k)
  n = size(A,2);
  v = randn(n,1);
  v = v / norm(v);
  for i=1:k
      y = A * v;
      l = y' * v;
      v = y / norm(y);
      
      if norm(A*v - v*l) < e
          break
      end
  end
end