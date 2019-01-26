%% Lumped Capacitance Model
%constants
IntoM = 0.0254; %1 in = .025 m
In2toM2 = 0.00064516; %1 in^2  = .000645 m^2
As = frontRotorAs*In2toM2;
m = mf; %kg
C = 490; %J/(kg*K)
e = 2.71828;

%i2 data
Tinf = 283;%K ;50 F
Ti = 515; %K start of constant speed
Tf = 331; %K
timeelapsed = 657.7; %time passed in seconds

%calc convection coeff
Hest = -(m*C/(As*timeelapsed))*log((Tf-Tinf)/(Ti-Tinf)) %W/(m^2*K)

%% Plot Convection

time = linspace(0,timeelapsed,1000);
T = @(t) (Ti-Tinf)*e.^(-(Hest*As/(m*C))*t)+Tinf;
plot(time+81.5512,T(time))
hold on
plot(Brake_Temp_FR.Time, Brake_Temp_FR.Value)
xlabel('Time (s)');
ylabel('Temperature (K)');
xlim([82,650]);
ylim([300,550]);
title('Validity of Lumped Capacitance Model');
legend('Lumped Capacitance Model', 'Thermocouple Data');
% annotation('textarrow',[0.55 0.35],[0.6 0.8],'String','Ahmed kicking the stationary car wheel');
hold off
%% Biot Check (Bi < 0.1)
k_greycast = 53.3; %W/(m*K)
Bi = Hest*CharLengthFront*IntoM/k_greycast;