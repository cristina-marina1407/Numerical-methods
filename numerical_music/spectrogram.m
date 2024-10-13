function [S f t] = spectrogram(signal, fs, window_size)
    % obtinem dimensiunea vectorului signal
    n = length(signal);

    num_windows = floor(n / window_size);
  
    % initializam matricea spectogram
    S = zeros(window_size, num_windows);
    
    for i = 1:num_windows
        % extragem fereastra de dimensiune window_size
        window = signal((i - 1) * window_size + 1 : i * window_size);
        
        % aplcam functia Hann
        window = window .* hanning(window_size);
        
        % calculam transformata Fourier rapida a semnalului
        % dat de variabila window
        X = fft(window, 2 * window_size);
        
        % pastram doar prima jumatate din vectorul X
        X = X(1:window_size);
        
        % adaugam valorile in matricea S
        S(:, i) = abs(X);
    endfor

    % calculam vectorul de frecvente
    for i = 0 : window_size - 1
      f(i + 1) = i * fs / (2 * window_size);
    endfor
    f = f';

    % calculam vetorul de timp
    for i = 0 : num_windows - 1
      t(i + 1) = i * window_size / fs;
    endfor
    t = t';
endfunction
