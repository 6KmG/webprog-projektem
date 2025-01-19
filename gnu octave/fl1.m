function result = fl1(inputVector)
    % Ellenőrizzük, hogy a vektor elemei 0-ból és 1-ből állnak, kivéve az utolsó elemet
    if any(inputVector(1:end-1) ~= 0 & inputVector(1:end-1) ~= 1)
        error('A mantissza elemei csak 0 vagy 1 értékeket vehetnek fel.');
    end

    % Szétválasztjuk a mantisszát és a karakterisztikát
    mantissa = inputVector(1:end-1);  % Mantissza része
    exponent = inputVector(end);      % Karakterisztika

    % A mantissza első bitje az előjelbit
    signBit = mantissa(1);            % Előjelbit
    mantissaValue = mantissa(2:end);  % Tényleges mantissza (az előjelbit nélkül)

    % Számítsuk ki a mantissza értékét
    mantissaDecimal = 0;
    for i = 1:length(mantissaValue)
        mantissaDecimal = mantissaDecimal + mantissaValue(i) * 2^(-i);
    end

    % A gépi szám értéke
    if signBit == 1
        result = -mantissaDecimal * 2^exponent;  % Ha az előjel negatív
    else
        result = mantissaDecimal * 2^exponent;   % Ha az előjel pozitív
    end
end

% function test_fl1()
%     % Teszt 1: Pozitív szám
%     input1 = [0, 1, 0, 1, 1, 2]; % Mantissza: 0.1011, Karakterisztika: 2 0.1011 10
%     expected_output1 = 0.6875 * 2^2; % Várt eredmény: 2.75
%     result1 = fl1(input1)
%     %assert(abs(result1 - expected_output1) < 1e-6, 'Teszt 1 sikertelen!');

%     % Teszt 2: Negatív szám
%     input2 = [1, 1, 0, 1, 1, 3]; % Mantissza: -0.11011, Karakterisztika: 3
%     expected_output2 = -0.8125 * 2^3; % Várt eredmény: -5.5
%     result2 = fl1(input2)
%     %assert(abs(result2 - expected_output2) < 1e-6, 'Teszt 2 sikertelen!');

%     % Teszt 3: Nulla érték
%     input3 = [0, 0, 0, 0, 0, 0]; % Mantissza: 0.00000, Karakterisztika: 0
%     expected_output3 = 0; % Várt eredmény: 0
%     result3 = fl1(input3)
%     %assert(abs(result3 - expected_output3) < 1e-6, 'Teszt 3 sikertelen!');

%     % Teszt 4: Nagy pozitív szám
%     input4 = [0, 1, 1, 1, 1, 4]; % Mantissza: 0.1111, Karakterisztika: 4
%     expected_output4 = 0.9375 * 2^4; % Várt eredmény: 15
%     result4 = fl1(input4)
%     %assert(abs(result4 - expected_output4) < 1e-6, 'Teszt 4 sikertelen!');

%     % Teszt 5: Negatív szám nagyobb karakterisztikával
%     input5 = [1, 1, 0, 1, 0, 5]; % Mantissza: -0.11010, Karakterisztika: 5
%     expected_output5 = -0.8125 * 2^5; % Várt eredmény: -20
%     result5 = fl1(input5)
%     %assert(abs(result5 - expected_output5) < 1e-6, 'Teszt 5 sikertelen!');

%     %disp('Minden teszt sikeres!');
% end

% test_fl1