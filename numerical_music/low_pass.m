function signal = low_pass(signal, fs, cutoff_freq)
  % calculam transformata Fourier a semnalului
  X = fft(signal);
  % obtinem dimensiunea vectorului signal
  n = length(signal);

  % calculam frecventele posibile ale semnalului
  for i = 1 : n
    freqs(i) = (i - 1) * fs / n;
  endfor

  % obtinem dimensiunea vectorului freqs
  m = length(freqs);

  % cream vectorul mask care este 1 pentru frecventele mai mici
  % decat cutoff_freq si 0 pentrufrecventele maimari decat cutoff_freq
  mask = zeros(m, 1);
  for i = 1 : m
    if freqs(i) < cutoff_freq
      mask(i) = 1;
    endif
  endfor
  
  % aplicam produsul lui Hadamard intre X si mask
  X_filtered = X .* mask;

  % calculam inversa transformata Fourier a semnalului filtrat
  signal = ifft(X_filtered);
  % normalizam semnalul
  signal = signal / max(abs(signal));
endfunction
