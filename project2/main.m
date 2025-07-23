% Θέμα 1 - Σχεδιασμός f(x,y)

f = @(x, y) x.^5 .* exp(-x.^2 - y.^2);

% Δημιουργία πλέγματος
[X, Y] = meshgrid(linspace(-3, 3, 100));

% Υπολογισμός της συνάρτησης
F = X.^5 .* exp(-X.^2-Y.^2);

% Σχεδίαση της συνάρτησης
figure;
surf(X, Y, F);
xlabel('x');
ylabel('y');
zlabel('f(x,y)');
title('3D Plot of f(x, y) = x^5 e^{-x^2-y^2}');
shading interp; % Βελτιώνει την εμφάνιση
colorbar; % Προσθήκη χρωματικής μπάρας


% Θέμα 2: Ελαχιστοποίηση της f(x,y) με τη Μέθοδο Μέγιστης Καθόδου

% Ορισμός της κλίσης
grad_f = @(x, y) [5*x.^4.*exp(-x.^2-y.^2) - 2*x.^6.*exp(-x.^2-y.^2), ...
                  -2*y.*x.^5.*exp(-x.^2-y.^2)];

% Αρχικά σημεία
start_points = [0, 0; -1, 1; 1, -1];

% Παράμετροι για τη μέγιστη κάθοδο (των δωριέων)
max_iter = 100; % Μέγιστος αριθμός επαναλήψεων
tol = 1e-4; % Ανοχή για τερματισμό
gamma_fixed = 0.1; % Σταθερό βήμα

fprintf('\nΜέθοδος Μέγιστης Καθόδου:\n');
% Επανάληψη για κάθε αρχικό σημείο
for i = 1:size(start_points, 1)
    % Αρχικό σημείο
    x_k = start_points(i, 1);
    y_k = start_points(i, 2);
    fprintf('Αρχικό σημείο: (%.2f, %.2f)\n', x_k, y_k);
    
    % Μέγιστη Κάθοδος με Σταθερό Βήμα
    for iter = 1:max_iter
        grad = grad_f(x_k, y_k); % Υπολογισμός της κλίσης
        norm_grad = norm(grad); % Μέτρο της κλίσης
        
        if norm_grad < tol
            fprintf('Σύγκλιση σε %.2f επαναλήψεις στο σημείο: (%.4f, %.4f)\n', iter, x_k, y_k);
            break;
        end
        
        % Ενημέρωση σημείου
        x_k = x_k - gamma_fixed * grad(1);
        y_k = y_k - gamma_fixed * grad(2);
    end
    
    if iter == max_iter
        fprintf('Όχι σύγκλιση σε %.2f επαναλήψεις.. (σημείο: (%.4f, %.4f))\n', iter, x_k, y_k);
    end

    % Μέγιστη Κάθοδος με Κανόνα του Armijo
    x_k = start_points(i, 1); % Reset στο αρχικό σημείο
    y_k = start_points(i, 2);
    gamma = 1; % Αρχική τιμή βήματος
    c = 1e-4; % Παράμετρος του Armijo
    rho = 0.5; % Παράγοντας μείωσης
    
    for iter = 1:max_iter
        grad = grad_f(x_k, y_k); % Υπολογισμός της κλίσης
        norm_grad = norm(grad); % Μέτρο της κλίσης
        
        if norm_grad < tol
            fprintf('Σύγκλιση (Armijo) σε %.2f επαναλήψεις στο σημείο: (%.4f, %.4f)\n', iter, x_k, y_k);
            break;
        end
        
        % Υπολογισμός κατά Armijo
        while f(x_k - gamma * grad(1), y_k - gamma * grad(2)) > ...
              f(x_k, y_k) - c * gamma * norm_grad^2
            gamma = rho * gamma; % Μείωση του βήματος
        end
        
        % Ενημέρωση σημείου
        x_k = x_k - gamma * grad(1);
        y_k = y_k - gamma * grad(2);
    end

    if iter == max_iter
        fprintf('Όχι σύγκλιση σε %.2f επαναλήψεις.. (σημείο: (%.4f, %.4f))\n', iter, x_k, y_k);
    end

