function s = silnia (n)
  if (n == 0)
    s=1;
  else
    s = n*silnia(n-1);
  endif
endfunction
