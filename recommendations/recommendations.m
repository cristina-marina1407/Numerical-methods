function recoms = recommendations(path, liked_theme, num_recoms, min_reviews, num_features)
  mat = read_mat(path);
  new_mat = preprocess(mat, min_reviews);

  % descompunem matricea new_mat folosind svds
  [U, S, V] = svds(new_mat, num_features);

  % extragem linia corespunzatoare temei date
  liked_theme_vector = V(liked_theme, :);

  % calculam similaritatea dintre liked_theme_vector si fiecare linie din V
  n = size(V, 1);
  similarities = zeros(1, n);
  for i = 1 : n
    similarities (1, i) = cosine_similarity(V(i, :), liked_theme_vector);
  endfor

  % sortam similaritatile descrescator
  [sorted_similarities sorted_indices] = sort(similarities, 'descend');
  % obtinem primele num_recoms teme, mai putin tema liked_theme
  recoms = sorted_indices(2 : num_recoms + 1);
endfunction
