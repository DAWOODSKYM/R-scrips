data<- read.csv("SouthAmerica.csv")
png(file="SouthAmerica.png")
plot('YEAR',type="b",col="red",
ylim=c(10,400),xlim=c(1,5),xlab="Year",ylab="country",main="South america")
#lines(data$Argentina,type="o",col="blue")
lines(data$Bolivia,col="green",type="b",lwd=2)
lines(data$Brazil,col="purple",type="b",lwd=2)
lines(data$Chile,col="black",type="b",lwd=2)
lines(data$Colombia,col="violet",type="b",lwd=2)
lines(data$Ecador,col="Grey",type="b",lwd=2)
lines(data$Guyana,col="Orange",type="b",lwd=2)
lines(data$Paraguay,col="pink",type="b",lwd=2)
lines(data$Peru,col="Cyan",type="b",lwd=2)
lines(data$Suriname,col="purple",type="b",lwd=2)
lines(data$Uruguay,col="brown",type="b",lwd=2)
lines(data$Venezuela,col="yellow",type="b",lwd=2)
legend("topleft",legend=c("Argentina","Bolivia","Brazil","Chile","Colombia","Ecador","Guyana","Paraguay","Peru","Suriname","Uruguay","Venezuela"),
       lty=1,lwd=2,pch=21,col=c("blue","red","green","purple","black"),
       ncol=2,bty="n",cex=0.8,
       text.col = c("blue","red","green","purple","black"),
       inset=0.01)
dev.off()
#print(data)