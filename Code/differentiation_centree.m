% Différentiation numérique centrée

function df = differentiation_centree(x, f)
	df = zeros(length(f), 1);
	df(1) = (f(2) - f(1)) / (x(2) - x(1));
	for i = 2:(length(x)-1)
		df(i) = (f(i+1) - f(i-1)) / (x(i+1) - x(i-1));
    end
	df(end) = (f(end) - f(end-1)) / (x(end) - x(end-1));
end

