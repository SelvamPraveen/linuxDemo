#create two list, one list is with 3 elements(1,2,3).Another list(sunday,monday,tuesday)?
#Merge the two list?Create a vector from your list?
# To crate a command for list to vector, we need to first unlist()
list1<-list(c(1,2,3))
list2<-list(c("Sunday","Monday","Tuesday"))
list3<-c(list1,list2)
list4<-unlist(list1)
sum(list4)
list5<-unlist(list2)
length(list5)