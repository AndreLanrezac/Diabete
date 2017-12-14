close all

tspan = linspace(0,300,100);

%% Valeurs intiales : 
G0 = 120;
I0 = 10;
B0 = 250;
GIB0 = [G0,I0,B0];

%% Paramètres : 

% Sensibilité des cellules beta à l'action de l'insuline
% = dégradation du glucose
SI = 0.72;

di = 432; %coef de dégradation de l'insuine

pb = 0.84*10^-3; %coef de prolifération des cellules beta en fonc du glc
db = 0.24*10^-5; %dégradation des cellules beta en fonc du glc^2
mb = 0.06; %mort des cellules beta
%production de glc, apport alim
EG0 = 1.44;
R0 = 864;
sigma = 43.2;
alpha = 20000;
params = [SI,di,pb,db,mb,R0,EG0,sigma,alpha];


%% Plot des courbes

newFonc = @(t,GIB) fonc_diabete_papier(t,GIB,params);
[t,y] = ode45(newFonc,tspan,GIB0);
plot(t,y);
xlabel('t');
ylabel('variables');
legend('G','I','B');


%% Simulation de l'EDO

% graphe de bifurcation ; on va faire varier R0
% on garde les valeurs des états stationnaires
%{
n = 100;
Gf = zeros(n,1);
R0_list = linspace(100,1000,n);
for c = 1:n
    R0 = R0_list(c);
    params = [SI,di,pb,db,mb,R0,EG0,sigma,alpha];
    newFonc = @(t,GIB) fonc_diabete_papier(t,GIB,params);
    [t,y] = ode45(newFonc,tspan,GIB0);
    Gf(c) = y(end,1);
end
plot(R0_list,Gf);
xlabel('G0');
ylabel('G*');
legend('G*(G0)');
%}





