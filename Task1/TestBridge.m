function [ answer ] = TestBridge( force)

beams = xlsread('DesignTask1_beams.xlsx');
joints = xlsread('DesignTask1_joints.xlsx');


pinned_joint = 1;
roller_joint = 7;

%figure('Position',[1, 200, 1400, 400]);

% find beam lengths
L = beamLengths(joints, beams);

% set joint at center bottom joint
j = 4;

% calculate distributed load
F_ext = distributed_load(j,force);

% create b and a matrices, calculate forces
F = bridgeForces(joints, beams, pinned_joint, roller_joint, F_ext);

% determine yield status
Yield = cell(length(beams),2);    % empty matrix for yield status and colour
percent = zeros(length(beams),1);
for b = 1:length(beams)
    [Yield{b,1}, Yield{b,2}, percent(b)] = ColourCode( L(b), F(b) ,b); % find yield status for every beam
end
if max(percent) >= 100
    answer = -1;
else
    answer = 1;
end

% 
% 
% % plot bridge in colour
% plotBridge( joints, beams, pinned_joint, roller_joint, Yield(:,2),percent)
% 
% % bar plot for beam forces
% PlotForces(F, Yield(:,2));
% 
% % text for broken beams
% Annotate(Yield(:,1),Yield(:,2),percent);

end

