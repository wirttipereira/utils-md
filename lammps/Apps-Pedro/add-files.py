f1 ='d1.dat' #arquivo onde os passos devem ser adicionados
f2='d2.dat' #arquivo onde os passos devem ser adicionados
f3 ='d3.dat' #arquivo onde os passos devem ser adicionados
f4 ='d4.dat' #arquivo onde os passos devem ser adicionados
import numpy as np 
criar = open('distancia-ele.dat', 'a+')
fname = open(f1,'r')
criar.write(fname.read())
fname.close()
c1= len(open(f1).readlines())
c2= c1+len(open(f2).readlines())
c3= c2+len(open(f3).readlines())
def l_append(f,count):
    l=np.loadtxt(f)
    c=[] # 1 coluna
    d=[]  # 2 coluna
    e=[]  # 3 coluna
    f=[]  # 4 coluna
    g=[]  # 5 coluna
    for j,k,m,n,o in l:
        j=j+count
        k=k
        c.append(j)
        o=o
        m=m
        n=n
        d.append(k)
        e.append(m)
        f.append(n)
        g.append(o)
    np.savetxt(criar, np.c_[c,d,e,f,g], delimiter='  ',fmt=('%5d  %.4f  %.4f  %.4f  %.4f'))  
l_append(f2,c1)
l_append(f3,c2)
l_append(f4,c3)
criar.close()

