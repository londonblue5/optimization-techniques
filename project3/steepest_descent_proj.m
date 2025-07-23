function [x_min, f_min, n, f_x] = steepest_descent_proj(x_start, s, g, e)
% Συνάρτηση Μέγιστης Καθόδου με Προβολή

f = @(x) 1/3*x(1).^2 + 3*x(2).^2;
grad_f = @(x) [2/3*x(1); 6*x(2)];
x1L = -10; x1H = 5; x2L = -8; x2H = 12; % Περιορισμοί

k = 1; N = 500; % Μέγιστος αριθμός επαναλήψεων
x = zeros(2, N); f_x = zeros(N); x(:, 1) = x_start; f_x(1) = f(x_start);

while(norm(grad_f(x(:, k))) > e)
    % Προβολή:
    y(:) = x(:, k) - s*grad_f(x(:, k));
    if(y(1) < x1L); y(1) = x1L; end
    if(y(1) > x1H); y(1) = x1H; end
    if(y(2) < x2L); y(2) = x2L; end
    if(y(2) > x2H); y(2) = x2H; end
    x_bar(:) = y(:);
    
    x(:, k+1) = x(:, k) + g*(x_bar(:) - x(:, k));
    f_x(k+1) = f(x(:, k+1));
    if(k == N); break; end
    k = k + 1;
end

x_min = x(:, k); f_min = f(x(:, k)); n = k; f_x = f_x(1:n); % trim