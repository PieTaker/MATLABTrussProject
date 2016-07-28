function [F_ext p1] = distributed_load(j)

% plot in top left corner
subplot(3,4,[1,2,5,6]);

% empty vector for output forces
F_ext = zeros(13,1);

% determine the 2 integer values above and below the joint
j1 = floor(j);
j2 = j1 + 1;

% determine how far the load is from one of the joint, in decimal value
P = j - j1;

% determine thickness of distributed load lines
thick1 = (P*2)+1;
thick2 = ((1-P)*2)+1;

% determine length of distributed load lines
F_ext(j2+1) = P*170000;
F_ext(j1+1) = (1-P)*170000;

% plot distributed load lines and triangles to make arrow
p1 = plot([j2 j2],[0 -P],'b','LineWidth',thick1);
hold on
plot([j1 j1],[0 -(1-P)],'b','LineWidth',thick2);
plot(j1, -(1-P),'vb','markersize',thick2*5);
plot(j2, -P,'vb','markersize',thick1*5);

% plot in botton left corner
subplot(3,4,[9 10]);

% display point load position, and magnitude
plot(0.04,0.9,'*m','markersize',15)
hold on
text(0.06,0.9,strcat(' Point Load X-Pos: ',num2str(j),' m, Force:170000 N'),'Color','k','FontSize',15)

% display distributed load positions and magnitudes
plot(0.04,0.6,'vb','markersize',15)
text(0.06,0.6,strcat(' Dist. Load X-Pos: ',num2str(j1),' m, Force:',num2str(F_ext(j1+1)),' N'),'Color','k','FontSize',15)
plot(0.04,0.3,'vb','markersize',15)
text(0.06,0.3,strcat(' Dist. Load X-Pos: ',num2str(j2),' m, Force:',num2str(F_ext(j2+1)),' N'),'Color','k','FontSize',15)
text(0.07,0,'Thickness of beam proportional to internal load','FontSize',15)

% set axis limits
xlim([0 1]);
ylim([0 1]);

% make axes invisible
axis off

end

