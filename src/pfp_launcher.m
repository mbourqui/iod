%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     	        
%                                                         %
% M�thodes de descente pour l''optimisation non lin�aire  %              
% sans contraintes                                        %              
% 					                  % 
% Bilge Atasoy - Michel Bierlaire				  % 
% TRANSP-OR Octobre 2012		                          % 
%  					                  % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
function x = pfp_launcher(f, x0, alpha)
 
clear; % n�cessaire pour l''interface graphique
 
%%%%%%%%%%%%%%%% 
% Interface    %	         		
%%%%%%%%%%%%%%%%
 
% nom de la fonction � minimiser, qui est sp�cifi�e dans le fichier 'f1.m'  
% et qui est d�clar�e sous forme de string

fct = f ; 
 
% point initial 

x = x0;
%x = feval('x') ; 
 
%%%%%%%%%%%%%%%%%%
% Parametres     %		   
%%%%%%%%%%%%%%%%%%
 
% pour le crit�re d''arr�t 

epsilon = 0.001 ; 
maxiter = 200   ;  
 
% taille de pas initial 

%alpha = 1 ;
 
% initialisation du nombre d''iterations 

i=1 ;  
 
% initialisation de la matrice qui stocke tous les it�r�s 
% un it�r�=une colonne de cette matrice

stock(:,1) = x0; 

%initialisation de bfgs pour la premiere iteration 
%il faut faire attention car cela peut partir tres loin 

%[f,g,h] = feval(fct,x);
%alpha = rl(f, x, d, alpha, beta1, beta2, lambda);
% alpha with method (b)

%x = x + alpha * d;

%i=2;
%stock(:,2) = x; 

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Boucle principale 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 

% Critere d''arret: ( normGradient(fct,x) < epsilon ) OR ( i > maxiter )

while ( normGradient(fct,stock(:,i)) >= epsilon ) && ( i < maxiter )
  
%% PFP


% mise � jour du nombre d''iterations

i = i+1; 

% stockage de la valeur des diff�rents it�r�s   

stock(:,i) = pfp(fct, stock(:,i-1), alpha);
 
 
 
end 
 
% calcul la taille de la matrice contenant tous les it�r�s	  
    
taille = size(stock,2); 
     
% �valuation de la fonction en chaque point 
     
for i=1:taille 
valeurstock(i)=feval(fct,stock(:,i)); 
end 
     
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Affichage des résultats  %				   
%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

disp('Valeur de la suite des it�r�s :') ; 
stock' 

disp('*****************************************')
disp(['Nombre d''it�rations :                   ' num2str(i-1)])
disp(['Valeur de la fonction � l''optimum : ' num2str(feval(fct,stock(:,i)))] ) ; 
disp('Valeur de l''optimum : ')  
xOptim = stock(:,i)' 
disp('*****************************************')
         
% passage au module de visualisation de la fonction et des r�sultats 
    
visual3d(fct, stock, valeurstock); 
     
clear; 
 
% sprintf('Nombre de fois que la boucle a �t� parcourue : %d',i)                    
end


