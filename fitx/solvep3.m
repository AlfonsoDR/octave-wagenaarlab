function xx=solvep3(A,B,C)
% SOLVEP3  Solve third order polynomial equations
%    xx = SOLVEP3(A,B,C,D) returns the four solutions to the equation
%
%       A*x^3 + B*x^2 + C*x + D = 0.
%
%    The result is a 3x1 vector. Multiple equations may be solved 
%    simultaneously by making the arguments by 1xN vectors
%    (or 1xNxMx... tensors).

% The following solutions have been obtained by typing
% solve('A*x^3 + B*x^2 + C*x + D = 0') into matlab.

xx = [1./6./A.*(36.*B.*C.*A-108.*D.*A.^2-8.*B.^3+12.*3.^(1./2).*(4.*C.^3.*A-C.^2.*B.^2-18.*B.*C.*A.*D+27.*D.^2.*A.^2+4.*D.*B.^3).^(1./2).*A).^(1./3)-2./3.*(3.*C.*A-B.^2)./A./(36.*B.*C.*A-108.*D.*A.^2-8.*B.^3+12.*3.^(1./2).*(4.*C.^3.*A-C.^2.*B.^2-18.*B.*C.*A.*D+27.*D.^2.*A.^2+4.*D.*B.^3).^(1./2).*A).^(1./3)-1./3.*B./A;
  -1./12./A.*(36.*B.*C.*A-108.*D.*A.^2-8.*B.^3+12.*3.^(1./2).*(4.*C.^3.*A-C.^2.*B.^2-18.*B.*C.*A.*D+27.*D.^2.*A.^2+4.*D.*B.^3).^(1./2).*A).^(1./3)+1./3.*(3.*C.*A-B.^2)./A./(36.*B.*C.*A-108.*D.*A.^2-8.*B.^3+12.*3.^(1./2).*(4.*C.^3.*A-C.^2.*B.^2-18.*B.*C.*A.*D+27.*D.^2.*A.^2+4.*D.*B.^3).^(1./2).*A).^(1./3)-1./3.*B./A+1./2.*i.*3.^(1./2).*(1./6./A.*(36.*B.*C.*A-108.*D.*A.^2-8.*B.^3+12.*3.^(1./2).*(4.*C.^3.*A-C.^2.*B.^2-18.*B.*C.*A.*D+27.*D.^2.*A.^2+4.*D.*B.^3).^(1./2).*A).^(1./3)+2./3.*(3.*C.*A-B.^2)./A./(36.*B.*C.*A-108.*D.*A.^2-8.*B.^3+12.*3.^(1./2).*(4.*C.^3.*A-C.^2.*B.^2-18.*B.*C.*A.*D+27.*D.^2.*A.^2+4.*D.*B.^3).^(1./2).*A).^(1./3));
  -1./12./A.*(36.*B.*C.*A-108.*D.*A.^2-8.*B.^3+12.*3.^(1./2).*(4.*C.^3.*A-C.^2.*B.^2-18.*B.*C.*A.*D+27.*D.^2.*A.^2+4.*D.*B.^3).^(1./2).*A).^(1./3)+1./3.*(3.*C.*A-B.^2)./A./(36.*B.*C.*A-108.*D.*A.^2-8.*B.^3+12.*3.^(1./2).*(4.*C.^3.*A-C.^2.*B.^2-18.*B.*C.*A.*D+27.*D.^2.*A.^2+4.*D.*B.^3).^(1./2).*A).^(1./3)-1./3.*B./A-1./2.*i.*3.^(1./2).*(1./6./A.*(36.*B.*C.*A-108.*D.*A.^2-8.*B.^3+12.*3.^(1./2).*(4.*C.^3.*A-C.^2.*B.^2-18.*B.*C.*A.*D+27.*D.^2.*A.^2+4.*D.*B.^3).^(1./2).*A).^(1./3)+2./3.*(3.*C.*A-B.^2)./A./(36.*B.*C.*A-108.*D.*A.^2-8.*B.^3+12.*3.^(1./2).*(4.*C.^3.*A-C.^2.*B.^2-18.*B.*C.*A.*D+27.*D.^2.*A.^2+4.*D.*B.^3).^(1./2).*A).^(1./3))];
