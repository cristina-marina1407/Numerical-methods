function mono = stereo_to_mono(stereo)
  % transformam semnalul stereo intr-un semnal mono
  mono = mean(stereo, 2);

  % normalizam semnalul mono
  mono = mono / max(abs(mono));
endfunction
