clear all
close all
load tf04.mat

figure(1);
bode(sys); %DC gain betsaande waarde en de Gain op oneidig gaat naar min oneindig
hold on;
figure(2);
pzmap(sys);% alle pollen linker deel
hold on;
figure(3);
nyquist(sys);
hold on;
figure(4);
step(sys);% gaat niet naar oneindig maar naar een reeele waarde
hold on;
figure(5);
impulse(sys);
hold on;
figure(6);
rlocus(sys);
%%

 clear all
 close all
 load tf04.mat
 dc = dcgain(sys);
 r = 1;% target waarde

 t_end = 0.1;
 t_sample = 0.0000001; 
 t = (0:t_sample:t_end)';
 input = 0.*t + r;

 b_waarde = r/dc

 b= 0.*t + b_waarde;
 p_regel = tf(90);
 out = sim('PartTwo.slx');

 hold on
 figure(7);
 plot(t,out.simout );
 hold on 
 plot(t, out.simout1);
 hold on 
 plot(t, out.simout1-b_waarde);
