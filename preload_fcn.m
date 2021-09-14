%% create DUT and set analysis parameters
H = tf([1 0 (2*pi*1e3)^2],[1 2*pi*1e3 (2*pi*1e3)^2]);
BW = 10e3; % Hz
OSR = 2.56;
Fs = OSR*BW; % 25.6 kHz
NFFT = 1024;
AvgFac = 1000;  
p = 1/AvgFac;
FF = 1 - p;
%% view analytical response
w = linspace(0,2*pi*BW,NFFT/OSR+1);
[mag,phz,wout] = bode(H,w);
figure;subplot(211);plot(w/(2*pi),20*log10(squeeze(mag)));grid
title('Magnitude Response');xlabel('Hz');ylabel('dB');
set(gca,'Ylim',[-50 10]);
subplot(212);plot(w/(2*pi),squeeze(phz));grid
title('Phase Response');xlabel('Hz');ylabel('degrees');