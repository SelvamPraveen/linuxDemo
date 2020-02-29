#create a list with your name, languages known and the age? 
#Display your first language?
#Add one element married it should be True or False?
#Then Remove the Age?
list1<-list("Praveen",c("Tamil","English"),24)
names(list1)<-c("Name","Languages-known","Age")
list1[[2]][2]
list1[["Married"]]<-FALSE
list1[["Age"]]<-NULL