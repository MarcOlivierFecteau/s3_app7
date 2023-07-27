%===============================================================================
% Fichier: L2E1.m
% Auteurs: Marc-Olivier Fecteau, Aryel Morin-Mercier
% Description: Exercice 1 du laboratoire 2 de S3 GRO APP 7
%===============================================================================

clear
clc

%% Exercice 1

% Exercice 1a
f = @(x) 1 + x.^2 - 2.*exp(-x);
df = @(x) 2.*x + 2.*exp(-x);

% Exercice 1b
x = linspace(-2, 2, 100);

figure(1)
plot(x, f(x));
xlabel('x');
ylabel('f(x)');
box on;
grid on;

  % R: La fonction semble posséder un zéro potentiel, et elle tend vers 0.49.

% Exercice 1c
x0 = 0.5;
N = 5;
x_a = x0;
for (i = 1:1:N)
  x_b = x_a - f(x_a) / df(x_a);
  x_a = x_b;
end

% Exercice 1d
absTol = 1e-3;
x_a = x0;
x_b = 0;
while (abs(x_b - x_a) > absTol)
  x_a = x_b;
  x_b = x_a - f(x_a) / df(x_a);
end

% Exercice 1e
relTol = 1e-4;
x_a = x0;
x_b = 0;
while (abs(x_b/x_a - 1) > absTol)
  x_a = x_b;
  x_b = x_a - f(x_a) / df(x_a);
end

% Exercice 1f
x_a = x0;
x_b = 0;
while (abs(f(x_b)) > absTol)
  x_a = x_b;
  x_b = x_a - f(x_a) / df(x_a);
  disp(x_b)
end


