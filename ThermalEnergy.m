function [ Q ] = ThermalEnergy( T1,T2,m )
%T in K
%m in kg
C = 490; %J/(kg*K)
Q = m*C*(T2-T1)/1000;
end

