function H = householder(PPont, PKep)
    % Householder reflektor mátrix kiszámítása, ami tükrözi a PPont-ot a PKep felé
    if length(PPont) ~= length(PKep)
        error('A pontoknak azonos dimenzióval kell rendelkeznie!');
    end

    % Pontok közötti különbség vektor
    pontKepKulonbsegVektor = PKep - PPont;

    % Előjel meghatározása a tükörvektor felépítéséhez
    elojel = -sign(pontKepKulonbsegVektor(1));

    % Tükrözési vektor kiszámítása
    tukrozes = pontKepKulonbsegVektor + elojel * [1; zeros(length(PPont) - 1, 1)];

    % Tükrözési vektor normalizálása
    tukrozes = tukrozes / norm(tukrozes);

    % Householder mátrix képlet szerint
    H = eye(length(PPont)) - 2 * (tukrozes * tukrozes');
end

