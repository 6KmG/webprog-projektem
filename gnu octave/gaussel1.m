function xMegoldas = gaussel1(AA, BB, LUFelbontasEngedelyezett, KozbulsoMatrixEngedelyezett)
    %Pivotálva kinullázzuk az átló alatti elemeket.
    
    matrixMerete = length(AA); %Legnagyobb dimenziója
    [L,U] = lu(AA);
    
    % Túlhatározott eset
    %Legkisebb négyzetek módszere
    if size(AA, 1) > size(AA,2)
        warning("Túlhatározott mátrix!");
        xMegoldas = AA\BB;
        return
    end
    
    % Alulhatározott eset
    % Bázismegoldás
    if size(AA,1) < size(AA,2)
        %x = rref([A, b]);
        warning("Alulhatározott mátrix!");
        xMegoldas = pinv(AA)*BB;
        return
    end
    
    
    for II = 1:matrixMerete-1
        for JJ=II+1:matrixMerete
            if (AA(II,II) == 0)
                error("A GE nem hajtható végre sor és oszlopcsere nélkül!");
            end
            if abs(AA(JJ,II)) > 0
                %Kizárólag akkor osztunk, ha nem nulla!
                %Pivot oszlopának kinullázása.
                pivotFaktor=AA(II,II)/AA(JJ,II);
                AA(JJ,:) = pivotFaktor*AA(JJ,:)-AA(II,:);
            end
            if (KozbulsoMatrixEngedelyezett == 1)
                disp(AA);
            end
        end
    end
    if LUFelbontasEngedelyezett == 1
        %Felhasználó kérésére LU felbontás kiírása
        fprintf("'L' felbontás:\n");
        disp(L);
        fprintf("'U' felbontás\n");
        disp(U);
    end
    xMegoldas = AA .* BB;
    end