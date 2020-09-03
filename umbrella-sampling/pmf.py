#!/usr/bin/env python
# coding: utf-8

# In[10]:


import pandas as pd
import matplotlib.pyplot as plt
import math


# In[11]:


def truncate(n, decimals=0):
    multiplier = 10 ** decimals
    return int(n * multiplier) / multiplier


# In[12]:


perfil200=pd.read_csv("profile-200.xvg", skiprows=(16), delimiter="\t",names=["x","y"])


# Verifica as primeiras linhas, se importou direito

# In[13]:


print (perfil200.head())


# Inverte o sinal de x

# In[14]:


perfil200["x"]=perfil200["x"]*-1


# Imprime o máximo e o mínimo da curva

# In[15]:


#perfil200.min()
y_min=truncate(perfil200["y"].min(),2)
y_max=truncate(perfil200["y"].max(),2)
delta=truncate((y_max - y_min),2)
print('min:',y_min, 'max:',y_max,'delta:',delta)


# gera o gráfico

# In[16]:


p = perfil200.plot.line(x="x",y="y", grid=True, legend=False,figsize=(15,10))
p.set_title("PMF exp7", size=40)
p.set_xlabel("Distance / nm", size=20)
p.set_ylabel("Energy / KJ.mol-1", size=20)
p.text(2.2,-35,'min:'+str(y_min), size=20)
p.text(7.5,-10,'max:'+str(y_max),size=20)
p.text(7,-30,'delta:'+str(delta),size=20)
p.tick_params(labelsize=20)
plt.show()


# Salva o plot em arquivo

# In[17]:


p.get_figure().savefig("pmfEXP7.20200901.png")


# In[ ]:




