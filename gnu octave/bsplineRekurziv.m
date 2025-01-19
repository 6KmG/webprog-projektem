function result = bsplineRekurziv(fokszam, index, csomopontok, x)
    % Recursive evaluation of a B-spline basis function.
    % fokszam      - Degree of the B-spline.
    % index        - Index of the basis function.
    % csomopontok  - Knot vector (csomópontok).
    % x            - Evaluation point in the interval.
    %
    % Returns:
    % result - Value of the B-spline basis function at the given location.
    
    if fokszam == 0
        % Alap eset: 0. fokszámú B-spline
        if x >= csomopontok(index) && x < csomopontok(index + 1)
            result = 1;
        else
            result = 0;
        end
    else
        % Rekurzív eset: fokszám > 0
        % Első tag
        if (csomopontok(index + fokszam) - csomopontok(index)) ~= 0
            tag1 = ((x - csomopontok(index)) / (csomopontok(index + fokszam) - csomopontok(index))) * ...
                   bsplineRekurziv(fokszam - 1, index, csomopontok, x);
        else
            tag1 = 0;
        end
    
        % Második tag
        if (csomopontok(index + fokszam + 1) - csomopontok(index + 1)) ~= 0
            tag2 = ((csomopontok(index + fokszam + 1) - x) / (csomopontok(index + fokszam + 1) - csomopontok(index + 1))) * ...
                   bsplineRekurziv(fokszam - 1, index + 1, csomopontok, x);
        else
            tag2 = 0;
        end
    
        % Összegzés
        result = tag1 + tag2;
    end
end
    