function [  ] = Annotate( yield,colour,p )

subplot(1,3,[3]);

ylim([0,length(yield)+1]);  % set consistent

ax = gca;
ax.YTick = [0:(length(yield)+1)];
set(gca,'XTick',[])

for b = 1:length(yield)
    
    if strcmp(yield{b},'none') ~= 1
    text(0.05,b, yield{b},'Color', colour{b});
    else
        text(0.05,b,strcat(num2str(abs(p(b))),'%'))
    end
    xlabel('Percent to Yield');

end

