function reduced_mat = preprocess(mat, min_reviews)
  % obtinem dimensiunile matricei mat
  [m n] = size(mat);

  k = 1;
  for i = 1 : m
    % calculam numarul de review-uri pentru fiecare linie
    reviews_row = 0;
    for j = 1 : n
      if mat(i, j) != 0
        reviews_row = reviews_row + 1;
      endif
    endfor

    % daca numarul de review-uri este mai mare sau egal cu min_reviews
    % adaugam linia in noua matrice
    if reviews_row >= min_reviews
      new_mat(k, :) = mat(i, :);
      k = k + 1;
    endif

  endfor
  % returnam matricea obtinuta
  reduced_mat = new_mat;
endfunction
