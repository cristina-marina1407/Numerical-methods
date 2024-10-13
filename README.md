**Postelnicu Cristina-Marina**
**313CA**

## Tema 2

### Descriere:

# Task ul 1 - Numerical Music

    * Pentru implementarea acestui task am implemntat urmatoarele functii:
        * Functia stereo_to_mono transforma un semnal de tip stereo intr un
        semnal de tip mono, transformand  matricea stereo intr un vector.
        La final, semnalul de tip mono obtinut este normalizat.

        * Functia spectogram calculeaza spectograma unui semnal, primind ca
        parametru semnalul, fs si dimensiunea ferestrei (window_size).
        Functia imparte semnalul in ferestre de dimensiune window_size,
        aplica functia Hann fiecarei ferestre, iar apoi calculeaza
        Transformata Fourier rapida a fiecarei ferestre. Cum Transformata
        Fourier este simetrica, pastram prima jumatate a rezultatului si
        o adaugam in matricea spectogram.
        Functia calculeaza si vectorul de frecvente f si vectorul timp t
        corespunzatori spectrogramei.
        
        * Functia oscillator are rolul de a calcula un ADSR envelope.
        Functia incepe prin generarea unui vector de timp t si a unui semnal
        sinusoidal x cu frecventa freq.
        Apoi, calculeaza numarul de esantioane pentru fazele de atac,
        decadere si eliberare. Faza de sustinere este calculata ca diferenta
        dintre numarul total de esantioane si suma esantioanelor calculate
        anterior. Se genereaza apoi vectorii de atac, decadere, sustinere si
        eliberare, care sunt concatenati pentru a forma ADSR envelope ul.
        In final, semnalul sinusoidal este inmultit cu acesta pentru a aplica
        forma ADSR la semnal.

        * Functia low_pass incepe prin calcularea Transformatei Fourier a
        semnalului dat. Apoi, genereaza un vector de frecvente posibile ale
        semnalului. Se creeaza un vector mask care este 1 pentru frecventele
        mai mici decat cutoff_freq si 0 pentru frecventele mai mari.
        Se aplica produsul lui Hadamard intre Transformata Fourier a semnalului
        si acest vector. Se calculeaza inversa Transformatei Fourier a
        semnalului pentru a obtine semnalul filtrat in domeniul timpului.
        La final, semnalul este normalizat.

        * Functia apply_reverb incepe prin convertirea lui impluse_response
        in mono, folosind functia stereo_to_mono. Dupa se calculeaza convolutia
        dintre semnal si impulse_response, folosind functia fftconv. La final,
        semnalul este normalizat.

# Task ul 2 - Robotzii

    * Pentru implementarea acestui task am implemntat urmatoarele functii:
        * Functia parse_data are rolul de a citi date dintr un fisier.
        Incepe prin deschiderea fisierului, dupa care citeste n, numarul
        de elemente, si vectorii x si y pe care ii si returneaza.

        * Functia vandermonde are rolul de a calcula coeficientii polinomului
        Vandermonde. Functia incepe prin initializarea si apoi construirea
        matricei A. Pentru a construi aceasta matrice se pune valoarea unu pe
        prima coloana, iar in rest se adauga x_i la puterea j - 1. La final,
        se rezolva sistemul pentru a afla coeficientii cautati. 

        * Functia P_vandermonde calculeaza valorile polinomului Vandermonde
        pentru un set de puncte. Se apeleaza functia vandermonde pentru a
        obtine coeficientii si apoi se calculeaza vectorul y_interp ce contine
        valorile polinomului lui Vandermonde pentru punctele din x_interp. 

# Task ul 3 - Recommendations

    * Pentru implementarea acestui task am implemntat urmatoarele functii:
        * Functia preprocess are rolul de a prelucra o matrice, eliminand
        liniile care au mai putine review uri decat numarul de minim de 
        review uri dat. Se parcurge fiecare linie din matrice si se calculeaza
        cate review uri pentru fiecare linie, acesta fiind dat de numarul de
        elemente nenule. Daca numarul de review uri de pe o linie este mai
        mare decat numarul minim de review uri, linia este adaugata intr o
        noua matrice. Retinem numarul liniei la care am ramas cu ajutorul
        contorului k.

        * Functia cosine_similarity are rolul de a calcula similaritatea
        cosinus intre doi vectori. Se normalizeaza vectorii A si B, folosind
        functia norm, dupa care se calculeaza produsul scalar dintre A si B.
        La final, se calculeaza similaritatea cosinus folosind formula din
        enunt.
        
        * Functia read_mat citeste o matrice dintr un fisier csv.

        * Functia recommendations genereaza recomandari pe baza unei teme
        placute de utilizator. Functia incepe prin citirea matricei din
        fisierul csv si prelucrarea acesteia pentru a elimina temele cu un
        numar de review-uri mai mic decat min_reviews, folosind functia
        preprocess. Apoi, se descompune matricea prelucrata folosind
        metoda SVD. Se extrage vectorul corespunzator temei placute de
        utilizator. Se calculeaza similaritatea cosinus intre vectorul
        temei placute si fiecare linie din matricea V. Se sorteaza
        similaritatile in ordine descrescatoare si se extrag primele
        num_recoms teme, excluzand tema placuta de utilizator.
        La final, functia returneaza vectorul `recoms` cu temele recomandate.