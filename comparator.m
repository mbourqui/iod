%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compare les deux méthodes pour un jeu de données commun.      %
%                                                               %
%                                                               %
% BOURQUI Marc                                                  %
% CONSTANTIN Victor                                             %
% SCHORI Ian                                                    %
% SIMOND Floriant                                               %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


clear;


%*************************************************************************%
% 
% CONFIGURATION
%
%*************************************************************************%


% Afficher les détails (chaque xk de chaque itération) pour chaque méthode
showDetails = false; 

% Dessiner les graphs des comparaisons
drawPlots = false; 

% Exporter les graphes en .png
% ATTENTION: ces graphes sont importés dans rapport.tex!
exportPlots = false; 

% Comparer soit pfp/rl avec pfp/cauchy soit pfp/rl et qN
% true	:	compare pfp/rl avec pfp/cauchy
% false	:	compare pfp/rl ave qN
compareSteps = false; 

% Sélection de la méthode de génération de x0
% 0     :	utilise une matrice de x0 (vecteurs prédéfinis dans x.m)
% 1     :	utilise un x unique aléatoire (xrand.m)
% >1	:	utilise une suite générée de x0 (xsnake.m)
maxValues = 0;

% Exporter les données en .csv
% ATTENTION: ces données sont importées dans rapport.tex!
exportData = false;

% Valeurs initiales
fct = 'f';
epsilon = 0.00001;
solution = [2; -1]; % Utilisée pour déterminer la distance entre les résultats
% obtenus et la solution exacte (donnée ici)




%*************************************************************************%
% 
% NE PLUS RIEN CHANGER CI-DESSOUS, A MOINS DE SAVOIR CE QUE TU FAIS!
%
%*************************************************************************%



% Données pour l'exportation des résultats
counter=[];
tx01=[];
tx02=[];
txk1=[];
tfxk1=[];
titerations1=[];
txk2=[];
txfk2=[];
titerations2=[];
distance = [];

% Sélection du nombre de comparaisons à effectuer
if maxValues == 0
    max = x(0);
else
    max = maxValues;
end

% Sélection des x0
if maxValues > 1
    xs = xsnake(solution, max, 1);
end

for i = 1:max

    counter(i) = i; % Utilisé pour générer la matrice des résultats
    
    % Sélection du x0 courant
    if maxValues == 0
        x0 = x(i)
    elseif maxValues == 1
        x0 = xrand(50)
    else
        x0 = xs(i,:)'
    end

    tx01(i) = x0(1);
    tx02(i) = x0(2);

    % Notre implémentation de pfp avec la recherche linéaire
    [txk1(i,:), tfxk1(i), titerations1(i)] = pfp(fct, x0, epsilon, true, showDetails);

    if compareSteps
        % Notre implémentation de pfp avec le pas de Cauchy
        [txk2(i,:), txfk2(i), titerations2(i)]  = pfp(fct, x0, epsilon, false, showDetails);
        legend2 = 'Plus forte pente avec le pas de Cauchy';
    else 
        % Solution de quasi Newton
        [txk2(i,:), txfk2(i), titerations2(i)]  = quasiNewton(fct, x0, showDetails); 
        legend2 = 'Quasi-Newton';
    end

    % Matrice des distances (utilisée pour générer les graphes)
    if drawPlots
        % Distances
        distances(i,1) = norm(x0 - solution);
        distances(i,2) = titerations1(i);
        distances(i,3) = titerations2(i);
    end

end

% Export des résultats
if exportData
    % Tableau contenant les données
    data = [counter', tx01', tx02', txk1(:,1), txk1(:,2), tfxk1', titerations1', txk2(:,1), txk2(:,2), txfk2', titerations2'];
    format shortg, data; % Afin que les données soit pas au format scientifique

    % Export data
    if compareSteps
        csvwrite('compareSteps.csv',data);
    else 
        csvwrite('compareMethods.csv',data);
    end
end

% Plot graphics
if drawPlots
    sort(distances,1);
    
    % All-in-on plot
    plot(distances(:,1), distances(:,2), 'r.', distances(:,1), distances(:,3), 'b.');
    xlabel('Distance');
    ylabel('Nombre d''iterations');
    legend('Plus forte pente avec recherche lineaire', legend2, 'Location', 'NorthOutside');
    
    % Plot export
    if exportPlots
        if compareSteps
            print -dpng graphs/steps-allinone.png;
        else
            print -dpng graphs/methods-allinone.png;
        end
    end
    pause;
    close;

    % One plot per quarter -> 4 plots
    for i=1:4
        plot(distances(i:4:end,1), distances(i:4:end,2), 'r.', distances(i:4:end,1), distances(i:4:end,3), 'b.');
        xlabel('Distance');
        ylabel('Nombre d''iterations');
        legend('Plus forte pente avec recherche lineaire', legend2, 'Location', 'NorthOutside');
        
        % Plot export
        if exportPlots
            if compareSteps
                filename = strcat('graphs/steps-quarter-', num2str(i), '.png');
            else
                filename = strcat('graphs/methods-quarter-', num2str(i), '.png');
            end
            myprint = ['print -dpng ' filename];
            eval(myprint);
        end
        pause;
        close;
    end
end


clear;