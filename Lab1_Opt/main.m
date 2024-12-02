% Konstantinos Litsios, Optimization, klitsios@ece.auth.gr, 10047
% Πρώτη εργαστηριακή άσκηση

close all; digits(6);

% functions
f1 = @(x) (x-2)^2 + x*log(x+3);
f2 = @(x) exp(-2*x) + (x-2)^2;
f3 = @(x) exp(x)*(x^3-1) + (x-1)*sin(x);
f = {f1, f2, f3};

a1 = -1; b1 = 3;


% Θέμα 1 ---------------------- Διχοτόμος ---------------------------------


% Πρώτο υποερώτημα (l>2e)
l = 0.01; e_values = [0.0001, 0.001, 0.002, 0.003, 0.004, 0.0045];

n = zeros(1,length(e_values));    % επαναλήψεις μεθόδου διχοτόμου 
figure;
sgtitle(['Μέθοδος Διχοτόμου, l = 0.01', newline, 'ε = {0.0001, 0.001, 0.002, 0.003, 0.004, 0.0045}']);

for fNumber = 1:3
    for i = 1:length(e_values)
        [n(i), ak, bk] = bisector(f{fNumber}, e_values(i), l, a1, b1);
    end
    subplot(3,1,fNumber);
    plot(e_values,n,'-o');      % plot number of iterations (n) for each e above
    title(sprintf('f%d', fNumber)); xlabel('ε'); ylabel('επαναλήψεις');
end


% Δεύτερο υποερώτημα
e = 0.001; l_values = [0.003, 0.005, 0.01, 0.02, 0.05, 0.1, 0.5];

n = zeros(1,length(l_values));
figure;
sgtitle(['Μέθοδος Διχοτόμου, ε = 0.001', newline, 'l = {0.003, 0.005, 0.01, 0.02, 0.05, 0.1, 0.5}']);
for fNumber = 1:3
    for i = 1:length(l_values)
        [n(i), ak, bk] = bisector(f{fNumber}, e, l_values(i), a1, b1);
    end
    subplot(3,1,fNumber);
    plot(l_values,n,'-o');      % plot number of iterations (n) for each l above
    title(sprintf('f%d', fNumber)); xlabel('l'); ylabel('επαναλήψεις');
end

% Τρίτο υποερώτημα --- e = 0.001
l_values = [0.003, 0.01, 0.1];
n = zeros(1,length(l_values));

for fNumber = 1:3
    figure;
    sgtitle(sprintf('Μέθοδος Διχοτόμου για f%d, ε = 0.001', fNumber));
    for i = 1:length(l_values)
        [n(i), ak, bk] = bisector(f{fNumber}, e, l_values(i), a1, b1);
        subplot(3,1,i);
        plot(1:n(i), ak, '-o', 'DisplayName', 'a_k');  % Plot ak
        hold on;
        plot(1:n(i), bk, '-o', 'DisplayName', 'b_k');  % Plot bk
        hold off;
        title(sprintf('l = %.4f', l_values(i)));
        xlabel('k');
        ylabel('a_k & b_k');
        legend;
    end
end



% Θέμα 2 ----------------------- Χρυσός Τομέας ----------------------------


% Πρώτο υποερώτημα
l_values = [0.003, 0.005, 0.01, 0.02, 0.05, 0.1, 0.5];
figure;
sgtitle('Μέθοδος Χρυσού Τομέα, l = 0.003, 0.005, 0.01, 0.02, 0.05, 0.1, 0.5');

for fNumber = 1:3
    n_vals = zeros(1, length(l_values));
    for i = 1:length(l_values)
        [n_vals(i), ~, ~] = goldenSection(f{fNumber}, l_values(i), a1, b1);
    end
    subplot(3, 1, fNumber);
    plot(l_values, n_vals, '-o');
    title(sprintf('Function f%d', fNumber));
    xlabel('l');
    ylabel('επαναλήψεις');
end

% Δεύτερο υποερώτημα
l_values = [0.003, 0.01, 0.1];

