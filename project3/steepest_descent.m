function [x_min, f_min, n, f_x] = steepest_descent(x_start, g, e)
% Συνάρτηση Μέγιστης Καθόδου
f = @(x) 1/3*x(1).^2 + 3*x(2).^2;
grad_f = @(x) [2/3*x(1); 6*x(2)];

k = 1; N = 1000;
x = zeros(2, N); f_x = zeros(N); x(:, 1) = x_start; f_x(1) = f(x_start);

while(norm(grad_f(x(:, k))) > e)
    x(:, k+1) = x(:, k) - g*grad_f(x(:, k));
    f_x(k+1) = f(x(:, k+1));
    if(k == N); break; end
    k = k + 1;
end

x_min = x(:, k); f_min = f(x(:, k)); n = k; f_x = f_x(1:n);
