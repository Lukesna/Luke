function sigma = zFlowResistivity(m, hpf, wpf, dpf)
%Air flow resistivity calculater for polyester fiber
ds = m/(hpf*wpf*dpf);
sigma = 25.989*(ds^1.404);

