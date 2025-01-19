function gyok = hurm(fuggveny, a, b, lepes, abraEngedekyezve)
    % Ellenőrzés: Az intervallum megfelelő-e? Bolzano-tétel alapján szükséges különböző előjelű f(a) és f(b)
    if fuggveny(a) * fuggveny(b) > 0
        error('Az intervallum nem megfelelő. A függvényértékeknek különböző előjelekkel kell rendelkezniük az intervallum végpontjainál.');
    end

    % Húrmódszer iterációk
    for II = 1:lepes
        % A húr középpontjának kiszámítása
        c = (a * fuggveny(b) - b * fuggveny(a)) / (fuggveny(b) - fuggveny(a));

        % Ha a közelítés pontos, azaz f(c) = 0, visszatérünk a gyökkel
        if fuggveny(c) == 0
            gyok = c;
            return;
        end

        % Az új intervallum kiválasztása
        if fuggveny(c) * fuggveny(a) < 0
            b = c;
        else
            a = c;
        end
    end

    % A közelített gyök az utolsó középpont lesz
    gyok = c;

    % Ha grafikon megjelenítés engedélyezett, ábrázoljuk a függvényt
    if abraEngedekyezve == 1
        figure;
        fplot(fuggveny, 'LineWidth', 2);
        hold on;
        plot(gyok, fuggveny(gyok), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
        title('Húrmódszerrel keresett gyök');
        xlabel('x');
        ylabel('f(x)');
        grid on;
        legend('Függvény', 'Közelített gyök');
    end
end
