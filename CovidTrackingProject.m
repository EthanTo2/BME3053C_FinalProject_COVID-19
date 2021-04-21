%BME3053C Project SIR Model of COVID-19
clc; clear; 
%Parameters
B1=0.25; % Rate of Infection (Low Estimate)
B2=0.35; % Rate of Infection (High Estimate)
G=0.167; % Rate of Recovery
D1=0.0; % Assume No Immunity Loss
D2=1/73; % Rate of Immmunity Loss
N=6e7; % Total Population of Italy
I0=10; % Initial Infected Population
T=500; % Time period (days)
dt=1; % Time interval (days)
fprintf('The basic reproduction rate R0 for low estimates is %0.2f \n', B1/G);
fprintf('The basic reproduction rate R0 for high estimates is %0.2f \n', B2/G);

%Model 
[S1,I1,R1] = SIR_Model(B1,G,D1,N,I0,T,dt); % model using function
[S2,I2,R2] = SIR_Model(B2,G,D2,N,I0,T,dt);
t = 0:dt:T-dt; % Change in time

subplot(2,1,1)
plot(t,S1,'b',t,I1,'r',t,R1,'g'); %Plot of SIR using low estimates and no immunity loss D=0
title('SIR Model with Low Estimates Assuming No Immunity Loss');
xlabel('Time (Days)'); 
ylabel('Number of individuals');
legend('Susceptible Individuals','Infected Individuals','Recovered Individuals');

subplot(2,1,2)
plot(t,S2,'b',t,I2,'r',t,R2,'g'); %Plot of SIR using high estimates and immunity loss D=0
title('SIR Model with High Estimates Assuming Immunity Loss');
xlim([0 500]);
xlabel('Time (Days)'); 
ylabel('Number of individuals');
legend('Susceptible Individuals','Infected Individuals','Recovered Individuals');

