function plot_modg(y,X)
% PLOT_MODG(y,X) plots the Modg results in y. Use y=modg_fsmem(X,K) to
% fill y. The plot is performed using plot_projs.

K = length(y.p);

displ(X,K,y.mu,y.sig,y.R); % see below
return;
disp(y.p);
disp(y.mu);
sigs = zeros(size(y.mu,1),0);
for k=1:K
  sigs = cat(2,sigs, y.sig{k});
end
disp(sigs);
fprintf(1,'Press enter to continue...\n');
pause;
return;

function displ(X,K,mu,sig,R)
% DISPL(X,K,mu,sig,R) is a helper function for plot_modg to
% plot the distribution.
% X: DxN
% K: 1x1
% mu: DxK
% sig: K cells of DxD
% R: NxK

plot_projs(X,R,2,3);
drawnow;
return;