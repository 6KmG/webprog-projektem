function csucsok = affin3(S, P, Q)
    % affin3 - Bónusz feladat megoldása
    %
    % Bemeneti paraméterek:
    %   S - A háromszög súlypontjának koordinátái [x, y]
    %   P - Az egyik oldal egy pontjának koordinátái [x, y]
    %   Q - Egy másik oldal egy pontjának koordinátái [x, y]
    %
    % Visszatérési érték:
    %   csucsok - A háromszög csúcsainak koordinátái egy 3x2-es mátrixban
    %
    % Használat: affin3([3, 3], [2, 3], [4, 2])
    % Vagy grafikus megadás: affin3()

    if nargin == 0
        % Grafikus megadás lehetősége
        fprintf('Rajzold meg a háromszög súlypontját (S):\n');
        figure;
        axis([0, 10, 0, 10]);
        grid on;
        hold on;

        S = ginput(1); % Súlypont kijelölése
        plot(S(1), S(2), 'ro', 'MarkerSize', 10, 'DisplayName', 'Súlypont (S)');
        legend;

        fprintf('Rajzold meg az egyik pontot (P):\n');
        P = ginput(1); % Első pont kijelölése
        plot(P(1), P(2), 'bo', 'MarkerSize', 10, 'DisplayName', 'Pont (P)');
        legend;

        fprintf('Rajzold meg a másik pontot (Q):\n');
        Q = ginput(1); % Második pont kijelölése
        plot(Q(1), Q(2), 'go', 'MarkerSize', 10, 'DisplayName', 'Pont (Q)');
        legend;
    end

    % A háromszög csúcsainak meghatározása
    % Kiszámítjuk a harmadik csúcsot, mert a súlypont az oldalak középértékét adja:
    % Súlypont képlete: S = (A + B + C) / 3
    % Ez alapján:
    % C = 3*S - P - Q
    C = 3 * S - P - Q;

    % A háromszög csúcsainak mátrixa
    csucsok = [P; Q; C];

    % Háromszög kirajzolása
    line([P(1) Q(1)], [P(2) Q(2)], 'Color', 'b', 'LineStyle', '-'); % PQ él
    line([Q(1) C(1)], [Q(2) C(2)], 'Color', 'b', 'LineStyle', '-'); % QC él
    line([C(1) P(1)], [C(2) P(2)], 'Color', 'b', 'LineStyle', '-'); % CP él
    plot(C(1), C(2), 'mo', 'MarkerSize', 10, 'DisplayName', 'Csúcs (C)');
    legend;

    % Csúcsok kiírása
    fprintf('A háromszög csúcsainak koordinátái:\n');
    disp(csucsok);
end

% csucsok = affin3([3, 3], [2, 3], [4, 2])
% A háromszög csúcsainak koordinátái:
% 2.0000    3.0000
% 4.0000    2.0000
% 3.0000    4.0000
