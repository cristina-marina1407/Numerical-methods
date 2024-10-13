function [x, y] = parse_data(filename)
    % deschidem fisierul pentru citire
    fid = fopen(filename, 'r');

    % citim n, x si y din fisier
    n = fscanf(fid, '%d', 1);
    x = fscanf(fid, '%f', n + 1);
    y = fscanf(fid, '%f', n + 1);
    
    % inchidem fisierul
    fclose(fid);
endfunction
