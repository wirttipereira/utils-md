#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import matplotlib.pyplot as plt


# In[2]:


perfil200=pd.read_csv("profile-200.xvg", skiprows=(16), delimiter="\t",names=["x","y"])


# Verifica as primeiras linhas, se importou direito

# In[3]:


print (perfil200.head())


# Inverte o sinal de x

# In[4]:


perfil200["x"]=perfil200["x"]*-1


# Imprime o máximo e o mínimo da curva

# In[5]:


#perfil200.min()
y_min=perfil200["y"].min()
y_max=perfil200["y"].max()
delta=y_max - y_min
print('min:',y_min, 'max:',y_max,'delta:',delta)


# gera o gráfico

# In[6]:


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

# In[7]:


p.get_figure().savefig("pmfEXP7.20200901.png")


# In[ ]:




