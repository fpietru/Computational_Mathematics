function [x1, x2] = vieta (p, q)
  delta = p^2 - q;
  if (p >= 0)
    x1 = p + sqrt(delta);
    x2 = q / x1;
  else
    x2 = p - sqrt(delta);
    x1 = q / x2;
  endif
endfunction
