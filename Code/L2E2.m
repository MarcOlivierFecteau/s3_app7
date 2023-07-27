%===============================================================================
% Fichier: L2E2.m
% Auteurs: Marc-Olivier Fecteau, Aryel Morin-Mercier
% Description: Exercice 2 du laboratoire 2 de S3 GRO APP 7
%===============================================================================

clear
clc

%% Exercice 2
x = -10:1e-4:10;

% Exercice 2a
figure(1)
plot(x, airy(x), '-b');
hold on;
plot(x, airy(1, x), '-r');
hold off;
xlabel('x');
ylabel('airy(x)');
box on;
grid on;

% Exercice 2b
  % R: Le zéro le plus proche de l'origine est environ x = -9.

% Exercice 2c
x0 = 1;
x_a = x0;
x_b = 0;
pas = 1e-4;
absTol = 1e-6;
while (abs(x_b - x_a) > absTol)
  df_airy = airy(x_b) - airy(x_a)
  x_a = x_b;
  x_b = x_a - airy(x_a) / airy(1, x_a);
end

% Exercice 2d

% Exercice 2e
##x_a = x0;
##x_b = 0;
##absTol = 1e-6;
##while (abs(x_b - x_a) > absTol)
##  x_a = x_b;
##  x_b = x_a - airy(1, x_a) / airy(2, x_a);
##end
