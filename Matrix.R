#creats matrix
m = matrix(c(2,6,5,1,10,4),nrow=2,ncol=3,byrow = TRUE)
#multiplys matrix by its transpose
t=m%*%t(m)
print(t)

v=c("Hello")
cnt=2
repeat{
  print(v)
  cnt=cnt+1
  if(cnt>5){
    break;
  }
}