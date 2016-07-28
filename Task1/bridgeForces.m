function F = bridgeForces(joints, beams, pinned_joint, roller_joint, F_ext)

% Test for determinate system
if (2*length(joints))-3 ~= length(beams)
    error('System is indeterminate')
end

A = bridgeAMatrix(joints, beams, pinned_joint, roller_joint);
B = bridgeBVector(joints, beams, pinned_joint, roller_joint, F_ext);
F = A\B;













