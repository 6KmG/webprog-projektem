function ntmeg = newtonip(alappontok, y, graf)
    % Newton interpolation to approximate a polynomial from given points.
    % alappontok - x-coordinates of the given points.
    % y          - y-coordinates of the given points.
    % graf       - if 1, the function plots the results; otherwise, no plot.
    %
    % Example:
    % newtonip([1, 4, 9], [2, 3, 4], 1)
    
    meret = length(alappontok);
    
    % Ensure the number of x and y points match
    if (meret ~= length(y))
        error("Hiba! A függvény x és y koordinátáinak száma nem eggyezik!");
    end
    
    % Initialize the divided difference table
    osztdiff = zeros(meret, meret);
    osztdiff(:, 1) = y; % First column is the y-values
    
    % Compute the divided differences
    for II = 2:meret
        for JJ = 2:II
            osztdiff(II, JJ) = (osztdiff(II, JJ-1) - osztdiff(II-1, JJ-1)) / ...
                (alappontok(II) - alappontok(II-JJ+1));
        end
    end
    
    % Construct the Newton interpolation polynomial
    syms x;
    interpolaciosPolinom = osztdiff(1, 1); % Start with the first term
    for II = 2:meret
        term = osztdiff(II, II);
        for JJ = 1:II-1
            term = term * (x - alappontok(JJ)); % Multiply by (x - xj) for each j
        end
        interpolaciosPolinom = interpolaciosPolinom + term;
    end
    
    % Display the simplified polynomial
    disp("A megoldás:");
    disp(simplify(interpolaciosPolinom));
    
    % Plot the interpolation if requested
    if graf == 1
        fplot(interpolaciosPolinom, [min(alappontok) max(alappontok)], 'LineWidth', 1.5);
        hold on;
        plot(alappontok, y, 'ro', 'MarkerSize', 10, 'LineWidth', 1.5); % Original points
        grid on;
        title('Newton Interpolation');
        xlabel('x');
        ylabel('y');
    end
    
    ntmeg = simplify(interpolaciosPolinom); % Return the simplified polynomial
    end
    