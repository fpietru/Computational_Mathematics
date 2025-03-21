function x = Newton (f, x0, r)
  [f0, f1] = feval(f, x0);
  x(1) = x0;
  for k=2:100
    z = x(k-1);
    [f0, f1] = feval(f, z);
    x(k) = z - f0/f1;
    if (abs(f0) <= r)
      break
    endif
  endfor
endfunction
