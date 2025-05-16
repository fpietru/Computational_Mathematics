function x = Steffensen(f, x0, e)
  e1 = abs(x0 - 1);
  x = x0
  while true
    fx = feval(f, x);
    y = x + fx;
    fy = feval(f, y);

    x = x - fx * (x - y) / (fx - fy);

    e0 = e1
    e1 = abs(x - 1);

    if e1 <= e
      break
    endif

    w = log(e1)/log(e0);
    printf("przyblizenie wykladnika = %f\n", w)
  endwhile
endfunction
