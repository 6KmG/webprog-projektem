function gaussElimMegoldas = gaussel2(A, B, reszlegesKivalasztas, KozbulsoMatrixEngedelyezett)
    [sor, oszlop] = size(A);
    %
    if sor ~= oszlop
        error("Kizárólag a négyzetes mátrixnak engedélyezett!");
    end
    %
    if reszlegesKivalasztas == 1
        %A legnagyobb elemet tartalmazó sor cseréljen helyet az első sorral.
        %Figyeljük meg, hogy van-e az átlóban 0 elem, és ez esetben teljes
        %pivotolást végzünk.
        %minden megy, ahogyan korábban.
        for II = 1:sor-1
            for JJ=II+1:sor
                if (A(II,II) == 0)
                    warning("A főátlóban szereplő nulla megakadályozza a részleges pivotolási megoldást!");
                    warning("tovább haladunk teljes pivotolásra!");
                    gaussElimMegoldas = TeljesPivot(A,B,KozbulsoMatrixEngedelyezett);
                    return;
                end
                if abs(A(JJ,II)) > 0
                    %Kizárólag akkor osztunk, ha nem nulla!
                    %Pivot oszlopának kinullázása.
                    pivotFaktor=A(II,II)/A(JJ,II);
                    A(JJ,:) = pivotFaktor*A(JJ,:)-A(II,:);
                end
                if (KozbulsoMatrixEngedelyezett == 1)
                    disp(A);
                end
            end
        end
        fprintf("Az részleges pivotolás által megoldott mátrix:\n");
        disp(A);
        gaussElimMegoldas = A .* B;
    else
        gaussElimMegoldas = TeljesPivot(A,B, KozbulsoMatrixEngedelyezett);
    end
    end
    
    function foelem = TeljesPivot(AA, BB, kiiratas)
    matrixMeret = max(size(AA));
    %
    foelem = [AA, transpose(BB)]; %Összeragasztott mátrix
    %
    for k=1:matrixMeret
        % Sor- és oszlopcsere engedélyezett
        [maximumOszlopIndex, maximumSorIndex] = max(abs(foelem(k:matrixMeret,k)));
        [~, colindex] = max(maximumOszlopIndex);
        sorindex = maximumSorIndex(1);
        oszlopindex = colindex(1);
    
        if sorindex > k %Sorcsere
            kijeloltSor = foelem(sorindex,:); %legnagyobb sor
            kijeloltSor1 = foelem(k,:); %Aktuál sor
            %
            eredetiMatrixLegnagyobbSor = AA(sorindex,:);
            eredetiMatrixLegkisebbSor = AA(k,:);
            %
            AA(sorindex,:) = eredetiMatrixLegkisebbSor; %
            AA(k,:) = eredetiMatrixLegnagyobbSor;
            %
            foelem(k,:) = kijeloltSor;
            foelem(sorindex,:) = kijeloltSor1;
            fprintf('A(z) %d. és %d. sor cseréje:\n', k, sorindex);
        end
    
        if oszlopindex > k %oszlopcsere
            oszlop = foelem(:,oszlopindex);
            foelem(:,oszlopindex) = foelem(:,k);
            foelem(:,k) = oszlop;
        end
        if sorindex > k && oszlopindex == k %Csak sor csere
            fprintf('A(z) %d. és %d. sor cseréje:\n',k,sorindex);
            disp(foelem);
        elseif  sorindex == k && oszlopindex > k %Csak oszlop csere 
            fprintf('A(z) %d. és %d. oszlop cseréje:\n',k,oszlopindex);
            disp(foelem);
        elseif  sorindex > k && oszlopindex > k %Sor és oszlop csere
            fprintf('A(z) %d. és %d. sor, %d. és %d. oszlop cseréje:\n',k,sorindex,k,oszlopindex);
            disp(foelem);
        end
        for II = 1:matrixMeret-1
            for JJ=II+1:matrixMeret
                if (foelem(II,II) == 0)
                    error("Nem végezhető el a Gauss elimináció!");
                end
                if abs(foelem(JJ,II)) > 0
                    %Kizárólag akkor osztunk, ha nem nulla!
                    %Pivot oszlopának kinullázása.
                    pivotFaktor=foelem(II,II)/foelem(JJ,II);
                    foelem(JJ,:) = pivotFaktor*foelem(JJ,:)-foelem(II,:);
                end
                if (kiiratas == 1)
                    disp(foelem);
                end
            end
        end
    end
    % Visszahelyettesítés, eredményvektor
    foelem = zeros(matrixMeret,1);
    
    % Visszafelé haladunk a LER soraiban n-1-edik sortól 1.-ig
    for k=matrixMeret-1👎1
        foelem(k)=AA(k,matrixMeret);
        for j=k+1:matrixMeret
            foelem(k)=foelem(k)-AA(k,j)*foelem(j);
        end
        foelem(k)=foelem(k)/AA(k,k);
    end
    end