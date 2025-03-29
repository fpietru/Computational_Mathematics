function [x1, x2] = szkolny (p, q)
  delta = p^2 - q;
  x1 = p + sqrt(delta);
  x2 = p - sqrt(delta);
endfunction
