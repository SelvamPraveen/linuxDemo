#There are 3 patients(1,2,3).Observation is taken at time(1,2,3)for each patients. we are calculating oxygen content in Artilery
#oxygen content and cvein oxygen content. pao2 Normal distribution(mean=40,sd=8),pco2(mean=70,sd=10)
pid<-rep((1:3),each=3)
time<-rep((1:3),each=3)
pao2<-round(rnorm(9,mean=70,sd=10))
pco2<-round(rnorm(9,mean=40,sd=8))
pdata<-data.frame(pid,time,pao2,pco2)
ptdata<-melt(pdata,id=c("pid","time"),measure.vars = c("pao2","pco2"))
cast(ptdata,pid~variable,mean)