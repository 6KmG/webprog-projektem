function altalanosInverz = geninv(A)
    % geninv - Általános mátrixinverz számítása a mátrix típusától függően.
    %
    % Bemenet:
    %   A - Az invertálni kívánt mátrix.
    %
    % Kimenet:
    %   altalanosInverz - A mátrix általános inverze.
    
    % Ellenőrizzük, hogy a mátrix teljes rangú-e.
    if (rank(A) == min(size(A))) % Teljesrangú mátrix.
        % Négyzetes mátrix esetén klasszikus inverz.
        if size(A,1) == size(A,2)
            altalanosInverz = inv(A);
        elseif size(A,1) > size(A,2) % Túlhatározott mátrix: sor > oszlop.
            altalanosInverz = (A'*A) \ A'; % inv(A'*A)*A' gyorsabb formája.
        else % Alulhatározott mátrix: oszlop > sor.
            altalanosInverz = A' / (A*A'); % A'*inv(A*A').
        end
    else
        % Nem teljes rangú mátrix esetén pszeudo-inverz.
        altalanosInverz = pinv(A);
    end
    
    end
    