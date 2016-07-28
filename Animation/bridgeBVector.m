function B = bridgeBVector(joints, beams, pinned_joint, roller_joint, F_ext)

% Test for determinate system
if (2*length(joints))-3 ~= length(beams)
    error('System is indeterminate')
end

% create empty B matrix
B = zeros(length(beams),1);

r = 1;
for j = 1:length(joints)
    % check if current joint is pinned
    if (j == pinned_joint)
        continue;
    % check if current joint is a roller joint
    elseif (j == roller_joint)
        B(r,1) = 0;
        r = r+1;
    else
        B(r,1) = F_ext(j);        
        B(r+1,1) = 0;
        r = r+2;
    end
end


