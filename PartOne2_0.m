clear all
close all

z1 =[0+45i 0-45i];
p1 =[-1 -2000];

z2 =  [0+500i 0-500i];
p2 =  [-1 -300000];

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

A1 =[1/44.99^2 0 1];
B1 = [1/44.99^2 0.988 1];

A2 = [1/500^2 0 1];
B2 = [1/500^2 1.2 1];

sysA = tf(A1,B1);
sysB = tf(A2,B2);
sysC = sysA*sysB;

figure(2)
bode(sysC)


figure(3)
pzmap(sys)
