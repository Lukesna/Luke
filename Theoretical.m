function [nTheoretical, CalAbsCo, formula] = Theoretical(rt, p1, x1, y1, z1, aw, af, m, hpf, wpf, dpf, freq, pressure, temp, humi)
pa = pressure;
ta = temp;
hv = humi;
f = freq;

RTarget = rt;
P = p1;
x = x1;
y = y1;
z = z1;
formula = 1;
awalls = aw;
afloor = af;
SAPanel = (hpf*wpf);
SAFloor = x*z;
aac = AirAbsorption(pa, ta, hv, f);
SAWallCeil = (((y*x)+(y*z))*2)+(x*z);
V = x*y*z;
S = ((x*z)*2)+((x*y)*2)+((y*z)*2);
anormal = PanelAbsorptivity(m, hpf, wpf, dpf, f);
SoB = ((SAWallCeil/S)*awalls)+((SAFloor/S)*afloor);
SoD = ((SAPanel/S)*anormal)-((SAPanel/S)*awalls);

nTheoretical = (1-exp((0.161*V)/(-S*RTarget))-SoB)/SoD;
CalAbsCo = SoB + P*SoD + (aac);