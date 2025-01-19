function [Q,R] = hhalg(A)
    % Householder algoritmus a QR felbontásra

    [sor, oszlop] = size(A); % Mátrix méretének lekérdezése (sorok és oszlopok)

    % Ellenőrzés: négyzetes mátrix szükséges
    if (sor ~= oszlop)
        error("A megadott mátrixnak kötelezően négyzetes mátrixnak kell lennie!");
    end

    % Ellenőrzés: teljes oszloprang
    if rank(A) ~= size(A, 2)
        error("A mátrix nem teljes oszloprangú!");
    end

    % Householder reflektor számítása az első oszlopra
    EgysegMatrix = eye(sor); % Egységmátrix létrehozása
    a = A(:,1); % Első oszlop kiválasztása
    b = zeros(sor,1); % Inicializált vektor
    b(1) = norm(a,2); % e1 irányú vektor normájának beállítása

    % Householder vektor kiszámítása
    v = (a - b) / norm(a - b, 2);

    % Householder mátrix létrehozása
    house = EgysegMatrix - 2 * (v * v') / (v' * v);
    
    % Q mátrix (ortogonális mátrix)
    Q = house;
    
    % R mátrix kiszámítása
    R = Q' * A;

    % Mátrixok megjelenítése
    fprintf('Megadott mátrix:\n');
    disp(A);
    
    fprintf('Mátrix Q felbontása:\n');
    disp(Q);
    
    fprintf('Mátrix R felbontása:\n');
    disp(R);
    
    fprintf('Mátrix QR szorzata:\n');
    disp(Q * R); % Helyes mátrixszorzás a QR ellenőrzéséhez
end
