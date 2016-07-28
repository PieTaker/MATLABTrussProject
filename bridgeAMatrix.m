function [ A ] = bridgeAMatrix(joints, beams, pinned_joint, roller_joint )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Test for determinate system
if (2*length(joints))-3 ~= length(beams)
    error('System is indeterminate')
end

% create empty A matrix
A = [];

r = 1;
for j = 1:length(joints)
    % check if current joint is pinned
    if (j == pinned_joint)
        continue;
    end
    
    % loop over all beams
    for b = 1:length(beams)
        % if current beam is on current joint
        if beams(b,1) == j
            % grab both beam joints
            joint1 = joints(j,:);
            joint2 = joints(beams(b,2),:);
            
        elseif beams(b,2) == j
            % grab both beam joints
            joint1 = joints(j,:);
            joint2 = joints(beams(b,1),:);
            
        else
            continue;
        end
        
        %beam vector
        v = joint2-joint1;
        
        % unit vector
        u = v/norm(v);
        
        % sub in unit vector components into consecutive A matrix rows
        if j ~= roller_joint
            % regular joint
            A(r,b) = u(2);
            A(r+1,b) = u(1);
        
        else
            % special case for roller joint
            A(r,b) = u(1);
        end
    end
    
    % advance row in A matrix, 1 if roller joint, 2 if regular joint
    if j == roller_joint
        r = r+1;
    else
        r = r+2;
    end
    
end


end

