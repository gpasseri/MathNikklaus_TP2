# Nettoyage des variables et de la console 
clc;
cla;
clear all;

# Définition des variables 
capital = 100000;
taux = 0.03;
nbAnnee = 10;
nbJour = nbAnnee / 365;

# Définition du premier point de chaque résultat : correspond au capital de base 
resultat(1) = capital;
resultat6Mois(1) = capital;
resultatFrequence(1) = capital; 

# ---- point n°1 -------------------------------------------------------------------

# Calcul de l'intérêt à un taux donné pour un nombre d'années défini 
function resultat = calculInteret(capital, taux, nbAnnee)
  resultat = capital * (1+taux)^nbAnnee;  
  return
endfunction

for i=1 : nbAnnee
  resultat(i+1) = calculInteret(capital, taux, i);
endfor

# ---- point n°2 -------------------------------------------------------------------

# Calcul de l'intérêt tous les 6 mois quand on l'enlève et on remet immédiatement le capital à un taux donné
function resultat = calculInteret6Mois(capital, taux, nbAnnee)
  resultat = capital * (1+taux/2)^(nbAnnee*2);  
  return
endfunction

for i=1 : nbAnnee
  resultat6Mois(i+1) = calculInteret6Mois(capital, taux, i);
endfor

%hold on;
%plot(resultat);
%plot(resultat6Mois);
%hold off;

# différence sur le nombre d'années
resultat6Mois(nbAnnee+1) - resultat(nbAnnee+1)

# ---- point n°3 -------------------------------------------------------------------
 
# Résultat en fin d'année selon un nombre de retraits annuel
function resultat = calculInteretSelonF(capital, taux, nbAnnee, nbRetrait)
  resultat = capital * (1+(taux/nbRetrait))^(nbAnnee*nbRetrait);  
  return
endfunction

hold on

# Afficher plutôt tableau différentiel 
for i=1 : 365
  for j=1 : nbAnnee
    resultatFrequence(j+1) = calculInteretSelonF(capital, taux, j, i);
  endfor
  plot(resultatFrequence);
  resultatFrequence = 0;
endfor

hold off

# Nettoyage des variables et de la console 
clc;
# cla;
clear all;

# Définition des variables 
capital = 100000;
taux = 0.03;
nbAnnee = 10;
nbJour = nbAnnee / 365;

# Définition du premier point de chaque résultat : correspond au capital de base 
resultat(1) = capital;
resultat6Mois(1) = capital;
resultatFrequence(1) = capital; 

# ---- point n°1 -------------------------------------------------------------------

# Calcul de l'intérêt à un taux donné pour un nombre d'années défini 
function resultat = calculInteret(capital, taux, nbAnnee)
  resultat = capital * (1+taux)^nbAnnee;  
  return
endfunction

for i=1 : nbAnnee
  resultat(i+1) = calculInteret(capital, taux, i);
endfor

# ---- point n°2 -------------------------------------------------------------------

# Calcul de l'intérêt tous les 6 mois quand on l'enlève et on remet immédiatement le capital à un taux donné
function resultat = calculInteret6Mois(capital, taux, nbAnnee)
  resultat = capital * (1+taux/2)^(nbAnnee*2);  
  return
endfunction

for i=1 : nbAnnee
  resultat6Mois(i+1) = calculInteret6Mois(capital, taux, i);
endfor

%hold on;
%plot(resultat);
%plot(resultat6Mois);
%hold off;

# différence sur le nombre d'années
resultat6Mois(nbAnnee) - resultat(nbAnnee);

# ---- point n°3 -------------------------------------------------------------------
 
# Résultat en fin d'année selon un nombre de retraits annuel
function resultat = calculInteretSelonF(capital, taux, nbAnnee, nbRetrait)
  resultat = capital * (1+(taux/nbRetrait))^(nbAnnee*nbRetrait);  
  return
endfunction

# hold on

for i=1 : 365
  tabResultats(i)  = calculInteretSelonF(capital, taux, nbAnnee, i);
 # plot(resultatFrequence);
 resultatFrequence = 0;
endfor

for i=1 : 365
  if  i > 1
    difference = tabResultats(i) - tabResultats(i - 1)
  endif 
  # strcat(int2str(i), ' nombre(s) de retraits au bout de ', {' '}, int2str(nbAnnee), ' donne un resultat de ', {' '}, int2str(tabResultats(i)), {' CHF '}) 
endfor

# ---- point n°4 -------------------------------------------------------------------

# Donne 0-0006 : converge vers 0
resultatGrandNbRetraits = calculInteretSelonF(capital, taux, nbAnnee, 1000) - calculInteretSelonF(capital, taux, nbAnnee, 999)

# On voit cette évolution également dans le point 3, en observant la différence de gain avec l'ajout un retrait de plus. 

# hold off