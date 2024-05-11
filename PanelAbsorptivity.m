%Chapter 5: Absorption of a rigid backed porous absorber
%Using various porous absorber formulations
%Normal incidence absorption coefficients

%Acousic Absorbers and Diffusers, Taylor and Francis
%by Trevor Cox and Peter D'Antonio

function anormal = PanelAbsorptivity(m1, hpf1, wpf1, dpf1, freq1)

c = 341;            %speed of sound
rho = 1.21;         %density of air
Z0 = c*rho;         %characteristic impedance of air
f = freq1;
m = m1;
hpf = hpf1;
wpf = wpf1;
dpf = dpf1;



[sigma] = zFlowResistivity(m, hpf, wpf, dpf);	%flow resisivity

%thickness
dpf = length(f);

%Characteristic impedance and complex wavenumber using Delany and Bazley
warnings = 0;
[ k, zc ] = zWavenumber(f, sigma, rho , c, warnings);



%Calculate surface impedance for each model
zs1 = -1j*zc.*cot(k*dpf);


%reflection coefficient for each model
%absorption coefficient for each model
[R, anormal] = zReflectAbsorb(zs1,Z0);



