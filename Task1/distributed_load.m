function [F_ext] = distributed_load(j,force)

% empty vector for output forces
F_ext = zeros(25,1);

F_ext(j) = force;

end

