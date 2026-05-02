clear all
close all

b1 = 50;
a1 = -0.01;
z1 = a1+1i*b1;

b2 = 500;
a2=-0.01;
z2 = a2+1i*b2;

b3 = 1;
a3 = -1;
p1 = a3+1i*b3;

b4 = 10^4;
a4 = -10^4;
p2 = a4+1i*b4;


zeros = [z1,conj(z1),z2,conj(z2),64e-5];

poles = [p1,conj(p1),p2,conj(p2),10e-5];

sys = zpk(zeros,poles,1);
bode(sys)

%%
close all

zeros = [z1,conj(z1),z2,conj(z2)];

poles = [p1,conj(p1),p2,conj(p2)];

sys2 = zpk(zeros,poles,1);
bode(sys2)

%%
pzmap(sys2)