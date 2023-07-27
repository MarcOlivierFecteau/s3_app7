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
omega_vide = differentiation_centree(t, SIG_VIDE);
omega_air = differentiation_centree(t, SIG_AIR);
alpha_vide = differentiation_centree(t, omega_vide);
alpha_air = differentiation_centree(t, omega_air);



%% Paramètres
global m = 10;             % Masse (kg)
global D = 1;              % Distance entre câbles (m)
global h = 3;              % Hauteur des câbles (m)
global g = 9.81;           % constante gravitationnelle (N/kg)
global theta_0 = 3*pi/4;   % Angle initial (rad)
global I = 0.5;            % Moment d'inertie (kg.m²) - ∈ ]0, 1[
global K = 0.05;           % Coeff. de trainée aéro. (kg.m²/s) - ∈ ]0, 0.1[



%% Graphiques
figure(1)
subplot(321)
plot(t, SIG_VIDE, '-b');
xlabel("temps écoulé (s)", 'fontsize', 14);
ylabel('\theta (rad)', 'fontsize', 14);
title('\theta en fonction du temps - Expérience à vide');
legend('\theta_{vide}', 'location', 'northeast', 'fontsize', 12);
grid on;
box on;

subplot(322)
plot(t, SIG_AIR, '-b');
xlabel('temps écoulé (s)', 'fontsize', 14);
ylabel('\theta (rad)', 'fontsize', 14);
title('\theta en fonction du temps - Expérience dans air');
legend('\theta_{air}', 'location', 'northeast', 'fontsize', 12);
grid on;
box on;

subplot(323)
plot(t, omega_vide, '-r');
xlabel("temps écoulé (s)", 'fontsize', 14);
ylabel('\omega (rad/s)', 'fontsize', 14);
title('\omega en fonction du temps - Expérience à vide');
legend('\omega_{vide}', 'location', 'northeast', 'fontsize', 12);
grid on;
box on;

subplot(324)
plot(t, omega_air, '-r');
xlabel('temps écoulé (s)', 'fontsize', 14);
ylabel('\omega (rad/s)', 'fontsize', 14);
title('\omega en fonction du temps - Expérience dans air');
legend('\omega_{air}', 'location', 'northeast', 'fontsize', 12);
grid on;
box on;

subplot(325)
plot(t, alpha_vide, '-g');
xlabel("temps écoulé (s)", 'fontsize', 14);
ylabel('\alpha (rad/s^2)', 'fontsize', 14);
title('\alpha en fonction du temps - Expérience à vide');
legend('\alpha_{vide}', 'location', 'northeast', 'fontsize', 12);
grid on;
box on;

subplot(326)
plot(t, alpha_air, '-g');
xlabel('temps écoulé (s)', 'fontsize', 14);
ylabel('\alpha (rad/s^2)', 'fontsize', 14);
title('\alpha en fonction du temps - Expérience dans air');
legend('\alpha_{air}', 'location', 'northeast', 'fontsize', 12);
grid on;
box on;

