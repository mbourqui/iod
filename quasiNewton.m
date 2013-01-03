%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     	        
%                                                         %
% M�thodes de descente pour l''optimisation non lin�aire  %              
% sans contraintes                                        %              
% 					                  % 
% Bilge Atasoy - Michel Bierlaire				  % 
% TRANSP-OR Octobre 2012		                          % 
%  					                  % 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

function x = quasiNewton(f, x0, showDetails)

%clear; % n�cessaire pour l''interface graphique

 
%%%%%%%%%%%%%%%% 
% Interface    %	         		
%%%%%%%%%%%%%%%%
 
% nom de la fonction � minimiser, qui est sp�cifi�e dans le fichier 'f1.m'  
% et qui est d�clar�e sous forme de string

%fct = 'f' ; 
fct = f;
 
% point initial 

%x = feval('x') ; 
x = x0;
 
%%%%%%%%%%%%%%%%%%
% Parametres     %		   
%%%%%%%%%%%%%%%%%%
 
% pour le crit�re d''arr�t 

epsilon = 0.001 ; 
maxiter = 200   ;  
 
% taille de pas initial 

alpha = 1 ;
 
% initialisation du nombre d''iterations 

i=1 ;  
 
% initialisation de la matrice qui stocke tous les it�r�s 
% un it�r�=une colonne de cette matrice

stock(:,1) = x; 

%initialisation de bfgs pour la premiere iteration 
%il faut faire attention car cela peut partir tres loin 

[f,g,h] = feval(fct,x);
%H=[1 0;0 1];
H = h;
d= - inv(H)*g;
alpha  = taillepas_wolfe(fct,x,d);
x_old = x;
x = x + alpha * d;

i=2;
stock(:,2) = x; 

 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Boucle principale 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
 

% Critere d''arret: ( normGradient(fct,x) < epsilon ) OR ( i > maxiter )

while ( normGradient(fct,x) >= epsilon ) & ( i < maxiter )
  
%% BFGS
H = bfgs(fct,H,x,x_old);
[f,g,h] = feval(fct,x);
d = - inv(H) * g;
x_old = x;


% calculer le pas...

alpha  = taillepas_wolfe(fct,x,d);
%alpha  = taillepas_wolfe_1_2(fct,x,d);
    
% calcul du nouvel it�r� 

x = x + alpha * d;
 
% mise � jour du nombre d''iterations

i = i+1;   
 
% stockage de la valeur des diff�rents it�r�s   

stock(:,i)= x ; 
 
end 
 
% calcul la taille de la matrice contenant tous les it�r�s	  
    
taille = size(stock,2); 
     
% �valuation de la fonction en chaque point 
     
for i=1:taille 
valeurstock(i)=feval(fct,stock(:,i)); 
end 
     
  
%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Affichage des r�sultats  %				   
%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
if showDetails
    disp('Valeur de la suite des it�r�s :') ; 
    stock' 
end
disp('*****************************************')
disp(['Nombre d''it�rations :                   ' num2str(i-1)])
disp(['Valeur de la fonction � l''optimum : ' num2str(feval(fct,x))] ) ; 
disp('Valeur de l''optimum : ')  
xOptim = x' 
disp('*****************************************')
     
if showDetails
    % passage au module de visualisation de la fonction et des r�sultats 

    visual3d(fct, stock, valeurstock); 
end 
 
% sprintf('Nombre de fois que la boucle a �t� parcourue : %d',i)                    

end

