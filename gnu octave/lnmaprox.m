function approxPolinom = lnmaprox(polinomFokszam, csomopontokX, csomopontokY, grafikon)
    % lnmaprox - Polinom közelítést készít adott pontokra a legkisebb négyzetek módszerével.
    % 
    % Bemeneti paraméterek:
    %   polinomFokszam - A közelítő polinom foka.
    %   csomopontokX   - Az x tengely értékei (vektor).
    %   csomopontokY   - Az y tengely értékei (vektor).
    %   grafikon       - 1, ha grafikont szeretnénk, 0, ha nem.
    %
    % Kimenet:
    %   approxPolinom - A csomópontokra számított közelítő polinom értékei.
    
    % Ellenőrizzük, hogy az X és Y pontok száma megegyezik.
    if (numel(csomopontokX) ~= numel(csomopontokY))
        error("A csomopontok x és y vektorok elemeinek azonos méretűnek kell lennie.");
    end
    
    % Polinom együtthatóinak meghatározása.
    egyutthatok = polyfit(csomopontokX, csomopontokY, polinomFokszam);
    
    % Kiszámítjuk a közelítő polinom értékeit az adott csomópontoknál.
    approxPolinom = polyval(egyutthatok, csomopontokX);
    
    % Ha szükséges, a grafikont is megjelenítjük.
    if grafikon == 1
        figure; % Új ablak nyitása.
        plot(csomopontokX, csomopontokY, 'bo', 'MarkerSize', 10); % Eredeti pontok.
        hold on;
        plot(csomopontokX, approxPolinom, 'r-', 'LineWidth', 2); % Közelítő polinom.
        xlabel('X tengely');
        ylabel('Y tengely');
        title('Legkisebb négyzetek módszerével közelített polinom');
        grid on;
        hold off;
    end
    
    end
    