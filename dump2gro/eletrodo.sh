fftool 1 eletrodo.xyz -b 1000 #gera pack.inp
packmol < pack.inp
fftool 1 eletrodo.xyz -b 1000 -g #gera run.mdp, field.top e config.pdb
