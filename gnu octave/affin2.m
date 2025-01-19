function transzMat = affin2(a,b,c,A,B,C)
    %
    % Ez a függvény egy háromszög Affin transzformációját számítja ki.
    % Képes megjeleníteni az eredeti és transzformált háromszöget is.
    %
    % Bemeneti paraméterek:
    % - a, b, c: az eredeti háromszög csúcsai
    % - A, B, C: a transzformált háromszög csúcsai
    %
    % Használat teszteléshez: affin2([10, 30], [15, 40], [20, 30], [30, 30], [40, 60], [50, 30])

    switch nargin
        case 6 % Ha minden csúcs koordinátáját megadják
            % Beállítjuk a koordináta-rendszert
            axis([0,100,0,100]);
            hold on;
            grid on;

            % Eredeti háromszög kirajzolása
            line([a(1) b(1)],[a(2) b(2)],'Marker','.','LineStyle','-'); % a-b él
            line([c(1) b(1)],[c(2) b(2)],'Marker','.','LineStyle','-'); % b-c él
            line([c(1) a(1)],[c(2) a(2)],'Marker','.','LineStyle','-'); % c-a él

            % Transzformált háromszög kirajzolása
            line([A(1) B(1)],[A(2) B(2)],'Marker','.','LineStyle','-'); % A-B él
            line([C(1) B(1)],[C(2) B(2)],'Marker','.','LineStyle','-'); % B-C él
            line([C(1) A(1)],[C(2) A(2)],'Marker','.','LineStyle','-'); % C-A él
        case 0 % Ha nem adnak meg paramétereket (manuális megadás)
            axis([0,100,0,100]);
            hold on;
            grid on;

            % Az eredeti háromszög csúcsainak megadása egérrel
            fprintf('Rajzold meg az eredeti háromszöget:\n');
            a = ginput(1); % Első csúcs
            plot(a(1),a(2),'o');
            b = ginput(1); % Második csúcs
            plot(b(1),b(2),'o');
            c = ginput(1); % Harmadik csúcs
            plot(c(1),c(2),'o');

            % Eredeti háromszög kirajzolása
            line([a(1) b(1)],[a(2) b(2)],'Marker','.','LineStyle','-');
            line([c(1) b(1)],[c(2) b(2)],'Marker','.','LineStyle','-');
            line([c(1) a(1)],[c(2) a(2)],'Marker','.','LineStyle','-');

            % A transzformált háromszög csúcsainak megadása egérrel
            fprintf('Rajzold meg a transzformált háromszöget:\n');
            A = ginput(1); % Első csúcs
            plot(A(1),A(2),'o');
            B = ginput(1); % Második csúcs
            plot(B(1),B(2),'o');
            C = ginput(1); % Harmadik csúcs
            plot(C(1),C(2),'o');

            % Transzformált háromszög kirajzolása
            line([A(1) B(1)],[A(2) B(2)],'Marker','.','LineStyle','-');
            line([C(1) B(1)],[C(2) B(2)],'Marker','.','LineStyle','-');
            line([C(1) A(1)],[C(2) A(2)],'Marker','.','LineStyle','-');
        otherwise % Hibakezelés, ha a paraméterek száma nem megfelelő
            error("Hiba! Vagy hat paramétert, vagy semmit sem vár a függvény!");
    end

    % Kibővítjük a csúcsok koordinátáit homogén koordinátákká
    a = [a 1];
    b = [b 1];
    c = [c 1];

    A = [A 1];
    B = [B 1];
    C = [C 1];

    % Az Affin transzformációs mátrix kiszámítása
    transzMat = [a', b', c']/[A', B', C'];
end
