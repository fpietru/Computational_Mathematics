% Runge's Phenomenon
function err = Runge(n)
  % funkcja 1/(1+x^2)
  f = @(x)1 ./ (1 + x .^ 2); % definicja funkcji ad-hoc

  % rownoodlegle wezly
  % X = linspace(-5, 5, n+1);

  % wezly Czebyszewa
  X = zeros(n+1,1);
  for k=1:n+1
    arg = ((k - 1/2) / (n+1)) * pi;
    X(k) = -5 * cos(arg);
  endfor

  Y = f(X);
  A = polyfit(X, Y, n);
  Z = linspace(-5, 5, 1024);
  fZ = f(Z);
  AZ = polyval(A, Z);
  plot(Z, fZ, 'b', Z, AZ, 'r');
  hold on;
  scatter(X, Y, 'k', 'filled');
  grid;
  hold off;
  Err = norm(fZ - AZ, inf);
  disp(Err);
endfunction
