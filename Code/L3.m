%===============================================================================
% Fichier: L3.m
% Auteurs: Marc-Olivier Fecteau, Aryel Morin-Mercier
% Description: Laboratoire 3 de S3 GRO APP 7
%===============================================================================

clear
clc

%% Exercice
a = 0.1;  % Rayon de la membrane circulaire (m)

% Exercice a (voir fL3.m)

% Exercice b
x = linspace(-0.1, 0.1, 100);
y = linspace(-0.1, 0.1, 100);

figure(1)
surf(x, y, fL3(x, y, a));
xlabel('x');
ylabel('y');
zlabel('f(x, y, a)');
box on;
grid on;

% Exercice d
figure(2)
plot(x, fL3(x, 0, a), '-r');
xlabel('x');
ylabel('f(x, 0, a)');
box on;
grid on;

% Exercice e
x = linspace(0, a, 100);
F = fL3(x, 0, a);
F1 = differentiation_centree(x, F);

figure(3)
plot(x, F);
hold on;
plot(x, F1);
hold off;
xlabel('x');
ylabel('F');
box on;
grid on;

% Exercice f
absTol = 1e-4;
pas = 1e-4;
x0 = 0.05;
x_a = x0;
F_a = fL3(x_a, 0, a);
F1_a = (fL3(x_a + pas, 0, a) - fL3(x_a - pas, 0, a)) / (2.*pas);
x_b = x_a - F_a / F1_a;
while (abs(x_b - x_a) > absTol)
  x_a = x_b;
  F_a = fL3(x_a, 0, a);
  F1_a = (fL3(x_a + pas, 0, a) - fL3(x_a - pas, 0, a)) / (2.*pas);
  x_b = x_a - F_a / F1_a;
end

% Exercice g
x = linspace(-0.1, 0.1, 100);
y = linspace(-0.1, 0.1, 100);
[x_mesh, y_mesh] = meshgrid(x, y);
f = fL3(x, y, a);
for i = 1:1:length(y)
  dfx(i, :) = differentiation_centree(x, f(:, i));
end
for i = 1:1:length(x)
  dfy(:, i) = differentiation_centree(y, f(i, :));
end
for i = 1:1:length(y)
  ddfxx(i, :) = differentiation_centree(x, dfx(:, i));
end
for i = 1:1:length(x)
  ddfyy(:, i) = differentiation_centree(y, dfy(i, :));
end
for i = 1:1:length(x)
  ddfxy(:, i) = differentiation_centree(y, dfx(:, i));
end

figure(4)
subplot(121)
surf(x, y, dfx);
xlabel('x');
ylabel('y');
zlabel('dfx(x,y)');
box on;
grid on;
title('f_x');
subplot(122)
surf(x, y, dfy);
xlabel('x');
ylabel('y');
zlabel('dfy(x,y)');
box on;
grid on;
title('f_y');

figure(5)
subplot(121)
surf(x, y, ddfxx);
xlabel('x');
ylabel('y');
zlabel('ddfxx(x,y)');
box on;
grid on;
title('f_{xx}');
subplot(122)
surf(x, y, ddfyy);
xlabel('x');
ylabel('y');
zlabel('ddfyy(x,y)');
box on;
grid on;
title('f_{yy}');

figure(6)
surf(x, y, ddfxy);
xlabel('x');
ylabel('y');
zlabel('ddfxy(x,y)');
box on;
grid on;
title('f_{xy}');

% Exercice h
h = 1e-4;
fx = @(A_cur, A_prev) (fL3(A_cur(1), A_cur(2), a) - fL3(A_prev(1), A_prev(2), a)) / (A_cur(1) - A_prev(1));
fy = @(A_cur, A_prev) (fL3(A_cur(1), A_cur(2), a) - fL3(A_prev(1), A_prev(2), a)) / (A_cur(2) - A_prev(2));
fxx = @(A_cur, A_prev, A_prevPrev) (fx(A_cur, A_prev) - fx(A_prev, A_prevPrev)) / (A_cur(1) - A_prev(1));
fyy = @(A_cur, A_prev, A_prevPrev) (fy(A_cur, A_prev) - fy(A_prev, A_prevPrev)) / (A_cur(2) - A_prev(2));
J = @(A_cur, A_prev, A_prevPrev) [fx(A_cur, A_prev), fy(A_cur, A_prev);
                                  fxx(A_cur, A_prev, A_prevPrev), fyy(A_cur, A_prev, A_prevPrev)];
absTol = [1e-4; 1e-4];
X0 = [0.05; 0.05];
Xa = [0;0];
Xb = [0;0];
Xc = X0;
Xd = Xc - inv(J(Xc, Xb, Xa))*[fx(Xc, Xb); fy(Xc, Xb)];
while (abs(Xd(1) - Xc(1)) > absTol(1)) && (abs(Xd(1) - Xc(1)) > absTol(1))
  Xa = Xb;
  Xb = Xc;
  Xc = Xd;
  Xd = Xc - inv(J(Xc, Xb, Xa))*[fx(Xc, Xb); fy(Xc, Xb)];
  disp(Xd);
end

