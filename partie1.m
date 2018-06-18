# ==== Initialisation ==============================================================  clc;  clear;# ==================================================================================# ==== Fonctions ===================================================================  #---- Fonction d'exemple ---------------------------------------------------------  #f = @(x) (3*x^2)+(2*x)+1;    f = @(x) ((3*x^4)/(2*x^3)+(5*x^2))^4+(10*x)+1;  #---- Fonction dérivée -----------------------------------------------------------  d = @(fct,x)((fct(x+1) - (fct(x))) / ((x+1) -(x)));  #---- dérivée n fois -------------------------------------------------------------  function result = derivee_Nfois(fct, n, nbrePoints)    # fonction de dérivée    d = @(fct,x)((fct(x+1) - (fct(x))) / ((x+1) -(x)));    # calcul de la première dérivée    for i=1:nbrePoints+n      Tab(i) = d(fct, i);    endfor    # calcul des autres dérivées si n < 1    if(n>1)      for j=2:n        for i=1:nbrePoints+n-j          Tab(i) = d(Tab, i);        endfor      endfor    endif    # efface le dernier point qui ne servait qu'à calculer le nème    # retourne le tableau de points    result = Tab(1:nbrePoints);    return  endfunction# ==================================================================================%# ==== Programme de test ===========================================================%%  #---- calcul des points de la fonction f -----------------------------------------%%  for i=1:100%    Tab_f(i) = f(i);%  endfor%%  #---- test de la fonction derivee_Nfois ------------------------------------------%%  Tab_d1 = derivee_Nfois(f, 1, 100); # 1ère dérivée de f%  Tab_d2 = derivee_Nfois(f, 2, 100); # 2ème dérivée de f%  Tab_d3 = derivee_Nfois(f, 3, 100); # 3ème dérivée de f%  Tab_d4 = derivee_Nfois(f, 7, 100); # 4ème dérivée de f%%  #---- Affichage ------------------------------------------------------------------%%  hold on%%  #plot(Tab_f);%  #plot(Tab_d1);%  #plot(Tab_d2);%  #plot(Tab_d3);%  plot(Tab_d4);%  %%  hold off%%# ==================================================================================# ==== Taylor ======================================================================  function result = Taylor(fct, point, iterations)    B = zeros(100,1);        for x=1:100      for i=1:iterations        A = derivee_Nfois(fct, i, point)(point);                B(x) += ((A * ((x-point)^i)) / (factorial(i)));      endfor    endfor    result = B;    return      endfunction B = Taylor(f, 10,8);  plot(B);  # =================================================================================