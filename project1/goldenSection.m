function [n, a, b] = goldenSection(f, l, a1, b1)
    % Implements the Golden Section method
    
    % initialization
    gamma = 0.618;
    a = zeros(1, 20); b = zeros(1, 20);
    x1 = zeros(1, 20); x2 = zeros(1, 20);
    a(1) = a1; b(1) = b1; k = 1;
    
    x1(k) = a(k) + (1 - gamma) * (b(k) - a(k));
    x2(k) = a(k) + gamma * (b(k) - a(k));
    
    while (b(k) - a(k) > l)
        if f(x1(k)) < f(x2(k))
            % Update interval to [a, x2]
            a(k+1) = a(k);
            b(k+1) = x2(k);
            x2(k+1) = x1(k);
            x1(k+1) = a(k+1) + (1 - gamma) * (b(k+1) - a(k+1));
        else
            % Update interval to [x1, b]
            a(k+1) = x1(k);
            b(k+1) = b(k);
            x1(k+1) = x2(k);
            x2(k+1) = a(k+1) + gamma * (b(k+1) - a(k+1));
        end
        k = k + 1;
    end
    
    n = k; % total number of iterations
    a = a(1:n); b = b(1:n); % trimming
end
