#!/usr/local/bin/python3
#!/usr/bin/python3
##!/scratch/app/python/3.8.2-gcc-7.4-gnu/bin/python3

##RGP - 1.9.2020
##module load python/3.8.2

import pandas as pd
import matplotlib.pyplot as plt

perfil200=pd.read_csv("profile-200.xvg", skiprows=(16), delimiter="\t",names=["x","y"])
print (perfil200.head())

perfil200["x"]=perfil200["x"]*-1

print perfil200.min(level="y"), perfil200.max(level="y")

perfil200.plot.line(x="x",y="y")
plt.show()


