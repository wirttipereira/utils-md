#Rafael Guimaraes Pereira#24.Fev.2020#funcao para calcular ACF (autocorrelation function)##Ref. Allen-Tieldesley 1991, pp 185inicio=clock;clcfprintf("\nPrograma ACF \n")fprintf("================\n")#A = load('teste.txt');A = load('pressure_head.dat');#A = load('pre100k.dat');#A = load('pressure.dat');tempo = A(:,1);Ax = A(:,2);Ay = A(:,3);Az = A(:,4);incremento = tempo(2)-tempo(1)n_linhas = length(Ax)skip = 5n_passos = n_linhas / skipt = 1#inicializa vetoresACF(1:n_passos) = 0;eixo_x(1:n_passos) = 0;#==================for i = 1:n_passos  ACF(i) = ACF(i) + (sum(Ax(t)*Ax(t:n_linhas)) + sum(Ay(t)*Ay(t:n_linhas)) + sum(Az(t)*Az(t:n_linhas)))/(3 * t);  t = i * skip;  eixo_x(i) = t * incremento;endfor#ACF = ACF / (3*n_passos);resp = [eixo_x', ACF'];final=clock;elapsed=final-iniciosave 'acf.out' resp  #for j = t:n_linhas    #echo on;    #i    #j    #Ax(i)    #Ax(j)    #ACF(i) = ACF(i) + Ax(i)*Ax(j) + Ay(i)*Ay(j) + Az(i)*Az(j) ;        #ACF(i) = ACF(i) + Ax(t)*Ax(j) + Ay(t)*Ay(j) + Az(t)*Az(j) ;      #echo off;  #endfor