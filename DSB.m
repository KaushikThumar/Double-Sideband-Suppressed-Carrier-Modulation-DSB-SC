%Model a DSB-SC AM system using simulink and MATLAB.The message signal is 
%1-Hz sine wave and the carrier frequency is selected as 20 Hz.The sample 
%time parameter value of 1/1000 is used.The parameters of simulation 
%including message signal frequency,carrier frequency,and sampling rate are 
%set up by a companion MATLAB m-file.The m-file also computes thetransfer 
%function of the BP and LP filters in the DSB-AM coherent demodulator.

fm=input('Enter friquency of message signal ');
fc=input('Enter friquency of carrier signal ');
Am=input('Enter Amplitude of message signal ');
Ac=input('Enter Amplitude of carrier signal ');
fs=input('Enter Sammpling period ');
q=input('Enter Phase differance in Local Signal at Demodulater Side ');
t=0:1/fs:1;        % Time Period

% MESSAGE SIGNAL
Em=Am.*sin(2.*pi.*fm.*t);    % MESSAGE SIGNAL  
subplot(611);
plot(t,Em)
xlabel('Time');  
ylabel('Amplitude');
title('Message Signal');

% CARRIER SIGNAL
Ec=Ac.*sin(2.*pi.*fc.*t);    % CARRIER SIGNAL  
subplot(612);
plot(t,Ec)
xlabel('Time');  
ylabel('Amplitude');
title('Carrier Signal');

% DSB-SC MODULATION
s=Em.*Ec                     % DSB-SC MODULATED SIGNAL
subplot(613);
plot(t,s)
xlabel('Time');  
ylabel('Amplitude');
title('DSB-SC AM');

% CO-HERENT DETECTOR
% PRODUCT MODULATOR
l=sin((2.*pi.*fc.*t)+q);
v=s.*l
subplot(614);
plot(t,v)
xlabel('Time');  
ylabel('Amplitude');
title('PRODUCT MODULATOR(CO-HERENT DETECTOR)');
% LOWPASS FILTER
y=lowpass(v,fm,fs);
subplot(615);
plot(t,y)
xlabel('Time');  
ylabel('Amplitude');
title('DSB-SC DEMODULATED SIGNAL(LOWPASS FILTER)');
% BANDPASS FILTER
Z=bandpass(v,[fm (fm+15)],fs);
subplot(616);
plot(t,Z)
xlabel('Time');  
ylabel('Amplitude');
title('DSB-SC DEMODULATED SIGNAL(BANDPASS FILTER)');