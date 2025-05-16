function x = Sieczne(f, x0, x1, e)
  e1 = abs(x1 - 1);
  while true
    fa = feval(f, x0);
    fb = feval(f, x1);

    xn = x1 - fb*(x1-x0) / (fb - fa);
    x0 = x1;
    x1 = xn;
    x = x1;

    e0 = e1
    e1 = abs(x1 - 1);

    if e1 <= e
      break
    endif

    w = log(e1)/log(e0);
    printf("przyblizenie wykladnika = %f\n", w)
  endwhile
endfunction
