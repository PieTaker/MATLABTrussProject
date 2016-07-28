function [ load ] = test( force )

%Allj = 'DesignTask1_joints.xlsx';
beams = xlsread('DesignTask1_beams.xlsx');
joints = xlsread('DesignTask1_joints.xlsx');
F_ext = zeros(length(beams),1);
F_ext(5) = force;
Pjoint = 1;
Rjoint = 7;
L = beamLengths(joints, beams);

F = bridgeForces(joints, beams, Pjoint, Rjoint, F_ext);

% create constants
E = 2.1*10^11;
A = 5.5*10^(-4);
I = 8.6*10^(-8);

%F1 = E*I*(pi^2)/(L(:,1).^2)
F2 = 150000; %A*280*10^6;
F3 = 140000; %A*250*10^6;


%result = F/min(Fmax)
for i = 1:length(beams)
    F1 = E*I*(pi^2)/(L(1)^2);
    Fmaxbeam(i,:) = [F1,F2,F3];
    result(i,1) = 1;
    % determine buckling force
    if (F(i) < 0) && (abs(F(i)) > F1)
        result(i) = -1;
        
        % determine crushing force
    elseif (F(i) < 0) && (abs(F(i)) > F2)     % negative compression forces
        result(i) = -1;
        
        % determine tension force
    elseif (F(i) > 0) && (abs(F(i)) > F3)     % positive tensile forces
        result(i) = -1;
    end

end
if min(result) < 0
    load = -1;
else
    load  = 1;
end
result
end