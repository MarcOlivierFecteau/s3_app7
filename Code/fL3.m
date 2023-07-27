%===============================================================================
% Fichier: fL3.m
% Auteurs: Marc-Olivier Fecteau, Aryel Morin-Mercier
% Description: Fonction du laboratoire 3 de S3 GRO APP 7
%===============================================================================

function Z = fL3(x, y, a)
  Z = zeros(length(x), length(y));
  for i = 1:length(x)
    for j = 1:length(y)
      r = sqrt(x(i).^2 + y(j).^2);
      theta = atan2(y(j), x(i));
      if (r < a)
        Z(i, j) = besselj(2, (8.4172.*r./a)) * cos(2.*theta);
      end
    end
  end
end
