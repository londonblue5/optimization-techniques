function [n, a, b] = bisectorDer(f, l, a1, b1)
    n = ceil(log2((b1-a1)/l));
    x = zeros(1,n);
    a = zeros(1,n+1); a(1) = a1;
    b = zeros(1,n+1); b(1) = b1;
    dx = 0.001; % for derivative

    for k = 1:n
        x(k) = (a(k)+b(k))/2;
        der = ( f(x(k)+dx) - f(x(k)) ) / dx;
        if der == 0
            break;
        elseif der > 0
            a(k+1) = a(k); b(k+1) = x(k);
        else
            a(k+1) = x(k); b(k+1) = b(k);
        end
    end