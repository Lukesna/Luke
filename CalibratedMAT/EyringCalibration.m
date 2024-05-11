
%K = input('Select K value');
%P = input('Select how many absoroptive panels you are using for your study');
%matrixE = input('Input values for measured absorption folowed by the number of panels used:');
%disp('Your values are:');
%disp(matrixE);

resultsEb = zeros(1,size(matrix,1));
resultsEa = zeros(1,size(matrix,1));

for rowe = 1:size(matrixE, 1)
    mease = matrixE(rowe, 1);
    pnlNbre = matrixE(rowe, 2);
    sabEqe = @(x) abs(mease+log(1-((x(1)+pnlNbre*x(2)))));
    guesse = [0.1, 1];
    optimisede = fminsearch(sabEqe,guesse);
    opteb = optimisede(1);
    opted = optimisede(2);
    resultsEb(rowe) = opteb;
    resultsEa(rowe) = opted;
end

EoB = sum(resultsEb);
EoD = sum(resultsEd);
CalAbsCoe = finValbe + P*finValae;
disp('Eyring Calibrated Absorption Co-efficient:');
disp(CalAbsCoe);

V = x*y*z;
S = ((x*z)*2)+((x*h)*2)+((h*z)*2);

neo = (1-exp((0.161*V)/(-S*RTarget))-SoB)/SoD;