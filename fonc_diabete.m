function dGIB = fonc_diabete(t,GIB,params)

% Attribution des paramètres : 
p = num2cell(params);
[S,p_i,di,pb,db,mb,G0] = deal(p{:});

% Attribution des variables
p = num2cell(GIB);
[G,I,B] = deal(p{:});

dG = G0 - S*G*I;
dI = p_i*G*B - di*I;
dB = B*(pb*G - db*G^2 - mb);

dGIB = [dG;dI;dB];