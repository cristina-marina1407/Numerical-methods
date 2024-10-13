function signal = apply_reverb(signal, impulse_response)
  % convertim semnalul in mono
  impulse_response = stereo_to_mono(impulse_response);

  % calculam convolutia dintre signal si impulse_response
  signal = fftconv(signal, impulse_response);

  % normalizam semnalul rezultat
  signal = signal / max(abs(signal));
endfunction
