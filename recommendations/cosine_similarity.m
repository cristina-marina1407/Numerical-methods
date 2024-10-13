function similarity = cosine_similarity(A, B)
  % obtinem dimensiunile vectorilor A si B
  n = length(A);
  m = length(B);

  product = 0;
  % initializam vectorii normalizati cu 0
  normalized_A = zeros(1, n);
  normalized_B = zeros(1, m);

  % normalizam vectorii A si B
  normalized_A = norm(A);
  normalized_B = norm(B);

  % calculam produsul scalar al vectorilor A si B
  product = dot(A, B);
  % calculam similaritatea folosind formula din enunt
  similarity = product / (normalized_A * normalized_B);
endfunction
