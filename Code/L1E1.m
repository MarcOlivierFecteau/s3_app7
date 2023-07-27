%===============================================================================
% Fichier: L1E1.m
% Auteurs: Marc-Olivier Fecteau, Aryel Morin-Mercier
% Description: Exercice 1 du laboratoire 1 de S3 GRO APP 7
%===============================================================================

clear
clc

%% Exercice 1 - a) & c)
f = @(x, y) (x.^3) + (y.^3) - (12 .* x .* y) - (3 .* y) + (100 .* exp(-y.^2));
df_x = @(x, y) (3 .* x.^2) - (12 .* y);
df_y = @(x, y) (3 .* y.^2) - (12 .* x) - 3 - (200 .* y .* exp(-y.^2));
ddf_xx = @(x) 6 .* x;
ddf_yy = @(y) (6 .* y) - 200.*(exp(-y.^2) - 2 .* y.^2 .* exp(-y.^2));
ddf_xy = -12;
lin_f = @(x, y) 22.484 - 21 .* x - 10.326 .* y;

% Exercice 1 - e)
f(1,2)
df_x(1,2)
df_y(1,2)

%% Exercice 1 - f)

% Création des vecteurs lignes X et Y
X = linspace(-10,10,100);
Y = linspace(-10,10,100);
[Xmat, Ymat] = meshgrid(X, Y);

% Calcul matriciel de la fonction
Z = Xmat.^3 + Ymat.^3 - 12.*Xmat.*Ymat + 3.*Ymat -100.*exp(-Ymat.^2);

% Calcul matriciel de la dérivée seconde
signes_ddf = sign(ddf_xx(Xmat).*ddf_yy(Ymat) - ddf_xy^2);

%% Graphiques
figure(1)
subplot(221)
surf(X, Y, Z);
hold on;
plot3(X, Y, lin_f(Xmat, Ymat), '-r');
hold off;
xlabel('x');
ylabel('y');
zlabel('f(x,y)');
box on;
grid on;

subplot(222)
contour3(X, Y, Z, 30);
xlabel('x');
ylabel('y');
zlabel('f(x,y)');
box on;
grid on;

subplot(223)
imagesc(X, Y, Z);
xlabel('x');
ylabel('y');
box on;
grid on;
##colorbar('vert');

##subplot(224)
##contour(X, Y, Z);
##xlabel('x');
##ylabel('y');
##box on;
##grid on;

figure(2)
plot3(X, Y, signes_ddf, '-k');
xlabel('x');
ylabel('y');
zlabel('signe de la dérivé seconde');
box on;

figure(3)
subplot(211)
plot3(X, Y, df_x(Xmat, Ymat), '-r');
subplot(212)
plot3(X, Y, df_y(Xmat, Ymat), '-b');
