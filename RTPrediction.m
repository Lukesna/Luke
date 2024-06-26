function rt = RTPrediction(abs_coeff1,room1,formula1)
%RTEST Estimate reverberation time based on room size and absorption
%
%   RT = IOSR.ACOUSTICS.RTEST(ABS_COEFF,ROOM) estimates the reverberation
%   time (RT60) for a shoebox-shaped room, with average absorption
%   coefficient ABS_COEFF, and dimenions ROOM=[L W H] (in metres). An RT
%   estimate is returned for each element of ABS_COEFF.
%
%   RT = IOSR.ACOUSTICS.RTEST(ABS_COEFF,ROOM,FORMULA) allows the formula to
%   be specified. The options are 'sabine' (default), or 'eyring'.

%   Copyright 2016 University of Surrey.
abs_coeff = str2double(abs_coeff1);
room = str2double(room1);
formula = str2char(formula1);
assert(isnumeric(abs_coeff), 'iosr:rtEst:invalidCoeff', 'abs_coeff should be numeric')
assert(isnumeric(room) & numel(room)==3 & isvector(room), 'iosr:rtEst:invalidRoom', 'room should be a 3-element numeric vector')
if nargin<3
    formula = '1';
end

assert(ischar(formula), 'iosr:rtEst:invalidFormula', 'formula should be a character array (string)')

l = room(1);
w = room(2);
h = room(3);

vol = prod(room);
surf_area = (2*l*w) + (2*l*h) + (2*w*h);

switch lower(formula)
    case '1'
        rt = (0.161*vol)./(surf_area.*abs_coeff);
    case '2'
        rt = (0.161*vol)./(-surf_area.*log(1-abs_coeff));
    otherwise
        error('iosr:rtEst:unknownFormula','Unknown formula')
end

end
