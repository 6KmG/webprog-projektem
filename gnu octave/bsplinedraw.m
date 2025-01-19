function bsplinedraw(indexek)
    % Visualize B-Spline basis functions for a given set of indices.
    % indexek - indices of the B-spline basis functions to be plotted.
    %
    % Example:
    % bsplinedraw([1 2 3 4])
    
    % Paraméterek
    fokszam = 3; % A B-spline fokszáma
    csomopontok = linspace(0, 1 + fokszam, length(indexek) + fokszam + 1); % Csomópontok generálása
    interval = linspace(0, 1, 100); % Kiértékelési intervallum
    
    % Tároló a B-spline függvények számára
    bSplineFuggveny = zeros(length(indexek), length(interval));
    
    % B-spline függvények kiszámítása
    for II = 1:length(indexek)
        for JJ = 1:length(interval)
            bSplineFuggveny(II, JJ) = bsplineRekurziv(fokszam, indexek(II), csomopontok, interval(JJ));
        end
    end
    
    % Bspline függvények kirajzolása
    figure;
    hold on;
    for II = 1:length(indexek)
        plot(interval, bSplineFuggveny(II, :), 'LineWidth', 2, 'DisplayName', sprintf('Index %d', indexek(II)));
    end
    title('B-Spline');
    xlabel('Interval');
    ylabel('B-Spline Value');
    legend('show'); % Legenda a grafikonhoz
    grid on;
    hold off;
    
    end
    