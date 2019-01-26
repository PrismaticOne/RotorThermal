clear all
clc

%% Kinetic Energy vs. Q Rotor for Fraction of Heat Transferred for Energy Efficiency

% rotor mass, kg
mf = 0.4717361;
mr = 0.371946;

data = csvread('Thermal_Data.csv',3,1);
v_i = data(:,1); % in m/s
v_f = data(:,2);
T_ifront = data(:,6); % in K
T_ffront = data(:,7); 
T_irear = data(:,8); 
T_frear = data(:,9); 
k_e = KineticWork(v_i, v_f); % in kJ
q_rfront = 2*ThermalEnergy(T_ifront, T_ffront, mf); % in kJ
q_rrear = 2*ThermalEnergy(T_irear, T_frear, mr); % in kJ
q_tot = q_rfront + q_rrear;

%efficiency
e = q_tot./k_e;
avg_eff = mean(e);
delt = k_e - q_tot;

% plot heating curves
figure(1)
scatter(k_e, q_tot);
R = corrcoef(k_e,q_tot)
% plot(linspace(1,length(q_tot),length(q_tot)), q_tot);
% hold on
% plot(linspace(1,length(k_e),length(k_e)), k_e);
% comb = horzcat(q_tot, delt);
% bar(comb, 'stacked');
% xlabel('Braking Events');
% ylabel('Energy (kJ)');
% title('KE Lost and Q Absorbed by Rotor');
% text(1,34,sprintf('Avg. efficiency: %f', avg_eff));
% legend('Q rotor', 'KE Lost','Location','south');
% legend('Q Rotor', 'KE Car Lost');
% hold off
% xlim([0,21]);

%% relationship plots
figure()
scatter(v_i,e);
figure()
scatter(T_ifront,e);

%% Work Done from Brake Pressure vs. Thermal Energy Change for Rotor/Pad Mu
total_work = data(:,14);
mu = q_tot./total_work;

% put check for incorrect numbers (-ve work, etc.)

avg_mu = mean(mu);
std_mu = std(mu)
figure(2)
scatter(T_ifront, mu);
hline = refline([0 avg_mu]);
hline.Color = 'r';
xlabel('Initial Temperature (K)');
ylabel('Rotor Mu');
ylim([0,1]);
title('Rotor Mu vs. Temperature at Start of Braking');
text(300, 0.1, sprintf('Avg. rotor mu: %f', avg_mu));
hold off

%% Variation in Forced Convection Coefficient at Range of Constant Speeds

Hest = (m/(As*time))*log((Tf2-Tinf)./(Ti2-Tinf))
