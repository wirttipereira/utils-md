
# 3.1
#executa o packmol. O arquivo de saida eh o mistura.xyz
packmol < monta.inp

# 3.2
#faz uma copia do mistura.xyz
#Saida: mistura.xyz.original
cp mistura.xyz mistura.xyz.original

# 3.3
# Tira as duas primeiras linhas do arquivo mistura.xyz
tail -n +3 mistura.xyz > mistura.xyz.tmp && mv mistura.xyz.tmp mistura.xyz

# 4.2
#Compila o conversor. O arquivo de saida eh o conv.x
gfortran convert_xyz_2_gro.f90 -o conv.x -O3

# 4.5
# Roda o conversor compilado ./conv.x
./conv.x

# 5
# Gera o topol.tpr
/usr/local/gromacs/bin/grompp -f md.mdp -c mistura.gro -p topol.top

# opcao -o topol.tpr
