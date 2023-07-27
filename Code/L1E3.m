%===============================================================================
% Fichier: L1E2.m
% Auteurs: Marc-Olivier Fecteau, Aryel Morin-Mercier
% Description: Exercice 2 du laboratoire 1 de S3 GRO APP 7
%===============================================================================

clc
clear

% Donnees
x = 1:1:5;
h = [11.4, 6.1, 3.6, 3.3, 2.1];

%% Exercice 3a

% Polynomiale de degré 1
A = inv([sum(x.^2), sum(x); sum(x), length(x)]) * [sum(h.*x); sum(h)];
m = A(1);
b = A(2);
g = @(x) m.*x + b;

% Exponentielle
beta = m;
alpha = exp(b);
G_e = @(x) alpha.*exp(beta.*x);

% Réciproque (inverse)
G_r = @(x) alpha;

%% Exercice 3b
e_quad_g = 1;
e_quad_e = 1;
e_quad_r = 1;
e_rms_g = 1;
e_rms_e = 1;
e_rms_r = 1;
R2_g = 1;
R2_e = 1;
R2_r = 1;

%% Graphiques
figure(1)
plot(x, h, 'ok');
hold on;
plot(x, g(x), '-r');
hold off;
xlabel('x');
ylabel('y');
legend('donnees', 'g(x)', 'G_e(x)', 'G_r(x)', 'location', 'northeast');
