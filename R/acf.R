
x <- (pressure$X2^2+pressure$X3^2+pressure$X4^2)^0.5

a1<-acf(x) #lag.max=200
#attributes(a1)
#a1$acf
write.table(a1$acf, file="a1.csv", sep="\t",row.names=F)
write.table(a2$acf, file="a2.csv", sep="\t",row.names=F)

#integral
cs<-cumsum(a2$acf)
plot(cs)

#importa 
library(readr)


##loop nao pronto - inicio
v <- seq(0,18000,1000)
conf<-1:19
for (i in v){
  print(i)
  conf[i] <- read_table2(paste0("stat-umbrella/8e9/conf",i,"_pullf.xvg"),col_names = FALSE, skip = 16)
  hist(conf[i]$X2)
}
## loop nao pronto -fim


conf0_pullf <- read_table2("stat-umbrella/8e9/conf0_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf0_pullf$X2, main="0nm, gas")

conf1000_pullf <- read_table2("stat-umbrella/8e9/conf1000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf1000_pullf$X2, main="1nm, gas")

conf2000_pullf <- read_table2("stat-umbrella/8e9/conf2000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf2000_pullf$X2, main="2nm, gas")

conf3000_pullf <- read_table2("stat-umbrella/8e9/conf3000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf3000_pullf$X2, main="3nm, ele 0.75")

conf4000_pullf <- read_table2("stat-umbrella/8e9/conf4000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf4000_pullf$X2, main="4nm, ele 0.75")

conf5000_pullf <- read_table2("stat-umbrella/8e9/conf5000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf5000_pullf$X2, main="5nm, ele 0.75")

conf6000_pullf <- read_table2("stat-umbrella/8e9/conf6000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf6000_pullf$X2, main="6nm, bulk")

conf7000_pullf <- read_table2("stat-umbrella/8e9/conf7000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf7000_pullf$X2, main="7nm, bulk")

conf8000_pullf <- read_table2("stat-umbrella/8e9/conf8000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf8000_pullf$X2, main="8nm, bulk")

conf9000_pullf <- read_table2("stat-umbrella/8e9/conf9000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf9000_pullf$X2, main="9nm, bulk")

conf10000_pullf <- read_table2("stat-umbrella/8e9/conf10000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf10000_pullf$X2, main="10nm, bulk")

conf11000_pullf <- read_table2("stat-umbrella/8e9/conf11000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf11000_pullf$X2, main="11nm, bulk")

conf12000_pullf <- read_table2("stat-umbrella/8e9/conf12000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf12000_pullf$X2, main="12nm, bulk")

conf13000_pullf <- read_table2("stat-umbrella/8e9/conf13000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf13000_pullf$X2, main="13nm, bulk")

conf14000_pullf <- read_table2("stat-umbrella/8e9/conf14000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf14000_pullf$X2, main="14nm, ele 1.5nm")

conf15000_pullf <- read_table2("stat-umbrella/8e9/conf15000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf15000_pullf$X2, main="15nm, ele 1.5nm")

conf16000_pullf <- read_table2("stat-umbrella/8e9/conf16000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf16000_pullf$X2, main="16nm, ele 1.5nm")

conf17000_pullf <- read_table2("stat-umbrella/8e9/conf17000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf17000_pullf$X2, main="17nm, gas")

conf18000_pullf <- read_table2("stat-umbrella/8e9/conf18000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf18000_pullf$X2, main="18nm, gas")

a0 <- data.frame(forca=conf0_pullf$X2)
a1 <- data.frame(forca=conf1000_pullf$X2)
a2 <- data.frame(forca=conf2000_pullf$X2)
a3 <- data.frame(forca=conf3000_pullf$X2)
a4 <- data.frame(forca=conf4000_pullf$X2)
a5 <- data.frame(forca=conf5000_pullf$X2)
a6 <- data.frame(forca=conf6000_pullf$X2)
a7 <- data.frame(forca=conf7000_pullf$X2)
a8 <- data.frame(forca=conf8000_pullf$X2)
a9 <- data.frame(forca=conf9000_pullf$X2)
a10 <- data.frame(forca=conf10000_pullf$X2)
a11 <- data.frame(forca=conf11000_pullf$X2)
a12 <- data.frame(forca=conf12000_pullf$X2)
a13 <- data.frame(forca=conf13000_pullf$X2)
a14 <- data.frame(forca=conf14000_pullf$X2)
a15 <- data.frame(forca=conf15000_pullf$X2)
a16 <- data.frame(forca=conf16000_pullf$X2)
a17 <- data.frame(forca=conf17000_pullf$X2)
a18 <- data.frame(forca=conf18000_pullf$X2)

a0$dist <- '0nm - gas'
a1$dist <- '1nm - gas'
a2$dist <- '2nm - gas'
a3$dist <- '3nm - le esq 0.75'
a4$dist <- '4nm - el esq 0.75'
a5$dist <- '5nm - el esq 0.75'
a6$dist <- '6nm - bulk'
a7$dist <- '7nm - bulk'
a8$dist <- '8nm - bulk'
a9$dist <- '9nm - bulk'
a10$dist <- '10nm - bulk'
a11$dist <- '11nm - bulk'
a12$dist <- '12nm - bulk'
a13$dist <- '13nm - bulk'
a14$dist <- '14nm - el dir 1.5'
a15$dist <- '15nm - el dir 1.5'
a16$dist <- '16nm - el dir 1.5'
a17$dist <- '17nm - gas'
a18$dist <- '18nm - gas'
combinado <- rbind(a0,a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,a16,a17,a18)
library(ggplot2)
#ggplot(combinado, aes(forca,fill = dist)) + geom_density(alpha = 0.4) + xlab("Force / (kJ/mol/nm)")
ggplot(combinado, aes(forca,color = dist)) + geom_density(alpha = 0.4) + xlab("Force / (kJ/mol/nm)")

#curtose, medida de achatamento da curva normal
curtose <- c(kurtosis(a0$forca),kurtosis(a1$forca),kurtosis(a2$forca),kurtosis(a3$forca),kurtosis(a4$forca),kurtosis(a5$forca),kurtosis(a6$forca),kurtosis(a7$forca),kurtosis(a8$forca),kurtosis(a9$forca),kurtosis(a10$forca),kurtosis(a11$forca),kurtosis(a12$forca),kurtosis(a13$forca),kurtosis(a14$forca),kurtosis(a15$forca),kurtosis(a16$forca),kurtosis(a17$forca),kurtosis(a18$forca))
curtose <- cbind(0:18, curtose)


### EXP21

conf0_pullf <- read_table2("stat-umbrella/21/conf0_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf0_pullf$X2, main="0nm, gas")

conf1000_pullf <- read_table2("stat-umbrella/21/conf1000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf1000_pullf$X2, main="1nm, gas")

conf2000_pullf <- read_table2("stat-umbrella/21/conf2000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf2000_pullf$X2, main="2nm, gas")

conf3000_pullf <- read_table2("stat-umbrella/21/conf3000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf3000_pullf$X2, main="3nm, ele 0.75")

conf4000_pullf <- read_table2("stat-umbrella/21/conf4000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf4000_pullf$X2, main="4nm, ele 0.75")

conf5000_pullf <- read_table2("stat-umbrella/21/conf5000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf5000_pullf$X2, main="5nm, ele 0.75")

conf6000_pullf <- read_table2("stat-umbrella/21/conf6000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf6000_pullf$X2, main="6nm, bulk")

conf7000_pullf <- read_table2("stat-umbrella/21/conf7000_pullf.xvg", col_names = FALSE, skip = 16)
hist(conf7000_pullf$X2, main="7nm, bulk")

a0 <- data.frame(forca=conf0_pullf$X2)
a1 <- data.frame(forca=conf1000_pullf$X2)
a2 <- data.frame(forca=conf2000_pullf$X2)
a3 <- data.frame(forca=conf3000_pullf$X2)
a4 <- data.frame(forca=conf4000_pullf$X2)
a5 <- data.frame(forca=conf5000_pullf$X2)
a6 <- data.frame(forca=conf6000_pullf$X2)
a7 <- data.frame(forca=conf7000_pullf$X2)


a0$dist <- '0nm - gas'
a1$dist <- '1nm - gas'
a2$dist <- '2nm - gas'
a3$dist <- '3nm - le esq 0.75'
a4$dist <- '4nm - el esq 0.75'
a5$dist <- '5nm - el esq 0.75'
a6$dist <- '6nm - bulk'
a7$dist <- '7nm - bulk'

combinado <- rbind(a0,a1,a2,a3,a4,a5,a6,a7)
library(ggplot2)
#ggplot(combinado, aes(forca,fill = dist)) + geom_density(alpha = 0.4) + xlab("Force / (kJ/mol/nm)")
ggplot(combinado, aes(forca,color = dist)) + geom_density(alpha = 0.4) + xlab("Force / (kJ/mol/nm)")

#curtose, medida de achatamento da curva normal
curtose <- c(kurtosis(a0$forca),kurtosis(a1$forca),kurtosis(a2$forca),kurtosis(a3$forca),kurtosis(a4$forca),kurtosis(a5$forca),kurtosis(a6$forca),kurtosis(a7$forca))
curtose <- cbind(0:7, curtose)
