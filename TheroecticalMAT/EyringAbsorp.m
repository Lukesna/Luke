%Calculating measured absorption co-efficients from measured reverberation times.

v = 32.07136;
s=  63.4248;
mRT = 0.4333;

ema = 1-exp((0.161*v)/(-s*mRT));

disp(ema);
