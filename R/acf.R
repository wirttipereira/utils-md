
x <- (pressure$X2^2+pressure$X3^2+pressure$X4^2)^0.5

a1<-acf(x) #lag.max=200
#attributes(a1)
#a1$acf
write.table(a1$acf, file="a1.csv", sep="\t",row.names=F)
write.table(a2$acf, file="a2.csv", sep="\t",row.names=F)

#integral
cs<-cumsum(a2$acf)
plot(cs)