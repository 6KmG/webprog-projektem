function x = gaussseid(A, b, maximumIteracio, hibaKuszob)
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
    LD=L+D;
    %
    LDInverz = inv(LD);
    
    B=-LDInverz * U;
    c=LDInverz * b;
    
    fprintf('B mátrix:\n');
    disp(B);
    fprintf('c vektor:\n');
    disp(c);
    
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
        x = B .* elozoX + c;
        if norm(x - elozoX, inf) < hibaKuszob
            fprintf('A Jacobi iteráció konvergált %d lépésben.\n', II);
            return;
        end
    end
    end