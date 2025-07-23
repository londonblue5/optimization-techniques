% 3η άσκηση (Τεχνικές Βελτιστοποίησης)

% Θέμα 1
fprintf('\nΘέμα 1 --------------------\n');
x_start = [5.1; 2]; e = 0.001;

g = 0.1;
[x_min, f_min, n, f_x] = steepest_descent(x_start, g, e);
fprintf('\nγ_κ: %.2f | x_start: [%.2f; %.2f] \nΕλάχιστο: %f, στη θέση: (%f, %f), αριθμός επαναλήψεων: %d\n', g, x_start(1), x_start(2), f_min, x_min(1), x_min(2), n);
figure; plot(1:n, f_x); xlabel('Αριθμός επαναλήψεων'); ylabel('f(x_k)'); title(sprintf('Αρχικό σημείο εκκίνησης: [%.2f %.2f]'', γ_κ = %.2f', x_start(1), x_start(2), g));

g = 0.3;
[x_min, f_min, n, f_x] = steepest_descent(x_start, g, e);
fprintf('\nγ_κ: %.2f | x_start: [%.2f; %.2f] \nΕλάχιστο: %f, στη θέση: (%f, %f), αριθμός επαναλήψεων: %d\n', g, x_start(1), x_start(2), f_min, x_min(1), x_min(2), n);
figure; plot(1:n, f_x); xlabel('Αριθμός επαναλήψεων'); ylabel('f(x_k)'); title(sprintf('Αρχικό σημείο εκκίνησης: [%.2f %.2f]'', γ_κ = %.2f', x_start(1), x_start(2), g));

g = 3;
[x_min, f_min, n, f_x] = steepest_descent(x_start, g, e);
fprintf('\nγ_κ: %.2f | x_start: [%.2f; %.2f] \nΕλάχιστο: %f, στη θέση: (%f, %f), αριθμός επαναλήψεων: %d\n', g, x_start(1), x_start(2), f_min, x_min(1), x_min(2), n);
figure; plot(1:n, f_x); xlabel('Αριθμός επαναλήψεων'); ylabel('f(x_k)'); title(sprintf('Αρχικό σημείο εκκίνησης: [%.2f %.2f]'', γ_κ = %.2f', x_start(1), x_start(2), g));

g = 5;
[x_min, f_min, n, f_x] = steepest_descent(x_start, g, e);
fprintf('\nγ_κ: %.2f | x_start: [%.2f; %.2f] \nΕλάχιστο: %f, στη θέση: (%f, %f), αριθμός επαναλήψεων: %d\n', g, x_start(1), x_start(2), f_min, x_min(1), x_min(2), n);
figure; plot(1:n, f_x); xlabel('Αριθμός επαναλήψεων'); ylabel('f(x_k)'); title(sprintf('Αρχικό σημείο εκκίνησης: [%.2f %.2f]'', γ_κ = %.2f', x_start(1), x_start(2), g));

% Θέμα 2
fprintf('\nΘέμα 2 --------------------\n');
s = 5; g = 0.5; x_start = [5; -5]; e = 0.01;
[x_min, f_min, n, f_x] = steepest_descent_proj(x_start, s, g, e);
fprintf('\ns_k: %.2f | γ_κ: %.2f | x_start: [%.2f; %.2f] | ε: %.2f \n Ελάχιστο: %f, στη θέση: (%f, %f), αριθμός επαναλήψεων: %d\n', s, g, x_start(1), x_start(2), e, f_min, x_min(1), x_min(2), n);
figure; plot(1:n, f_x); xlabel('Αριθμός επαναλήψεων'); ylabel('f(x_k)'); title(sprintf('s_k = %.2f, αρχικό σημείο εκκίνησης: [%.2f %.2f]'', γ_κ = %.2f, ε = %.2f', s, x_start(1), x_start(2), g, e));

% Θέμα 3
fprintf('\nΘέμα 3 --------------------\n');
s = 15; g = 0.1; x_start = [-5; 10]; e = 0.01;
[x_min, f_min, n, f_x] = steepest_descent_proj(x_start, s, g, e);
fprintf('\ns_k: %.2f | γ_κ: %.2f | x_start: [%.2f; %.2f] | ε: %.2f \n Ελάχιστο: %f, στη θέση: (%f, %f), αριθμός επαναλήψεων: %d\n', s, g, x_start(1), x_start(2), e, f_min, x_min(1), x_min(2), n);
figure; plot(1:n, f_x); xlabel('Αριθμός επαναλήψεων'); ylabel('f(x_k)'); title(sprintf('s_k = %.2f, αρχικό σημείο εκκίνησης: [%.2f %.2f]'', γ_κ = %.2f, ε = %.2f', s, x_start(1), x_start(2), g, e));

% Θέμα 4
fprintf('\nΘέμα 4 --------------------\n');
s = 0.1; g = 0.2; x_start = [8; -10]; e = 0.01;
[x_min, f_min, n, f_x] = steepest_descent_proj(x_start, s, g, e);
fprintf('\ns_k: %.2f | γ_κ: %.2f | x_start: [%.2f; %.2f] | ε: %.2f \n Ελάχιστο: %f, στη θέση: (%f, %f), αριθμός επαναλήψεων: %d\n\n\n', s, g, x_start(1), x_start(2), e, f_min, x_min(1), x_min(2), n);
figure; plot(1:n, f_x); xlabel('Αριθμός επαναλήψεων'); ylabel('f(x_k)'); title(sprintf('s_k = %.2f, αρχικό σημείο εκκίνησης: [%.2f %.2f]'', γ_κ = %.2f, ε = %.2f', s, x_start(1), x_start(2), g, e));

