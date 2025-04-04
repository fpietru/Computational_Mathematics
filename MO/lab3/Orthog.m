# Gram-Schmidt process
function Q = Orthog (A)
  m = size(A, 1);
  n = size(A, 2);
  Q = zeros(m, n);
  for i=1:n
    a = A(:,i);
    q = a;
    for j=1:i-1
      q = q - dot(a,Q(:,j)) * Q(:,j);
    endfor
    nr = norm(q);
    if nr == 0
      disp('Linear dependance');
      break;
    endif
    Q(:,i)=q/nr;
  endfor

