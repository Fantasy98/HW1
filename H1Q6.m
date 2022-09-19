load allFaces.mat
X = faces(:,1:nfaces(1));
[U,S,V] = svd(X,'econ');
r=2;p=2; %#ofmodesr,#ofsensorsp 
Psi = U(:,1:r);
[Q,R,pivot] = qr(Psi,"vector");
C = zeros(p,n*m);
for j=1:p
    C(j,pivot(j))=1;
end
%
Theta = C*Psi;
y = faces(pivot(1:p),1); % Measure at pivot locations a = Theta\y; % Estimate coefficients faceRecon = U(:,1:r)*a;
