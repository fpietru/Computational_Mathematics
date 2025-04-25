function [v,l] = Deflacja (A, w, e, k)
  w = w / norm(w);
  n = size(A,2);
  v = randn(n,1);
  v = v - w * (v' * w);
  v = v / norm(v);
  for i=1:k
      y = A * v;
      y = y - w * (v' * w);
      l = y' * v;
      v = y / norm(y);

      if norm(A*v - v*l) < e
          break
      end
  end
end
