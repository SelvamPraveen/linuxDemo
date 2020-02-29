w="statistics"
factor(substring(w,1:nchar(w),1:nchar(w)),levels=letters)
ff=factor(substring(w,1:nchar(w),1:nchar(w)),levels=letters)
ff[,drop=TRUE]
summary(ff[,drop=TRUE])