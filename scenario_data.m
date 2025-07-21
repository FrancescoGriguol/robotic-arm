% Script che setta i dati per le due traiettorie previste per
% l'esercitazione

switch scenario
    
    case 1

        % Tempo di esecuzione del task
        tf = 4;                         % [s]
        % Posa iniziale dell'end effector 
        pi = [2.45 0.05 0]';          % [m m deg]
        % Configurazione iniziale delle variabili di giunto
        qi = [30 -60 30 0]';       % [deg deg deg deg]
        % Posa finale dell'end effector
        pf = [0.5 2.3 90]';             % [m m deg]
        % Inizializzazione della configurazione finale delle variabili di 
        % giunto
        qf = [0 0 0 0]';

    case 2

        % Tempo di esecuzione del task
        tf = 10;                        % [s]
        % Posa iniziale dell'end effector 
        pi = [2.45 0.05 0]';          % [m m deg]
        % Configurazione iniziale delle variabili di giunto
        qi = [30 -60 30 0]';       % [deg deg deg deg]
        % Posa finale dell'end effector
        pf = [0.5 2.3 90]';             % [m m deg]
        % Inizializzazione della configurazione finale delle variabili di 
        % giunto
        qf = [0 0 0 0]';

    case 3

        % Tempo di esecuzione del task
        tf = 4;                            % [s]
        % Posa iniziale dell'end effector 
        pi = [-0.90 0.06 178]';          % [m m deg]
        % Configurazione iniziale delle variabili di giunto
        qi = [178 -178 178 0]';       % [deg deg deg deg]
        % Posa finale dell'end effector
        pf = [-1.6 0.9 180]';              % [m m deg]
        % Inizializzazione della configurazione finale delle variabili di 
        % giunto
        qf = [0 0 0 0]';

    case 4

        % Tempo di esecuzione del task
        tf = 10;                            % [s]
        % Posa iniziale dell'end effector 
        pi = [-0.90 0.06 178]';          % [m m deg]
        % Configurazione iniziale delle variabili di giunto
        qi = [178 -178 178 0]';       % [deg deg deg deg]
        % Posa finale dell'end effector
        pf = [-1.6 0.9 180]';              % [m m deg]
        % Inizializzazione della configurazione finale delle variabili di 
        % giunto
        qf = [0 0 0 0]';     
        
end

