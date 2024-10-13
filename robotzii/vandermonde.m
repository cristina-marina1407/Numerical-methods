function coef = vandermonde(x, y)
    % obtinem dimensiunea vectorului x
    n = length(x);

    % initializam matricea A
    A = zeros(n, n);

    % construim matricea A
    for i = 1 : n
        x_i = x(i);
        for j = 1 : n
            % pe prima coloana se gasesc doar 1
            if j == 1
                A(i, j) = 1;
            % in rest, se adauga x_i ^ (j - 1)
            else 
                A(i, j) = x_i;
                x_i = x_i * x(i);
            endif
        endfor
    endfor

    % rezolvam sistemul pentru a afla coeficientii Vandermonde
    coef = A \ y;
endfunction
