function  [ yield, colour, p ] = ColourCode( L, F )

% create constants
E = 2.1*10^11;
A = 5.5*10^-4;
I = 8.6*10^-8;

colour = 'k';
yield = 'none';
Fmax = zeros(3,1);

% determine buckling force
Fmax(1) = E*I*(pi^2)/(L^2);
if F < -Fmax(1)
    yield = 'Buckling';
    colour = 'g';
end

% determine crushing force
Fmax(2) = A*280*10^6;
if F < -Fmax(2)     % negative compression forces
    yield = 'Yield in Compression';
    colour = 'cyan';
end

% determine tension force
Fmax(3) = A*250*10^6;
if F > Fmax(3)     % positive tensile forces
    yield  = 'Yield in Tension';
    colour = 'r';
end

% calculate percent of maximum force
p = F/max(Fmax)*100;

end

