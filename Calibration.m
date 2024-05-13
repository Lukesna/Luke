function [CalAbsCo, formula, nCalibrated] = Calibration(soundo, soundf, pnl, fre, dir, bck, x1, y1, z1, rt, p1)
SoundOn = str2double(soundo);
SoundOff = str2double(soundf);
Panels = str2double(pnl);
f = str2double(fre);
Direct = str2double(dir);
Bckgrnd = str2double(bck);
x = str2double(x1);
y = str2double(y1);
z = str2double(z1);
P = str2double(p1);
RTarget = str2double(rt);


if f >= 250 && f<=400
    formula = 2;
elseif f >= 401 && f<=700
    formula = 1;
elseif f >= 701 && f<=1050
    formula = 2;
elseif f >= 1051 && f<=8000
    formula = 1;
else
    formula = na;
    %erf = error with input frequency, input frequency outside of range
    %1 = Sabine, 2 = Eyring
end
absorpm=1-((SoundOn - SoundOff) / (Direct- Bckgrnd));
matrix = [absorpm,Panels];

resultsb = zeros(1,size(matrix,1));
resultsa = zeros(1,size(matrix,1));

for row = 1:size(matrix, 1)
    meas = matrix(row, 1);
    pnlNbr = matrix(row, 2);
    if formula == 1
        RTEq = @(x) abs(meas-(x(1)+pnlNbr*x(2)));
    elseif formula == 2
        RTEq = @(x) abs(meas+log(1-((x(1)+pnlNbr*x(2)))));
    end
    guess = [0.1, 1];
    optimised = fminsearch(RTEq,guess);
    optb = optimised(1);
    opta = optimised(2);
    resultsb(row) = optb;
    resultsa(row) = opta;
end

SoB = sum(resultsb);
SoD = sum(resultsa);

CalAbsCo = SoB + P*SoD;

disp('Calibrated Absorption Co-efficient:');
disp(CalAbsCo);

V = x*y*z;
S = ((x*z)*2)+((x*y)*2)+((y*z)*2);

if formula == 1
    nCalibrated = (((0.161*V)/(S*RTarget))-SoB)/SoD;
elseif formula == 2
    nCalibrated = (1-exp((0.161*V)/(-S*RTarget))-SoB)/SoD;
end

disp('Calibrated number of panels:');
disp(nCalibrated);

disp(absorpm);

disp(matrix);
end