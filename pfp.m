%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     	        
%                                                         %
% Methodes de descente pour l'optimisation non lineaire   %              
% sans contraintes                                        %              
% 					                                      % 
% noms				          % 
%  					                                      % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function x = pfp_launcher(f, x0, alpha)
 
%clear; % necessaire pour l''interface graphique
 
%%%%%%%%%%%%%%%% 
% Interface    %	         		
%%%%%%%%%%%%%%%%
 
% nom de la fonction a minimiser, qui est specifiee dans le fichier 'f.m'  
% et qui est declaree sous forme de string
%fct = 'f' ; 
fct = f;
 
% point initial 
x = x0
 
%%%%%%%%%%%%%%%%%%
% Parametres     %		   
%%%%%%%%%%%%%%%%%%
 
% pour le critere d'arret 
epsilon = 0.001 ; 
maxiter = 200   ;  
 
% initialisation du nombre d'iterations 
i=1 ;  
 
% initialisation de la matrice qui stocke tous les itererations 
% une itereration=une colonne de cette matrice

stock(:,1) = x0; 
 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Boucle principale 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 

% Critere d'arret: x a ateint la precision demandée OU nb iterations max ateint

while ( normGradient(fct,stock(:,i)) >= epsilon ) && ( i < maxiter )
	% mise a jour du nombre d'iterations
	i = i+1; 

	% clacul et stockage de la valeur du nouveau x   
	stock(:,i) = pfpInnerLoop(fct, stock(:,i-1), alpha);

end 
 
% calcul la taille de la matrice contenant tous les x
taille = size(stock,2); 
     
% evaluation de la fonction en chaque point    
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


