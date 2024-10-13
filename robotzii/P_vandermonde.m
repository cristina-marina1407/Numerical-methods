function y_interp = P_vandermonde (coef, x_interp)
	% obtinem dimensiunea vectorului x_interp
	n = length(x_interp);
	% initializam vectorul y_interp cu 0
	y_interp = zeros(n, 1);
	% obtinem dimensiunea vectorului coef
	m = length(coef);

	% calculam valorile polinomului Vandermonde
	for i = 1 : n
		for j = 1 : m
			y_interp (i, 1) += coef(j) * (x_interp(i) ^ (j - 1));
		endfor
	endfor
endfunction
