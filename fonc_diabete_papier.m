function dGIB = fonc_diabete_papier(t,GIB,params)

% Attribution des paramètres :
p = num2cell(params);
[SI,di,pb,db,mb,R0,EG0,sigma,alpha] = deal(p{:});
% Attribution des variables
p = num2cell(GIB);
[G,I,B] = deal(p{:});

SI = SI*exp(-0.03*t);
dG = R0 - (EG0 + SI*I)*G;
dI = B*sigma*G^2/(alpha + G^2) - di*I;
dB = B*(pb*G - db*G^2 - mb);

dGIB = [dG;dI;dB];