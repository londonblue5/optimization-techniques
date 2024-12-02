function [n, a, b] = bisector(f, e, l, a1, b1)
    % Implements the Bisector optimization method
 
    % initialization
    a = zeros(1,20); b = zeros(1,20);
    x1 = zeros(1,20); x2 = zeros(1,20);
    a(1) = a1; b(1) = b1; k = 1;
    
    while (b(k)-a(k) > l)
        x1(k) = (a(k)+b(k))/2-e; x2(k) = (a(k)+b(k))/2+e;
        if (f(x1(k)) < f(x2(k)))
            a(k+1) = a(k); b(k+1) = x2(k);
        else
            a(k+1) = x1(k); b(k+1) = b(k);
        end
        k = k + 1;
    end

    n = k;  % total number of iterations
    a = a(1:n); b = b(1:n); % trimming
end