%===============================================================================
% Fichier: donnees_initiales.m
% Auteur: Marc-Olivier Fecteau
% Date de création: 2023-07-25
% Description: Graphiques des données initiales
% Note: Fonctionne sur MATLAB et sur GNU Octave
%===============================================================================

clear
clc

%% Chargement des données & approximation des dérivées
load('app7_data')
omega_vide = differentiation_centree(t, SIG_VIDE);
omega_air = differentiation_centree(t, SIG_AIR);
alpha_vide = differentiation_centree(t, omega_vide);
alpha_air = differentiation_centree(t, omega_air);



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

