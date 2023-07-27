%===============================================================================
% Fichier: L1E2.m
% Auteurs: Marc-Olivier Fecteau, Aryel Morin-Mercier
% Description: Exercice 2 du laboratoire 1 de S3 GRO APP 7
%===============================================================================

clc
clear

% Données
x = [1.0, 3.0, 4.0 ,6.0, 7.0];
h = [-1.6, 4.8, 6.1, 14.6, 15.1];
% Exercice 2a
A = inv([sum(x.^2), sum(x); sum(x), length(x)]) * [sum(h.*x); sum(h)];
m = A(1);
b = A(2);
g = @(x) m.*x + b;

% Exercice 2b
e_quad_g = sum((g(x) - h).^2);
e_rms_g = sqrt(e_quad_g / length(x));
y_mean = sum(h) / length(x);
R2_g = sum((g(x) - y_mean).^2) / (sum(h) - y_mean).^2;

% Exercice 2c
poly2_data = polyfit(x, h, 2);
poly3_data = polyfit(x, h, 3);
poly2 = @(x) poly2_data(1).*x.^2 + poly2_data(2).*x + poly2_data(3);
poly3 = @(x) poly3_data(1).*x.^3 + poly3_data(2).*x.^2 + poly3_data(3).*x + poly3_data(4);
e_quad_poly2 = sum((poly2(x) - h).^2);
e_quad_poly3 = sum((poly3(x) - h).^2);
e_rms_poly2 = sqrt(e_quad_poly2 / length(x));
e_rms_poly3 = sqrt(e_quad_poly3 / length(x));
R2_poly2 = sum((poly2(x) - y_mean).^2) / (sum(h) - y_mean).^2;
R2_poly3 = sum((poly3(x) - y_mean).^2) / (sum(h) - y_mean).^2;

%% Graphiques
figure(1)
plot(x, h, '-k');
hold on;
plot(x, g(x), '-r');
plot(x, poly2(x), '-b');
plot(x, poly3(x), '-g');
hold off;
xlabel('x');
ylabel('y');
box on;
grid on;
legend('données', 'g(x)', 'poly2(x)', 'poly3(x)', 'fontsize', 14, 'location', 'northeast');

