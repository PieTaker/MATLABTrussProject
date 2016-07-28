function [ ] = plotjointsOnly( jointsfile, beamsfile)
% created by Wesley Dossett, Brooke Huleatt, and Karly Kudrinko on March 4
% this function inputs joint coordinates, beams, roller joint, and pinned
% joint, and plots all beams to show truss structure.
hold off
joints = xlsread(jointsfile);
beams = xlsread(beamsfile);

% loop over all beams
for i = 1:length(joints(:,1))
    
    x = joints(i,1);
    y = joints(i,2);
    % plot each beam in colour
    plot(x,y,'.k');
    text(x, y, num2str(i),'BackGroundColor','w');
    
    % plot all beams in same figure
    hold on;
end

% make axes same scale
axis equal

% axis limits
xlim([-1 21]);
ylim([-6 11]);

end

