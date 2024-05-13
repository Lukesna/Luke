function [nTheoretical, CalAbsCo, formula] = Theoretical(rt, p1, x1, y1, z1, aw, af, m1, hpf1, wpf1, dpf1, freq, pressure, temp, humi)
pa = str2double(pressure);
ta = str2double(temp);
hv = str2double(humi);
f = str2double(freq);

RTarget = str2double(rt);
P = str2double(p1);
x = str2double(x1);
y = str2double(y1);
z = str2double(z1);
m = str2double(m1);
hpf = str2double(hpf1);
wpf = str2double(wpf1);
dpf = str2double(dpf1);
formula = 1;
awalls = str2double(aw);
afloor = str2double(af);
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