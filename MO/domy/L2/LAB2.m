%
% Autor: Franciszek Pietrusiak 458987
% Funkcja rozwiazuje uklad rownan A*x=B
% za pomoca rozkladu LU:
% 1) z osiowaniem w kolumnie dla s=0
% 2) w calej macierzy dla s=1
%
function x = LAB2(A, B, s)
  n = size(A, 1);
  P = 1:n; % permutacja wierszy A
  Q = 1:n; % permutacja kolumn A

  for i=1:n

    % ustalam limit przegladanych kolumn
    limit = i;
    if s==0
      limit = i;
    elseif s==1
      limit = n;
    else % jesli s != 0 oraz s != 1 to koncze funkcje, x = 0
      x = zeros(n, 1);
      return;
    endif

    mxAbs = 0;
    mxRow = i;
    mxCol = i;
    % znajduje najwiekszy co do modulu element
    for c=i:limit
      for r=i:n
        absVal = abs(A(r, c));
        if absVal > mxAbs
          mxAbs = absVal;
          mxRow = r;
          mxCol = c;
        endif
      endfor
    endfor

    % jesli mxAbs < eps to mogloby dojsc do dzielenia
    % przez wartosc bliska 0. Koncze funkcje i
    % zwracam x = 0
    if mxAbs < eps
      x = zeros(n, 1);
      return;
    endif

    % zamieniam miejscami wiersze A
    % i zapisuje zmiane w P
    if mxRow != i
      A([i, mxRow], :) = A([mxRow, i], :);
      P([i, mxRow]) = P([mxRow, i]);
    endif

    % zamieniam miejscami kolumny A
    % i zapisuje zmiane w Q
    if mxCol != i
      A(:, [i, mxCol]) = A(:, [mxCol, i]);
      Q([i, mxCol]) = Q([mxCol, i]);
    endif

    for j=i+1:n
      A(j, i) /= A(i, i);
      for k=i+1:n
        A(j, k) -= A(j, i) * A(i, k);
      endfor
    endfor
  endfor

  % permutuje elementy B za pomoca P
  B = B(P);

  % rozwiazuje uklad L*y=B
  % za pomoca podstawienia w przod
  y = zeros(n, 1);
  for i=1:n
    y(i) = B(i);
    for j=1:i-1
      y(i) -= A(i, j) * y(j);
    endfor
  endfor

  % rozwiazuje uklad U*x=y
  % za pomoca podstawienia w tyl
  x = zeros(n, 1);
  for i=n:-1:1
    x(i)=y(i);
    for j=n:-1:i+1
      x(i) -= A(i, j) * x(j);
    endfor
    x(i) /= A(i, i);
  endfor

  x(Q) = x;

 endfunction
