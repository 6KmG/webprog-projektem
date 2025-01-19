function gyok = intfel(fuggveny, a, b, epszilon)
    % Ellenőrzés: A Bolzano-tétel szerint, ha f(a) * f(b) > 0, akkor nem biztosított a gyök létezése az adott intervallumban.
    if fuggveny(a) * fuggveny(b) > 0
        error('Az intervallum nem megfelelő. A függvényértékeknek különböző előjelekkel kell rendelkezniük az intervallum végpontjainál.');
    end

    % Ha az epszilon egész szám, akkor azt lépésszámként használjuk.
    if (isinteger(epszilon)) 
        lepes = epszilon;
        for II = 1:lepes
            % Az intervallum felezése: új középpont kiszámítása
            c = (a + b) / 2;
    
            % Ha megtaláltuk a gyököt, azaz f(c) = 0, visszatérünk
            if fuggveny(c) == 0
                gyok = c;
                return;
            end
    
            % Az új intervallum kiválasztása a jelnélküliségi szabály alapján
            if fuggveny(c) * fuggveny(a) < 0
                b = c;
            else
                a = c;
            end
        end

    else 
        % Ha az epszilon egy tolerancia, addig ismételjük, amíg az intervallum hossza nagyobb az epszilon értéknél.
        while (b - a) / 2 > epszilon
            % Intervallum felezése: új középpont kiszámítása
            c = (a + b) / 2;
    
            % Ha megtaláltuk a gyököt, visszatérünk
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
    end

    % A közelített gyök az intervallum közepén lévő pont lesz
    gyok = (a + b) / 2;
end
