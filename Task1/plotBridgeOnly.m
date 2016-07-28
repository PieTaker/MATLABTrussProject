function [ ] = plotBridgeOnly( jointsfile, beamsfile)
% created by Wesley Dossett, Brooke Huleatt, and Karly Kudrinko on March 4
% this function inputs joint coordinates, beams, roller joint, and pinned
% joint, and plots all beams to show truss structure.
hold off
joints = xlsread(jointsfile);
beams = xlsread(beamsfile);

% loop over all beams
for i = 1:length(beams(:,1))
    
    % get joints for beam
    joint1 = beams(i,1);
    joint2 = beams(i,2);
  
    % separate x and y values
    x = [joints(joint1,1),joints(joint2,1)];
    y = [joints(joint1,2),joints(joint2,2)];

    % plot each beam in colour
    plot(x,y,'k');
    x2 = mean(x);
    y2 = mean(y);

    text(x2, y2, num2str(i),'BackGroundColor','w');
    
    % plot all beams in same figure
    hold on;
end

% make axes same scale
axis equal

% axis limits
xlim([-1 21]);
ylim([-6 11]);

end

