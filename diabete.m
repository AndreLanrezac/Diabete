close all

tspan = linspace(0,40,100);

%% Valeurs intiales : 
G0 = 1;
I0 = 1;
B0 = 1;
GIB0 = [G0,I0,B0];

%% Paramètres : 

% Sensibilité des cellules beta à l'action de l'insuline
% = dégradation du glucose
S = 1;

p_i = 2; %coef de production d'insuline
di = 1; %coef de dégradation de l'insuine

pb = 1; %coef de prolifération des cellules beta en fonc du glc
db = 0.01; %dégradation des cellules beta en fonc du glc^2
mb = 1; %mort des cellules beta
G0 = 0.3; %production de glc, apport alim

params = [S,pi,di,pb,db,mb,G0];

%% Simulation de l'EDO

% Handle de la fonction

newFonc = @(t,GIB) fonc_diabete(t,GIB,params);

[t,y] = ode45(newFonc,tspan,GIB0);

plot(t,y);
xlabel('t');
ylabel('variables');
legend('G','I','B');






