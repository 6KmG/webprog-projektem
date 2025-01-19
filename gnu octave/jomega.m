function x = jomega(A)
    [sor, oszlop] = size(A);
    
    if (sor ~= oszlop)
        error("Kizárólag négyzetes mátrix fogadható el!");
    end
    
    %A=L+D+U
    L = tril(A,-1); %Átló alatti
    D = diag(diag(A)); %Átló
    U = triu(A,1); %Átló feletti elemek
    
    DInverz = inv(D);
    LU = L + U;
    egysegMatrix = eye(sor);
    
    omegaErtek = sym("w");
    
    % Átmenet mátrixok meghatározása
    BJ1 = -DInverz*LU; %J(1)
    BJOmega = (1 - omegaErtek) * egysegMatrix - omegaErtek * BJ1; %J(omega)
    
    %Szükséges és elégséges feltételhez írjuk fel a Bj(omega) sajátértékeihez
    %tartozó karakterisztikus polinomot.
    sajatErtek = eig(BJOmega);
    %
    spektralSugar = max(abs(sajatErtek));
    %
    %if (spektralSugar < 1)
    %    fprintf("Az iteráció konvergens.");
    %end
    
    hold on;
    ylim([0, Inf])
    % Sajátértékek abszolútértékének ábrázolása
    fplot(abs(sajatErtek(1)));
    fplot(abs(sajatErtek(2)));
    fplot(abs(sajatErtek(3)));
    fplot(spektralSugar, 'Color', 'g', 'LineWidth', 1.5);
    yline(1, 'Color', 'b')
    
    legend('\lambda_1(\omega)', '\lambda_2(\omega)', '\lambda_3(\omega)', '\omega_{B_{JO}}', 'y=1');
    
    
    end