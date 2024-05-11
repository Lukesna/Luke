function [ k, zc ] = zWavenumber( f, sigma, rho , c , warnings)

%Calculates the wavenumber (k) and characteristic impedance (zc) using the
%Delaney and Bazley formulations
%Eqns 5.7-5.9, 3rd Ed
%Acousic Absorbers and Diffusers, Taylor and Francis
%by Trevor Cox and Peter D'Antonio

%Inputs
%f - frequencies where calculation is done
%sigma - flow resistivity (MKS)
%rho - density of air
%c - speed of sound
%warnings - display (1) or don't display (0) warnings about limitations
%of empirical formulation

%calculate impedance of porous material, Eqns 5.7 - 5.9
X = rho*f/sigma;            %dimensionless quantity for Delany and Bazley
zc = rho*c*(1+0.0571*(X.^-0.754)-1j*0.087*(X.^-0.732));        %characteristic impedance
k = (2*pi/c).*f.*(1+0.0978*(X.^-0.700)-1j*0.189*(X.^-0.595));  %wavenumber

%warnings
if warnings == 1
    if min(X)<0.01
        display(sprintf('X = %f too small' , min(X)));
    end
    if max(X)>1
        display(sprintf('X = %f too large' , max(X)));
    end
    if sigma <1000
        display(sprintf('Flow resistivity = %f too small' , sigma));
    end
    if sigma > 50000
        display(sprintf('Flow resistivity = %f too large' , sigma));
    end
end

end
