function dS = odeAPP7(t, S, I_specified)
  dS = zeros(2, 1);

  % Variables
  theta = S(1);
  omega = S(2);

  % Constantes
  m = 10;             % Masse (kg)
  D = 1;              % Distance entre câbles (m)
  h = 3;              % Hauteur des câbles (m)
  g = 9.81;           % constante gravitationnelle (N/kg)
  K = 0;              % Coeff. de trainée aéro. (kg.m²/s) - ∈ ]0, 0.1[

  % Équations
  alpha = -(K*omega*abs(omega) + (m*g*D^2/(4*h))*sin(theta)/sqrt(1 - 0.5*(D/h)^2*(1-cos(theta))))/I_specified;

  % Système d'équations
  dS(1, :) = S(2);
  dS(2, :) = alpha;
end
