function res = Newton (x,n)
  for i=1:n
    nx = x - J_odwrotnosc(x)*F(x);
    x = nx;
  endfor
  res = x;
end
