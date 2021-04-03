library(ggplot2)
tot <-read.csv("SouthAmerica.csv",TRUE,",")

plot("Argentina",type="b",lwd=2,
     xaxt="n",ylim=c(80076,2011727),col="blue",
     xlab="YEAR",ylab="Mortality Rate",
     main="Moratality rate in %")
axis(1,at=1:length(2017),labels=2017)
#lines("Argentina",col="red",type="b",lwd=2)
lines("Bolivia",col="green",type="b",lwd=2)
lines("Brazil",col="purple",type="b",lwd=2)
lines("Chile",col="black",type="b",lwd=2)
lines("Colombia",col="violet",type="b",lwd=2)
lines("Ecador",col="Grey",type="b",lwd=2)
lines("Guyana",col="Orange",type="b",lwd=2)
lines("Paraguay",col="pink",type="b",lwd=2)
lines("Peru",col="Cyan",type="b",lwd=2)
lines("Suriname",col="purple",type="b",lwd=2)
lines("Uruguay",col="brown",type="b",lwd=2)
lines("Venezuela",col="yellow",type="b",lwd=2)
legend("topleft",legend=c("Argentina","Bolivia","Brazil","Chile","Colombia","Ecador","Guyana","Paraguay","Peru","Suriname","Uruguay","Venezuela"),
       lty=1,lwd=2,pch=21,col=c("blue","red","green","purple","black"),
       ncol=2,bty="n",cex=0.8,
       text.col = c("blue","red","green","purple","black"),
       inset=0.01)
png(file="ENC222_0131-2018")
dev.off()