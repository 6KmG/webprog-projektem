function lag = lagrangeip(alappontok, y, graf)
    % Lagrange interpolation to approximate a polynomial from given points.
    % alappontok - x-coordinates of the given points.
    % y          - y-coordinates of the given points.
    % graf       - if 1, the function plots the results; otherwise, no plot.
    %
    % Example:
    % lagrangeip([1, 4, 9], [1, 2, 3], 1)
    
    meret = length(alappontok);
    
    % Ensure the number of x and y points match
    if (meret ~= length(y))
        error("Hiba! A függvény x és y koordinátáinak száma nem eggyezik!");
    end
    
    % Symbolic variable for the polynomial expression
    syms X;
    
    % Initialize the polynomial
    polinom = 0;
    
    % Compute the Lagrange polynomial
    for II = 1:meret
        lk = 1; % Initialize the Lagrange basis polynomial
        for JJ = 1:meret
            if II ~= JJ
                % Multiply terms to compute the basis polynomial
                lk = lk * (X - alappontok(JJ)) / (alappontok(II) - alappontok(JJ));
            end
        end
        % Add the term to the total polynomial
        polinom = polinom + y(II) * lk;
    end
    
    % Simplify the resulting polynomial
    lag = simplify(polinom);
    
    % Optionally plot the interpolation
    if graf == 1
        plot(alappontok, y, 'ro', 'MarkerSize', 10, 'LineWidth', 1.5); % Original points
        grid on;
        hold on;
        % Evaluate and plot the polynomial
        fplot(lag, [min(alappontok) max(alappontok)], 'LineWidth', 1.5);
        title('Lagrange Interpolation');
        xlabel('x');
        ylabel('y');
    end
    end
    