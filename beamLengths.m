function L_b = beamLengths(joints, beams)

%Define length
L_b = zeros(length(beams),1);

for i=1:length(beams)
    
    %Assign the two joints that make up the beam
    jointa = beams(i,1);
    jointb = beams(i,2);
    
    %Find the x and y components of the beam length
    Lengthx = joints(jointb,1)-joints(jointa,1);
    Lengthy = joints(jointb,2)-joints(jointa,2);
    
    %Calculate the magnitude of the beam length
    L_b(i,1) = sqrt((Lengthx.^2)+(Lengthy.^2));
    
    %Optional to print out the lengths with the following fprintf
    %statement:
    
    %fprintf('Beam %d has a length of %.2f\n',i,L_b(i,1))
    
end 

end