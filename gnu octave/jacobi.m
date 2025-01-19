function x = Jacobi(A, b, maximumIteracio, hibaKuszob)
    format rat;
    [sor, oszlop] = size(A);
    
    if (sor ~= oszlop)
        error("Kizárólag négyzetes mátrix fogadható el!");
    end
    
    %A=L+D+U
    L = tril(A,-1); %Átló alatti
    D = diag(diag(A)); %Átló
    U = triu(A,1); %Átló feletti elemek
    %
    LU=L+U;
    %
    DInverz = inv(D);
    %Ax=b
    %(L+D+U)x=b
    B = -DInverz * (LU);
    c = DInverz .* b;
    %
    fprintf('Bj mátrix:\n');
    disp(B);
    fprintf('cj:\n');
    disp(c);
    %A konvergencia elégséges feltétele a következő:
    %A leképezés kontrakció, ha
    % az 1-es norma kisebb, mint 1, vagy
    % a végtelenes norma kisebb mint 1, vagy
    % a frobenius norma kisebb mint 1
    %
    if (norm(B,1) < 1 || norm(B,Inf) < 1 || norm(B,"fro") < 1)
        fprintf("A leképezés egy kontrakció, vagyis alkalmazható a fixpont tétel!");
    else %Szükséges és elégséges feltétel vizsgálata
        sajatErtekMatrix = eig(B);
        spektralSugar = max(abs(sajatErtekMatrix));
        if spektralSugar < 1
            fprintf("Szükséges, illetve elégséges feltétel teljesülése miatt konvergál minden x0 esetén!\n");
        end
    end
    x = zeros(sor,1);
    for II=1:maximumIteracio
        elozoX = x;
        %
        x = B .* elozoX + DInverz .* b;
        if norm(x - elozoX, inf) < hibaKuszob
            fprintf('A Jacobi iteráció konvergált %d lépésben.\n', II);
            return;
        end
    end
    
    end