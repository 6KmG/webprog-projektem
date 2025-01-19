function hhgraph()
    % Householder tükrözés vizuális megjelenítése

    figure;
    axis([-5 5 -5 5]); % Grafikon tengelyek határértékei
    grid on; % Rács megjelenítése
    hold on;
    title('Válassz egy P pontot!'); % Cím megjelenítése

    % P pont kiválasztása egérkattintással
    [xPont, yPont] = ginput(1);
    Pont = [xPont; yPont];
    plot(Pont(1), Pont(2), 'ro', 'MarkerSize', 10, 'DisplayName', 'P');

    % P pont képének kiválasztása
    title('Válaszd ki a kép pontját!');
    [xPontKepe, yPontKepe] = ginput(1);
    pKepe = [xPontKepe; yPontKepe];
    plot(pKepe(1), pKepe(2), 'bo', 'MarkerSize', 10, 'DisplayName', 'P''');

    % Householder mátrix kiszámítása a kiválasztott pontokra
    HouseholderMatrix = householder(Pont, pKepe);

    % Az eltolás kiszámítása
    pTranzformacio = HouseholderMatrix * Pont;
    plot(pTranzformacio(1), pTranzformacio(2), 'go', 'MarkerSize', 10, 'DisplayName', 'Tükrözött P');

    % Vonal rajzolása P és P' között
    line([Pont(1) pKepe(1)], [Pont(2) pKepe(2)], 'Color', 'k', 'LineStyle', '--', 'DisplayName', 'Hipersík');

    % Jelmagyarázat megjelenítése
    legend show;
    hold off;
end