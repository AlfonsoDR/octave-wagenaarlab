function y = modg_truncate(par,k0)
% y=MODG_TRUNCATE(par,k0) returns par unchanged, except that all
% information pertaining to cluster k0 is removed.
% Input: par: as for modg_fullem
%        k0: cluster to be removed
% Output: as input
% Coding: DW
% Note: the final cluster is renumbered as k0.

K = length(par.p);
Knew = K-1;
y.p = par.p(:,1:Knew);
y.mu = par.mu(:,1:Knew);
for k = 1:Knew
  y.sig{k} = par.sig{k};
end
if (k0<K)
  y.p(:,k0) = par.p(:,K);
  y.mu(:,k0) = par.mu(:,K);
  y.sig{k0} = par.sig{K};
end
