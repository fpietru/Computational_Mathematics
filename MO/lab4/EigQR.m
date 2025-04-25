function [V, L] = EigQR(A, e, k)
  n = size(A, 2);
  V = eye(n);
  for i=1:k
    [V,L] = qr(A * V);
    if norm(A*V - V*diag(diag(L))) < e
      break;
    endif
  endfor
endfunction
