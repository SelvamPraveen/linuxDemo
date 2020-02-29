#airquality---dataframe
#Find Month-wise average temperature and average ozone value?
c<-airquality
d<-melt(c,id.vars = "Month",measure.vars = c("Ozone","Temp"),na.rm = TRUE)
cast(d,Month~variable,mean)
