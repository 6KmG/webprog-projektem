function matrixInverz = gaussel3(inputMatrix)
    [sor, oszlop] = size(inputMatrix);
    if sor ~= oszlop
        error("Inverze kizárólag négyzetes mátrixnak van!");
    end
    if rank(inputMatrix) ~= size(inputMatrix, 1)
        error("Nem invertálható mert a mátrix oszlopvektorai nem lineárisan függetlenek!")
    end
    if (sor == 2 && oszlop == 2)
        matrixInverz = [-inputMatrix(2,2), inputMatrix(1,2);inputMatrix(2,1),-inputMatrix(1,1);];
        return
    end
    
    kibovitettMatrix = [inputMatrix, eye(sor)]; %Összeillesztjük a mátrixot és az egysgémátrixot.
    
    for ii = 1:sor
        pivot = kibovitettMatrix(ii, ii); %Baloldali mátrix átlói a pivot elemek
        kibovitettMatrix(ii, :) = kibovitettMatrix(ii, :) / pivot;
        for jj = 1:sor
            if ii ~= jj
                factor = kibovitettMatrix(jj, ii);
                kibovitettMatrix(jj, :) = kibovitettMatrix(jj, :) - factor * kibovitettMatrix(ii, :);
            end
        end
    end
    
    matrixInverz = kibovitettMatrix(:, oszlop+1:end); %Az inverz a kibővített mátrix jobb oldala.
    
    %Alternatív megoldás
    %megoldas = inv(inputMatrix);
    end