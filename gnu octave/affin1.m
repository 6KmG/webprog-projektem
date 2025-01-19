function transzMat = affin1(a1, a2)
    %
    % Az Affin transzformációs mátrix létrehozására szolgáló függvény.
    % Az Affin transzformáció általános mátrixformája:
    % | a  c |
    % | b  d |
    %
    % A bemeneti paraméterek:
    % - a1: az első oszlop (a és b) értékei
    % - a2: a második oszlop (c és d) értékei
    %
    % Használat teszteléshez: affin1([1, 2], [3, 4])

    switch nargin
        case 2 % Ha két paramétert adnak meg (paraméterezett megadás)
            transzMat = zeros(2); % Inicializálunk egy 2x2-es nullmátrixot
            % Kitöltjük a mátrixot az a1 és a2 értékeivel
            transzMat(1,1) = a1(1); % a érték
            transzMat(1,2) = a2(1); % c érték
            transzMat(2,1) = a1(2); % b érték
            transzMat(2,2) = a2(2); % d érték
        case 0 % Ha nem adnak meg paramétereket (manuális értékadás)
            % Koordináta-rendszer kirajzolása
            line([-10,10],[0,0]); % X tengely
            line([0,0],[-10,10]); % Y tengely

            % Két pont manuális kijelölése az ábrán
            [x,y] = ginput(2); % Két pont kiválasztása egérrel
            % Az Affin mátrix értékeinek beállítása a kiválasztott pontok alapján
            transzMat(1,1) = x(1); % Az első pont x koordinátája
            transzMat(2,1) = y(1); % Az első pont y koordinátája
            transzMat(1,2) = x(2); % A második pont x koordinátája
            transzMat(2,2) = y(2); % A második pont y koordinátája
        otherwise % Hibakezelés, ha a paraméterek száma nem megfelelő
            error("Hiba! Csak két paramétert vagy semmit sem vár a függvény.");
    end
end
