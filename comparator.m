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

% Valeurs initiales
fct = 'f';
%x0 = x(randsample(x(0), 1)) % choisir ici une paire de valeurs prédéfinies dans x.m
epsilon = 0.00001;

tx01=[];
tx02=[];
txk1=[];
tfxk1=[];
titerations1=[];
txk2=[];
txfk2=[];
titerations2=[];


for i = 1:x(0)

    x0 = x(i)
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
end

data = [tx01', tx02', txk1(:,1), txk1(:,2), tfxk1', titerations1', txk2(:,1), txk2(:,2), txfk2', titerations2'];
format shortg, data;
csvwrite('output.csv',data);

clear;