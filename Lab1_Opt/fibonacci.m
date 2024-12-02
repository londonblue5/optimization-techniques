function [n, a, b] = fibonacci(f, l, e, a1, b1)
    % Implements the Fibonacci method
    
    % init...
    F = [1, 1];
    while true
        F = [F, F(end) + F(end-1)];
        if F(end) > (b1-a1)/l; break; end
    end

    n = length(F);
    a = zeros(1,n); b = zeros(1,n);
    a(1) = a1; b(1) = b1;
    x1 = zeros(1,n); x2 = zeros(1,n);
    x1(1) = a1 + (F(n-2)/F(n))*(b1-a1);
    x2(1) = a1 + (F(n-1)/F(n))*(b1-a1);

    for k = 1:n-2
        if f(x1(k)) > f(x2(k))
            a(k+1) = x1(k); b(k+1) = b(k);
            x1(k+1) = x2(k); x2(k+1) = a(k+1) + F(n-k)/F(n-k+1)*(b(k+1)-a(k+1));
        else
            a(k+1) = a(k); b(k+1) = x2(k);
            x2(k+1) = x1(k); x1(k+1) = a(k+1) + F(n-k-1)/F(n-k+1)*(b(k+1)-a(k+1));
        end
    end
    
    x1(n) = x1(n-1); x2(n) = x1(n-1) + e;
    if f(x1(n)) > f(x2(n))
        a(n) = x1(n); b(n) = b(n-1);
    else
        a(n) = a(n-1); b(n) = x2(n);
    end