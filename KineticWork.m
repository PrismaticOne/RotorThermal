function [ Energy ] =  KineticWork( v1,v2 )
% v = m/s
% Energy = KJ
m = 254; %kg
Energy = (m*(v1.^2)/2 - m*(v2.^2)/2)/1000;
end

