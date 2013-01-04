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

% Configuration
showDetails = false; % Utilisé pour afficher ou non les détails (chaque xk de chaque itération) pour chaque méthode
drawPlots = false; % Utilisé pour dessiner ou non les graphs des comparaisons
compareSteps = false; % Utilisé pour comparer soit pfp/rl avec pfp/cauchy soit pfp/rl et qN
maxValues = 0 % 0 pour utiliser x.m, 1 pour un x aléatoire, >1 pour x snake

% Valeurs initiales
fct = 'f';
epsilon = 0.00001;
solution = [2; -1];


% Données pour l'exportation
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

if maxValues > 0
    max = maxValues;
else
    max = x(0);
end

if maxValues > 1
    xs = xsnake(solution, max, 1);
end

for i = 1:max

    counter(i) = i;
    
    if true
    
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

        % Distances
        distances(i,1) = norm(x0 - solution);
        distances(i,2) = titerations1(i);
        distances(i,3) = titerations2(i);
    end
end

% Tableau contenant les données
data = [counter', tx01', tx02', txk1(:,1), txk1(:,2), tfxk1', titerations1', txk2(:,1), txk2(:,2), txfk2', titerations2'];
format shortg, data; % Afin que les données soit pas au format scientifique

% Export des valeurs
if compareSteps
    csvwrite('compareSteps.csv',data);
else 
    csvwrite('compareMethods.csv',data);
end

% Plot graphics
sort(distances,1);
if drawPlots
    plot(distances(:,1), distances(:,2), 'r.', distances(:,1), distances(:,3), 'b.');
    xlabel('Distance');
    ylabel('Nombre d''iterations');
    legend('Plus forte pente avec recherche lineaire', legend2, 'Location', 'NorthOutside');
    if compareSteps
        print -dpng graphs/steps-allinone.png;
    else
        print -dpng graphs/methods-allinone.png;
    end
    pause;
    close;
end

if drawPlots
    for i=1:4
        plot(distances(i:4:end,1), distances(i:4:end,2), 'r.', distances(i:4:end,1), distances(i:4:end,3), 'b.');
        xlabel('Distance');
        ylabel('Nombre d''iterations');
        legend('Plus forte pente avec recherche lineaire', legend2, 'Location', 'NorthOutside');
        if compareSteps
            filename = strcat('graphs/steps-quarter-', num2str(i), '.png');
        else
            filename = strcat('graphs/methods-quarter-', num2str(i), '.png');
        end
        myprint = ['print -dpng ' filename];
        eval(myprint);
        pause;
        close;
    end
end


clear;