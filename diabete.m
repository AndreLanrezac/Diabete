close all

tspan = linspace(0,50,100);

%% Valeurs intiales : 
G0 = 120;
I0 = 10;
B0 = 250;
GIB0 = [G0,I0,B0];

%% Param�tres : 

% Sensibilit� des cellules beta � l'action de l'insuline
% = d�gradation du glucose
S = 0.72;

p_i = 1; %coef de production d'insuline
di = 432; %coef de d�gradation de l'insuine

pb = 0.84*10^-3; %coef de prolif�ration des cellules beta en fonc du glc
db = 0.23*10^-3; %d�gradation des cellules beta en fonc du glc^2
mb = 0.06; %mort des cellules beta
g0 = 100 ; %production de glc, apport alim

params = [S,pi,di,pb,db,mb,g0];

%% Simulation de l'EDO

% Handle de la fonction

% graphe de bifurcation ; on va faire varier G0
% on garde les valeurs des �tats stationnaires

%{
n = 100;
Gf = zeros(n,1);
g0_list = linspace(0.01,0.1,n);
for c = 1:1
    %g0 = g0_list(c);
    g0 = 10^-6;
    params = [S,pi,di,pb,db,mb,g0];
    newFonc = @(t,GIB) fonc_diabete(t,GIB,params);
    [t,y] = ode45(newFonc,tspan,GIB0);
    Gf(c) = y(end,3);
end
plot(t,y(:,3));
xlabel('t');
ylabel('B');
%}

%plot(g0_list,Gf);
%xlabel('G0');
%ylabel('B*');
%legend('B*(G0)');
params = [S,pi,di,pb,db,mb,g0];
newFonc = @(t,GIB) fonc_diabete_papier(t,GIB,params);
[t,y] = ode45(newFonc,tspan,GIB0);
plot(t,y);
xlabel('t');
ylabel('variables');
legend('G','I','B');






