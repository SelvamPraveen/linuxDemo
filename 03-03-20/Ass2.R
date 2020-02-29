#Ass 2 PDF:Pg No.52
state.abb
VADeaths
df1<-data.frame(VADeaths)
total<-rowSums(df1)
class(total)
total1<-data.frame(total)
total1
df2<-cbind(total1,df1)
df2
#another method
#a<-data.frame(VADeaths)
#total<-rowSums(a)
#total
#a$total<-total
#a[,c(5,1:4)]