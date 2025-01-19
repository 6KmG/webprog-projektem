function gyok = newt(fuggveny, x0, lepes)
    syms x; % Szimbolikus változó létrehozása

    % A függvény és deriváltjának definiálása szimbolikusan
    szimbolikusFuggveny = str2sym(fuggveny);

    % Kezdőérték beállítása
    x = x0;
    for k = 1:lepes
        % Newton-Raphson formula: x = x - f(x) / f'(x)
        x = x - subs(szimbolikusFuggveny, x) / subs(diff(szimbolikusFuggveny, x), x);
    end

    % A megközelített gyök visszaadása
    gyok = x;
end
