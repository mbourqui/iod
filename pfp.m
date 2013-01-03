%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                         %
% Methodes de descente pour l'optimisation non lineaire   %
% sans contraintes                                        %
%                                                         %
% BOURQUI Marc                                            %
% CONSTANTIN Victor                                       %
% SCHORI Ian                                              %
% SIMOND Floriant                                         %
%                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function x = pfp(f, x0, alpha, useRL)

%%%%%%%%%%%%%%%% 
% Interface    %
%%%%%%%%%%%%%%%%
 
% nom de la fonction a minimiser, qui est specifiee dans le fichier 'f.m'  
% et qui est declaree sous forme de string
fct = f;
 
% point initial 
x = x0;
 
%%%%%%%%%%%%%%%%%%
% Parametres     %
%%%%%%%%%%%%%%%%%%
 
% pour le critere d'arret 
epsilon = 0.001 ; 
maxIter = 200   ;  

% initialisation du nombre d'iterations 
i=1 ;  
 
% initialisation de la matrice qui stocke tous les iterés 
% un iteré = une colonne de cette matrice

stock(:,i) = x0; 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Boucle principale            % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 

% Critere d'arret: x a ateint la precision demandée OU nb iterations max ateint

while ( normGradient(fct,stock(:,i)) >= epsilon ) && ( i < maxIter )
	% mise a jour du nombre d'iterations
	i = i+1;
	
	fprintf('Iteration number %d : x = [%f, %f]\n', i, stock(:,i-1)(1), stock(:,i-1)(2));
	% calcul et stockage de la valeur du nouveau x   
	stock(:,i) = pfpInnerLoop(fct, stock(:,i-1), alpha, useRL);

end 
 
% Calcul de la taille de la matrice contenant tous les x
taille = size(stock,2); 
     
% Evaluation de la fonction en chaque point    
for i=1:taille 
	valeurstock(i)=feval(fct,stock(:,i)); 
end 
     
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Affichage des résultats  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

disp('Valeur de la suite des x :') ; 
stock' 

disp('*****************************************')
disp(['Nombre d''iterations :                   ' num2str(i-1)])
disp(['Valeur de la fonction a l''optimum : ' num2str(feval(fct,stock(:,i)))] ) ; 
disp('Valeur de l''optimum : ')  
xOptim = stock(:,i)' 
disp('*****************************************')
         
% passage au module de visualisation de la fonction et des resultats 
    
visual3d(fct, stock, valeurstock);  
 
sprintf('Nombre de fois que la boucle a ete parcourue : %d',i)                    

clear;
end
