%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Compare les deux méthodes pour un jeu de données commun.		%
%																%
%																%
% BOURQUI Marc													%	
% CONSTANTIN Victor												%
% SCHORI Ian                                                    %
% SIMOND Floriant                                               %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear;

% Configuration
showDetails = false;
compareSteps = false;
maxValues = 10; % 0 pour utiliser x.m, 1 pour un x aléatoire, > 1 pour x snake

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

if maxValues > 0
    max = maxValues;
else
    max = x(0);
end

distance = [];

for i = 1:max

    counter(i) = i;
    
    if true
    
        if maxValues == 0
            x0 = x(i)
        elseif maxValues == 1
            x0 = xrand(10)
        else
            x0 = xsnake(max, 1, i)
        end
        
        tx01(i) = x0(1);
        tx02(i) = x0(2);

        % Notre implémentation de pfp
        [txk1(i,:), tfxk1(i), titerations1(i)] = pfp(fct, x0, epsilon, true, showDetails);

        if compareSteps  
            [txk2(i,:), txfk2(i), titerations2(i)]  = pfp(fct, x0, epsilon, false, showDetails);
        else 
            % Solution de quasi Newton
            [txk2(i,:), txfk2(i), titerations2(i)]  = quasiNewton(fct, x0, showDetails); 
        end

        % Distances
        distances(i,1) = norm(x0 - solution);
        distances(i,2) = titerations1(i);
        distances(i,3) = titerations2(i);
    end
end

data = [counter', tx01', tx02', txk1(:,1), txk1(:,2), tfxk1', titerations1', txk2(:,1), txk2(:,2), txfk2', titerations2'];
format shortg, data;
sort(distances,1)
plot(distances(:,1), distances(:,2), 'r.', distances(:,1), distances(:,3), 'b.');
if compareSteps
    csvwrite('compareSteps.csv',data);
else 
    csvwrite('compareMethods.csv',data);
end

clear;