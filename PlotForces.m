function [  ] = PlotForces( F, colour )

subplot(3,4,[3,7,11]);

% loop throught all beams
for b = 1:length(F)
    barh(b,F(b)/1000,colour{b}) % plot each force as horizontal,coloured line
    hold on
    ylim([0 length(F)+1]);  % set consistent limits
    xlim([-2*10^2 2*10^2]);
    xlabel('Compression | Tension [kN] ');
end

