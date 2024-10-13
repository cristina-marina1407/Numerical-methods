function x = oscillator(freq, fs, dur, A, D, S, R)
    % generam un vector de timp de la 0 pana la dur cu pasul 1/fs
    t = (0 : 1 / fs : dur - 1 / fs)';

    % calculam numarul de elemnete din vectorul t
    total_samples = numel(t);

    % generam un semnal sinusoidal de frecventa freq
    x = sin(2 * pi * freq * t);

    attack_samples = floor(A * fs);
    decay_samples = floor(D * fs);
    release_samples = floor(R * fs);

    % calculam numarul de sustains samples
    sustain_samples = total_samples - attack_samples - decay_samples - release_samples;
    
    % generam un vector cu valorile de la 0 la 1 cu atack_samples elemente
    attack_env = linspace(0, 1, attack_samples);
    % generam un vector cu valorile de la 1 la S cu decay_samples elemente
    decay_env = linspace(1, S, decay_samples);
    % generam un vector cu elemente egale cu S cu sustain_samples elemente
    sustain_env = ones(1, sustain_samples) * S;
    % generam un vector cu valorile de la S la 0 cu release_samples elemente
    release_env = linspace(S, 0, release_samples);
    
    % concatenam acesti vectori
    envelope = [attack_env, decay_env, sustain_env, release_env];
    
    x = x .* (envelope');
endfunction
