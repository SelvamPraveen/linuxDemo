#For dataframe sets, Find typewise sum of incidents? Library(MAss),ships----dataframe?
library(MASS)
library(reshape)
a<-ships
b<-melt(a,id.vars = "type",measure.vars = "incidents")
cast(b,type~variable,sum)
#Another Method
#library(MASS)
#a<-ships
#b<-melt(a,id=c("type","year"))
#cast(b,type~variable,sum)