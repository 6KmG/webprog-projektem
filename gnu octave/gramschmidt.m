function QR = gramschmidt(A)
    % A = Q * R
    % Mivel Q ortonormált mátrix, ezért R = Q(T) * A
    [sor, oszlop] = size(A); % Mátrix méretének lekérdezése (sorok és oszlopok)

    % Ellenőrzés: csak négyzetes mátrixok megengedettek
    if sor ~= oszlop
        error('Kizárólag négyzetes mátrixok vannak engedélyezve!')
    end

    % Ellenőrzés: a mátrixnak teljes oszloprangúnak kell lennie
    if rank(A) ~= size(A, 2)
        error('A Mátrix nem teljes oszloprangú!')
    end

    % Q mátrix inicializálása nullákkal
    Q = zeros(sor,oszlop);
    % U mátrix inicializálása a vektorok ortogonalizálásához
    U = zeros(sor,oszlop);

    % Első oszlopvonal ortogonalizálása
    U(:,1) = A(:,1);
    Q(:,1) = U(:,1) ./ norm(U(:,1),2); % Normalizálás

    % Gram-Schmidt eljárás: minden oszlophoz kiszámoljuk az ortonormált vektorokat
    for II = 2:sor
        % Kivonandó elem (projekciós részek összegzése)
        kivonandoElem = zeros(oszlop, 1);
        for JJ = 1:II-1
            % Oszlopok vetítése az előző vektorokra
            kivonandoElem = kivonandoElem + Projection(A(:,II),U(:,JJ));
        end
        % Az ortogonális rész kiszámítása
        U(:,II) = A(:,II) - kivonandoElem;
        % Normalizálás és az új Q oszlop
        Q(:,II) = U(:,II) / norm(U(:,II),2);
    end

    % R mátrix kiszámítása Q^T * A képlettel
    R = transpose(Q) * A;

    % Mátrixok megjelenítése
    fprintf('Q mátrix:\n');
    disp(Q);
    
    fprintf('R mátrix:\n');
    disp(R);
    
    % Helyes mátrixszorzás helyett itt tévesen elemenkénti szorzás van:
    QR = Q * R; % Ez a sor javítva lett a helyes mátrixszorzással
end

% Segédfüggvény a vektorok vetítéséhez
function proj = Projection(a,u)
    % Vetítés kiszámítása az u vektorra
    proj = (dot(u,a)/dot(u,u)) * u;
end



