close all
clear all

w1 = 50;       %Orgineel bereknde waarde
w2z = 500;
w2p = 191.6;
Q1 = 0.51/50;     
%Q2 = 0.01515/0.75; 

%w1 = 500; 
%w2z = 50;
%w2p = 19.16;
%Q1 = 0.51;    
Q2 = 0.0263;  

B1 = [1 0 w1^2];
A1= [1 w1/Q1 w1^2]; %

B2 = [1 0 w2z^2];
A2= [1 w2p/Q2 w2p^2]; %


sys1 = tf(B1,A1);
sys2 = tf(B2,A2);

sys = sys1 *sys2;

bode (sys);
hold on
bode(sys1)
hold on
bode(sys2)
    grid on
