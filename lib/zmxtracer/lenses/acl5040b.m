function lens = acl5040b
% ZMX/ACL5040-B.ZMX - Aspheric Condenser Lens, AR-Coated 650-1050 nm, �50 mm, f=40 mm

lens.fn = 'acl5040b';
lens.name = 'ACL5040-B';
lens.diam = [ 45, 50, 39.18679420942 ];
lens.glass = { @(x) (1), @b270 };
lens.curv = [ 0, 0.0477938342225934, 0 ];
lens.tc = [ 5, 21 ];
lens.conj = [ inf, 26.00245765596];
lens.conjcurv = [ 0, 0];
