clear all
close all

z1 =[0+45i 0-45i];
p1 =[1 2000];

z2 =  [0+500i 0-500i];
p2 =  [1 300000];

k = 1;
sys1 = zpk(z1,p1,k);
sys2 = zpk(z2, p2, k);

sys = sys2 * sys1;

figure(1)
bode(sys1)
hold on
bode(sys2)
hold on
bode(sys)

[A1 ,B1]=tfdata(sys1)
[A2, B2] = tfdata(sys2)

%%
clear all
close all

A1 =[1/44,7^2 0 1];
B1 = [1/44,7^2 1 1];

A2 = [1/500^2 0 1];
B2 = [1/500^2 1.2 1];

sys1 = tf(A1,B1);
sys2 = tf(A2,B2);
sys = sys1*sys2;
figure(1)
bode(sys)
figure(2)
pzmap(sys)