for fNumber = 1:3
    figure;
    sgtitle(sprintf('Μέθοδος Χρυσού Τομέα για f%d', fNumber));
    for i = 1:length(l_values)
        % Call the Golden Section function
        [n, a_vals, b_vals] = goldenSection(f{fNumber}, l_values(i), a1, b1);
        
        % Plot a_k and b_k as a function of iterations
        subplot(3, 1, i);
        plot(1:n, a_vals, '-o', 'DisplayName', 'a_k');
        hold on;
        plot(1:n, b_vals, '-o', 'DisplayName', 'b_k');
        hold off;
        title(sprintf('l = %.4f', l_values(i)));
        xlabel('k');
        ylabel('a_k and b_k');
        legend;
    end
end


% Θέμα 3 ---------------------- Φιμπονάτσι --------------------------------


% Διαλέγω:
e = 0.001;
% Πρώτο υποερώτημα
l_values = [0.003, 0.005, 0.01, 0.02, 0.05, 0.1, 0.5];
figure;
sgtitle('Μέθοδος Fibonacci, l = 0.003, 0.005, 0.01, 0.02, 0.05, 0.1, 0.5');

for fNumber = 1:3
    n_vals = zeros(1, length(l_values));
    for i = 1:length(l_values)
        [n_vals(i), ~, ~] = fibonacci(f{fNumber}, l_values(i), e, a1, b1);
    end
    subplot(3, 1, fNumber);
    plot(l_values, n_vals, '-o');
    title(sprintf('Function f%d', fNumber));
    xlabel('l');
    ylabel('επαναλήψεις');
end

% Δεύτερο υποερώτημα
l_values = [0.003, 0.01, 0.1];

for fNumber = 1:3
    figure;
    sgtitle(sprintf('Μέθοδος Fibonacci για f%d', fNumber));
    for i = 1:length(l_values)
        % Call the Golden Section function
        [n, a_vals, b_vals] = fibonacci(f{fNumber}, l_values(i), e, a1, b1);
        
        % Plot a_k and b_k as a function of iterations
        subplot(3, 1, i);
        plot(1:n, a_vals, '-o', 'DisplayName', 'a_k');
        hold on;
        plot(1:n, b_vals, '-o', 'DisplayName', 'b_k');
        hold off;
        title(sprintf('l = %.4f', l_values(i)));
        xlabel('k');
        ylabel('a_k and b_k');
        legend;
    end
end



% Θέμα 4 ----------------- Διχοτόμος με παράγωγο --------------------------

% Πρώτο υποερώτημα
l_values = [0.003, 0.005, 0.01, 0.02, 0.05, 0.1, 0.5];
figure;
sgtitle('Μέθοδος Διχοτόμου με παρ., l = 0.003, 0.005, 0.01, 0.02, 0.05, 0.1, 0.5');

for fNumber = 1:3
    n_vals = zeros(1, length(l_values));
    for i = 1:length(l_values)
        [n_vals(i), ~, ~] = bisectorDer(f{fNumber}, l_values(i), a1, b1);
    end
    subplot(3, 1, fNumber);
    plot(l_values, n_vals, '-o');
    title(sprintf('Function f%d', fNumber));
    xlabel('l');
    ylabel('επαναλήψεις');
end

% Δεύτερο υποερώτημα
l_values = [0.003, 0.01, 0.1];

for fNumber = 1:3
    figure;
    sgtitle(sprintf('Μέθοδος Διχοτόμου με παρ. για f%d', fNumber));
    for i = 1:length(l_values)
        % Call the Golden Section function
        [n, a_vals, b_vals] = bisectorDer(f{fNumber}, l_values(i), a1, b1);
        
        % Plot a_k and b_k as a function of iterations
        subplot(3, 1, i);
        plot(1:n+1, a_vals, '-o', 'DisplayName', 'a_k');
        hold on;
        plot(1:n+1, b_vals, '-o', 'DisplayName', 'b_k');
        hold off;
        title(sprintf('l = %.4f', l_values(i)));
        xlabel('k');
        ylabel('a_k and b_k');
        legend;
    end
end