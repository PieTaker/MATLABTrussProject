function [ ] = plotBridge( joints, beams, pinned_joint, roller_joint, colour,thickness )
% created by Wesley Dossett, Brooke Huleatt, and Karly Kudrinko on March 4
% this function inputs joint coordinates, beams, roller joint, and pinned
% joint, and plots all beams to show truss structure.

% plot in top left corner
subplot(1,3,[1,2]);

% loop over all beams
for i = 1:length(beams(:,1))
    
    % get joints for beam
    joint1 = beams(i,1);
    joint2 = beams(i,2);
  
    % separate x and y values
    x = [joints(joint1,1),joints(joint2,1)];
    y = [joints(joint1,2),joints(joint2,2)];

    % plot each beam in colour
    plot(x,y,colour{i},'LineWidth',abs(thickness(i)/20)+1);
    x2 = mean(x);
    y2 = mean(y);

    text(x2, y2, num2str(i), 'Color', colour{i},'BackGroundColor','w');
    
    % plot all beams in same figure
    hold on;
end

% get coordinates for roller joint
x = joints(roller_joint,1);
y = joints(roller_joint,2);

% plot roller joint as black circle
plot(x,y,'ok','markersize', 10);

% get coordinates for pinned joint
x = joints(pinned_joint,1);
y = joints(pinned_joint,2);

% plot pinned joint at black triangle
plot(x,y,'^k','markersize', 10);

% make axes same scale
axis equal

% axis limits
xlim([0 12]);
ylim([-1 3]);

end

