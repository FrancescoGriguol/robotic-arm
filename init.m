%% Esercitazione: Robot planare ridondante - init file 
%
% File di inizializzazione del modello Simulink per l'esercitazione di
% robotica spaziale "Robot planare ridondante"
% Membri del gruppo: Francesco Griguol & Francesco Finotti
% -------------------------------------------------------------------------

clear
clc
close all

%% Casi di simulazione
%
% - Scenario 1: traiettoria 1 + tempo 1
% - Scenario 2: traiettoria 1 + tempo 2
% - Scenario 3: traiettoria 2 + tempo 1
% - Scenario 4: traiettoria 2 + tempo 2

scenario = 1;
scenario_data;

%% Dati del manipolatore e proprietà dei servomotori

% Gradi di libertà del manipolatore
n = 4;

% Lunghezza dei link [m]
a1 = 1;
a2 = 0.9;
a3 = 0.5;
a4 = 0.3;
a = [a1 a2 a3 a4];
% Diametro esterno dei link [mm]
D_ext = 48;
% DIametro interno dei link [mm]
D_int = 43;

% Massa dei rotori [kg]
m_rot1 = 0.85;
m_rot2 = 0.7;
m_rot3 = 0.3;
m_rot4 = 0.3;
% Inerzia dei rotori [kg*m^2]
I_rot1 = 1e-4;
I_rot2 = 2e-4;
I_rot3 = 1e-4;
I_rot4 = 1e-4;
% Rapporto di riduzione [-]
kr = 100;
% Costante di velocità [V/rpm]
kv = 0.02;
% Costante di coppia [N*m/A]
kt = 0.2;
% Resistenza elettrica [Ohm]
Ra = 1.2;
% Induttanza [mH]
La = 0.463;


%% Matrici di guadagni positivi
Kd = 1;
Kp = 1;


% Conversione in radianti delle variabili di giunto 
q = qi;
q = deg2rad(q);
% Calcolo dello jacobiano analitico
Ja = zeros(3,4);

Ja(1,1) = -a(1)*sin(q(1))-a(2)*sin(q(1)+q(2))-a(3)*sin(q(1)+q(2)+q(3)) ...
    -a(4)*sin(q(1)+q(2)+q(3)+q(4));
Ja(1,2) = -a(2)*sin(q(1)+q(2))-a(3)*sin(q(1)+q(2)+q(3)) ...
    -a(4)*sin(q(1)+q(2)+q(3)+q(4));
Ja(1,3) = -a(3)*sin(q(1)+q(2)+q(3))-a(4)*sin(q(1)+q(2)+q(3)+q(4));
Ja(1,4) = -a(4)*sin(q(1)+q(2)+q(3)+q(4));

Ja(2,1) = a(1)*cos(q(1))+a(2)*cos(q(1)+q(2))+a(3)*cos(q(1)+q(2)+q(3))...
    +a(4)*cos(q(1)+q(2)+q(3)+q(4));
Ja(2,2) = a(2)*cos(q(1)+q(2))+a(3)*cos(q(1)+q(2)+q(3))...
    +a(4)*cos(q(1)+q(2)+q(3)+q(4));
Ja(2,3) = a(3)*cos(q(1)+q(2)+q(3))+a(4)*cos(q(1)+q(2)+q(3)+q(4));
Ja(2,4) = a(4)*cos(q(1)+q(2)+q(3)+q(4));

Ja(3,:) = 1;

% Calcolo della matrice pseudoinversa dello jacobiano
pJa = pinv(Ja);

% % Calcolo della derivata dello jacobiano
% dJa = zeros(3,4);
% 
% dJa(1,1) = -a(1)*cos(q(1))*dq(1)-a(2)*cos(q(1)+q(2))*(dq(1)+dq(2)) ...
%     -a(3)*cos(q(1)+q(2)+q(3))*(dq(1)+dq(2)+dq(3)) ...
%     -a(4)*cos(q(1)+q(2)+q(3)+q(4))*(dq(1)+dq(2)+dq(3)+dq(4));
% dJa(1,2) = -a(2)*cos(q(1)+q(2))*(dq(1)+dq(2)) ...
%     -a(3)*cos(q(1)+q(2)+q(3))*(dq(1)+dq(2)+dq(3)) ...
%     -a(4)*cos(q(1)+q(2)+q(3)+q(4))*(dq(1)+dq(2)+dq(3)+dq(4));
% dJa(1,3) = -a(3)*cos(q(1)+q(2)+q(3))*(dq(1)+dq(2)+dq(3)) ...
%     -a(4)*cos(q(1)+q(2)+q(3)+q(4))*(dq(1)+dq(2)+dq(3)+dq(4));
% dJa(1,4) = -a(4)*cos(q(1)+q(2)+q(3)+q(4))*(dq(1)+dq(2)+dq(3)+dq(4));
% 
% dJa(2,1) = -a(1)*sin(q(1))*dq(1)-a(2)*sin(q(1)+q(2))*(dq(1)+dq(2)) ...
%     -a(3)*sin(q(1)+q(2)+q(3))*(dq(1)+dq(2)+dq(3))...
%     -a(4)*sin(q(1)+q(2)+q(3)+q(4))*(dq(1)+dq(2)+dq(3)+dq(4));
% dJa(2,2) = -a(2)*sin(q(1)+q(2))*(dq(1)+dq(2)) ...
%     -a(3)*sin(q(1)+q(2)+q(3))*(dq(1)+dq(2)+dq(3))...
%     -a(4)*sin(q(1)+q(2)+q(3)+q(4))*(dq(1)+dq(2)+dq(3)+dq(4));
% dJa(2,3) = -a(3)*sin(q(1)+q(2)+q(3))*(dq(1)+dq(2)+dq(3))...
%     -a(4)*sin(q(1)+q(2)+q(3)+q(4))*(dq(1)+dq(2)+dq(3)+dq(4));
% dJa(2,4) = -a(4)*sin(q(1)+q(2)+q(3)+q(4))*(dq(1)+dq(2)+dq(3)+dq(4));
% 
% dJa(3,:) = 0;
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
