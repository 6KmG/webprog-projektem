function result = numint(fn, interval, precision, method)
    % numint - Numerikus integrálás megadott módszerrel.
    %
    % Bemenet:
    %   fn        - A függvény string formában (példa: 'x^2').
    %   interval  - Az integrálás intervalluma, két elemű vektor [a, b].
    %   precision - Az osztáspontok száma (minél nagyobb, annál pontosabb).
    %   method    - Az integrálási módszer: 'simpson', 'trapezoid', 'rectangle'.
    %
    % Kimenet:
    %   result - Az integrál közelítő értéke.
    
        % Ellenőrizzük, hogy az intervallum két elemű.
        if length(interval) ~= 2
            error("interval error: Az intervallumnak pontosan két eleműnek kell lennie.");
        end
    
        % Ellenőrizzük, hogy a precizitás nem negatív.
        if precision < 0
            error("precision error: A precizitás nem lehet negatív.");
        end
    
        % Belső függvény az fn kiértékelésére adott x pontokon.
        function val = subst(fn, x)
            % Az fn stringet "y" változóvá alakítjuk kiértékeléshez.
            fn = ["y=" fn ";"];
            eval(fn); % A string értékelése.
            val = y; % Kiértékelt eredmény.
        end
    
        % Az intervallum egyenletes osztása a megadott pontok számával.
        domain = linspace(interval(1), interval(2), precision);
    
        sum = 0; % Az integrál összege.
        span = abs(domain(1) - domain(2)); % Egy szakasz hossza.
    
        % Simpson-módszer.
        if method == "simpson"
            for i = 2:length(domain)
                x1 = domain(i-1);
                x2 = domain(i);
                xh = (x1 + x2) / 2; % Középpont.
                % A Simpson-szabály alkalmazása.
                sum += (span / 6) * (subst(fn, x1) + (4 * subst(fn, xh)) + subst(fn, x2));
            end
            result = sum; % Végső eredmény.
            return;
        end
    
        % Trapéz-módszer.
        if method == "trapezoid"
            for i = 2:length(domain)
                x1 = domain(i-1);
                x2 = domain(i);
                % Trapézok területének összege.
                sum += span * ((subst(fn, x1) + subst(fn, x2)) / 2);
            end
            result = sum; % Végső eredmény.
            return;
        end
    
        % Téglalap-módszer.
        if method == "rectangle"
            for i = 1:length(domain)
                % Téglalap területének számítása.
                sum += subst(fn, domain(i)) * span;
            end
            result = sum; % Végső eredmény.
            return;
        end
    
        % Hibakezelés ismeretlen módszer esetén.
        error("method error: Ismeretlen integrálási módszer.");
    end
    