%Part1
clear all
close all

z1 =[0+50i 0-50i];
p1 =[-1 -2500];

z2 =  [0+500i 0-500i];
p2 =  [-1 -250000];

k = 1;
sys1 = zpk(z1,p1,k);
sys2 = zpk(z2, p2, k);

sys = sys2 * sys1;

figure(1)
bode(sys)
hold on
bode(sys1)
hold on
bode(sys2)

[A,B] = tfdata(sys1)
[A,B] = tfdata(sys2)

A1 =[1/50^2 0 1];
B1 = [1/50^2 0.8 1];

A2 = [1/500^2 0 1];
B2 = [1/500^2 1.2 1];

sysA = tf(A1,B1);
sysB = tf(A2,B2);
sysC = sysA*sysB;

figure(2)
bode(sysC)

figure(3)
pzmap(sys)

%%
%Part 2 

clear all
close all
load tf04.mat

figure(1);
margin(sys); 

figure(2);
pzmap(sys);

figure(3);
step(sys);


[Gm,Pm,Wcp, Wvp] = margin(sys);
Gm_dB = 20*log10(Gm);
Wcp

figure(4);
rlocus(sys);

%p contorler voorbereiden
t = (0:0.0001:0.75)';
k = 63;
KI = 0;
KD = 0;
TaS = 0;
tdelay = 0;

out = sim('PID_controler.slx');

figure(5)
plot(t,out.simout);
hold on
plot (t,out.step);


%%
%Part 3 
clear all
close all
load tf04.mat

figure(1)
margin(sys)
[Gm,Pm,Wcp, Wvp] = margin(sys);

Gm
Wcp
T =2 * pi/Wcp

Kzn = 0.6*Gm
TIzn = T/2
TDzn = T/8

%voorbereidingen simulink inputs met KZ parmater
t = (0:0.0001:0.75)';

k = Kzn
KI = Kzn/TIzn
KD = TDzn*Kzn
TaS = 0.0001
tdelay = 0;

out = sim('PID_controler.slx');

figure(2)
plot(t,out.simout);
hold on
plot (t,out.step);

%PID contorler met verbeterde parameters
k = 18;
KI = 85;
KD = 0.63;
TaS = 1/10000;
tdelay = 0;

out = sim('PID_controler.slx');

figure(3)
plot(t,out.simout);
hold on
plot (t,out.step);

%%
%part 4
clear all
close all
load tf04.mat

%PID contorler met verbeterde parameters
k = 18;
KI = 85;
KD = 0.63;
TaS = 1/10000;

s = tf('s');
TC = k+KI/s+s*KD/(TaS*s+1);

Tol = sys * TC;
margin(Tol);
[Gm,Pm,Wcp, Wvp] = margin(Tol);

tmax = (Pm*pi)/(180*Wvp)


t = (0:0.001:1)';
tdelay = 0.0006061; %marginely stabel

out = sim('PID_controler.slx');

figure(2)
plot(t,out.simout);
hold on
plot (t,out.step);

%%
% part 4.3 
clear all
close all
load tf04.mat

k = 6.5;
KI = 47;
KD = 0.298;
TaS = 1/10000;

tdelay = 0.0006061;
t = (0:0.001:1)';

out = sim('PID_controler.slx');
plot(t,out.simout);
hold on
plot (t,out.step);
hold on

k = 18;
KI = 85;
KD = 0.63;
TaS = 1/10000;
tdelay = 0;

out = sim('PID_controler.slx');
plot(t,out.simout);

legend("met delay", "step","zonder delay")