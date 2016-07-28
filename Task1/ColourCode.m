function  [ yield, colour, p ] = ColourCode( L, F ,b)

% create constants
E = 2.1*10^11;
I = 8.6*10^(-8);

colour = 'k';
yield = 'none';
Fmax = zeros(3,1);
Fmax(1) = E*I*(pi^2)/(L^2);
Fmax(2) = 150000; %A*280*10^6;
Fmax(3) = 140000; %A*250*10^6;

% determine buckling force
if (F < 0) && (abs(F) > Fmax(1))
    yield = 'Buckling';
    colour = 'g';

    % determine crushing force
elseif (F < 0) && (abs(F) > Fmax(2))     % negative compression forces
    yield = 'Yield in Compression';
    colour = 'cyan';

    % determine tension force
elseif (F > 0) && (abs(F) > Fmax(3))     % positive tensile forces
    yield  = 'Yield in Tension';
    colour = 'r';
end

% calculate percent of maximum force
if F<0
    p = abs(F)/min(Fmax(1:2))*100;
else
    p = abs(F)/min(Fmax(3))*100;
end


end

