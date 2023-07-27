%===============================================================================
% Fichier: problematique.m
% Auteurs: Marc-Olivier Fecteau, Aryel Morin-Mercier
% Date de création: 2023-07-25
% Description: Code de la problématique S3 GRO APP 7
%===============================================================================

clear
clc

%% Chargement des données & approximation des dérivées
load('app7_data')
omega_vide = differentiation_centree(t, SIG_VIDE);    % theta'(t)
omega_air = differentiation_centree(t, SIG_AIR);      % theta'(t)
alpha_vide = differentiation_centree(t, omega_vide);  % theta''(t)
alpha_air = differentiation_centree(t, omega_air);    % theta''(t)



%% Paramètres
global m = 10;             % Masse (kg)
global D = 1;              % Distance entre câbles (m)
global h = 3;              % Hauteur des câbles (m)
global g = 9.81;           % constante gravitationnelle (N/kg)
global theta0 = 3*pi/4;    % Angle initial (rad)
global K = 0;              % Coeff. de trainée aéro. (kg.m²/s) - ∈ ]0, 0.1[
ISPAN = linspace(1e-3, 1, 100);



%% ode45

% Paramètres pour ode45
S0 = [theta0 0];
TSPAN = t;
odeset('RelTol', 1e-6, 'MaxStep', 5/199);

% Fonction ode45
t_ode = zeros(length(t), 1);
S = zeros(length(t_ode), 1);
for i = 1:1:length(ISPAN)
  I_iteration = ISPAN(i);
  [t_ode, S] = ode45(@(t, S) odeAPP7(t, S, I_iteration), TSPAN, S0);
  eQuad(i) = sum((S(:,1) - SIG_VIDE).^2);
  eRMS(i) = sqrt(eQuad(i) / length(S(1)));
  disp(I_iteration);
  disp(eRMS(i));
end

figure(1)
plot(t, SIG_VIDE, '-k');
hold on;
plot(t_ode, S(:, 1), '-r');
hold off;


