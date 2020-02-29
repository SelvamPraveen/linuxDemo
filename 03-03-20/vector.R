#create a vectore of 22 persons(m,f....)?
#create a factor and count(No.of m and f)?
#Replace M with male and F with Female?
m1<-c("m","f","m","m","m","f","f","f","m","f","m","m","m","m","m","m","m","f","f","f","m","m")
f1<-factor(m1)
summary(f1)
table(f1)
levels(f1)[1]<-"Female"
levels(f1)[2]<-"Male"