end


% Θέμα 3: Ελαχιστοποίηση της f(x,y) με τη Μέθοδο Newton

% Ορισμός του Hessian της f(x, y)
hessian_f = @(x, y) [
    (20*x.^3 - 12*x.^5).*exp(-x.^2-y.^2), -10*x.^4.*y.*exp(-x.^2-y.^2);
    -10*x.^4.*y.*exp(-x.^2-y.^2), (-2*x.^5 + 4*x.^5.*y.^2).*exp(-x.^2-y.^2)
];

fprintf('\nΜέθοδος Newton:\n');
for i = 1:size(start_points, 1)
    % Αρχικό σημείο
    x_k = start_points(i, 1);
    y_k = start_points(i, 2);
    fprintf('Αρχικό σημείο: (%.2f, %.2f)\n', x_k, y_k);
    
    for iter = 1:max_iter
        grad = grad_f(x_k, y_k); % Υπολογισμός κλίσης
        hess = hessian_f(x_k, y_k); % Υπολογισμός Hessian
        norm_grad = norm(grad); % Μέτρο της κλίσης
        
        if norm_grad < tol
            fprintf('Σύγκλιση σε %.2f επαναλήψεις στο σημείο: (%.4f, %.4f)\n', iter, x_k, y_k);
            break;
        end
        
        % Ενημέρωση σημείου
        delta = -hess \ grad'; % Επίλυση HΔ = -∇f
        x_k = x_k + delta(1);
        y_k = y_k + delta(2);
    end

    if iter == max_iter
        fprintf('Όχι σύγκλιση σε %.2f επαναλήψεις.. (σημείο: (%.4f, %.4f))\n', iter, x_k, y_k);
    end
end


% Θέμα 4: Ελαχιστοποίηση της f(x, y) με τη Μέθοδο Levenberg-Marquardt

fprintf('\nΜέθοδος Levenberg-Marquardt:\n');
lambda = 0.01; % Αρχική παράμετρος απόσβεσης
for i = 1:size(start_points, 1)
    % Αρχικό σημείο
    x_k = start_points(i, 1);
    y_k = start_points(i, 2);
    fprintf('Αρχικό σημείο: (%.2f, %.2f)\n', x_k, y_k);
    
    for iter = 1:max_iter
        grad = grad_f(x_k, y_k); % Υπολογισμός κλίσης
        hess = hessian_f(x_k, y_k); % Υπολογισμός Hessian
        norm_grad = norm(grad); % Μέτρο της κλίσης
        
        if norm_grad < tol
            fprintf('Σύγκλιση σε %.2f επαναλήψεις στο σημείο: (%.4f, %.4f)\n', iter, x_k, y_k);
            break;
        end
        
        % Ενημέρωση Hessian για Levenberg-Marquardt
        hess_lm = hess + lambda * eye(2);
        delta = -hess_lm \ grad'; % Επίλυση (H + λI)Δ = -∇f
        
        % Υπολογισμός νέου σημείου και βελτίωσης
        new_x = x_k + delta(1);
        new_y = y_k + delta(2);
        if f(new_x, new_y) < f(x_k, y_k)
            x_k = new_x;
            y_k = new_y;
            lambda = lambda / 10; % Μείωση απόσβεσης αν υπάρχει βελτίωση
        else
            lambda = lambda * 10; % Αύξηση απόσβεσης αν δεν υπάρχει βελτίωση
        end
    end

    if iter == max_iter
        fprintf('Όχι σύγκλιση σε %.2f επαναλήψεις.. (σημείο: (%.4f, %.4f))\n', iter, x_k, y_k);
    end
end
