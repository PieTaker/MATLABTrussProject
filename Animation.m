close all
clear all

beams = dlmread('AnimationBeams.csv');
joints = dlmread('AnimationJoints.csv');

pinned_joint = 1;
roller_joint = 7;

fig = figure('Position',[1, 200, 1400, 400]);

% find beam lengths
L = beamLengths(joints, beams);

% change in x per frame
dx = 0.05;

for i = 0:(6/dx)
    clf
    
    % calculate joint for point load
    j = i*dx; 
    
    % calculate distributed load  
    [F_ext, p1] = distributed_load(j);

    % create b and a matrices, calculate forces
    F = bridgeForces(joints, beams, pinned_joint, roller_joint, F_ext);
    
    % determine yield status
    Yield = cell(length(beams),2);    % empty matrix for yield status and colour
    percent = zeros(length(beams),1);
    for b = 1:length(beams)
        [Yield{b,1}, Yield{b,2}, percent(b)] = ColourCode( L(b), F(b) ); % find yield status for every beam
    end

    % plot bridge in colour
    plotBridge( joints, beams, pinned_joint, roller_joint, Yield(:,2),percent)
    p2 = plot(j,0,'*m','markersize', 10);
    legend([p1 p2],'Dist. Load', 'Point Load','Orientation','horizontal','Location','north');
    
    % bar plot for beam forces
    PlotForces(F, Yield(:,2));
    
    % text for broken beams
    Annotate(Yield(:,1),Yield(:,2),percent);

    % get frame for animation
    animation(i+1) = getframe(fig);
end

% play animation
movie(fig,animation,1,15)
