function fibivstime(dat)
% FIBIVSTIME(dat) plots 1/IBI vs time using the data given.
% dat must be Nx4:
% column 1: burst arrival times
% column 2: burst duration
% column 3: raw burst strength
% column 4: scaled burst strength
% These data are normally obtained using findburst (meabench/perl).
sh=shift(dat,1);
dt=sh(:,1)-dat(:,1);
n=length(dt);
plot(dat(2:n,1) / 60,60.0 ./ dt(1:(n-1)), '.-','Markersize',6);
ddt=dt-shift(dt,1);
std(ddt(2:(n-2)))/std(dt(2:(n-2)))/sqrt(2)

%xlabel('ibi (s)');
%ylabel('bs (s^{-1})');