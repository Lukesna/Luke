function aac = AirAbsorption(pa, ta, hv, f)
pr = 101325; %reference pressure (Pa)
tr = 293.15; %reference temp (K)
pa = 102.9;
ta = 295;
hv = 59.7;
%pa = input('What is the ambient pressure of the listening enviroment in Pa?');
%ta = input('What is the ambient tempurature of the listening enviroment in Kelvin?');
%hv = input('What is the molar concentration of water vapour (%)');
%f = input('What is the intended or average frequency');
t = ta/tr;

%relaxation frequency of oxygen
fro = (pa/pr)*(24+(40400*hv*((0.02+hv)/0.391+hv_)));

%relaxation frequency of hydrogen
frn = (pa/pr)*(t^0.5)*(9+(280*hv)*exp(-4.17*((t^(-1/3))-1)));

%air absorption co-efficient
aac = 8.686*(f^2)*((1.84*10^11)*(pr/pt)*(t^0.5)+(t^-2.5)*(0.01275*exp(-2239.1/ta)*fro/((fro^2)+(f^2))+0.1068*exp((-3352/ta)*(frn/((frn^2)+(f^2))))));
