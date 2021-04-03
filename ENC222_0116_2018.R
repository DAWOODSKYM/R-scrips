tot <-read.csv("data.csv",header=TRUE,",")
#print(tot)
plot('CYPRUS',type="b",lwd=2,
     xaxt="n",ylim=c(15,120),col="blue",
     xlab="YEAR",ylab="%of birth registration",
     main="%of birth registration in Middle East")
axis(1,at=1:length("2019"),labels=2019)
lines('IRAN',col="red",type="b",lwd=2)
lines('IRAQ',col="green",type="b",lwd=2)
lines('JORDAN',col="purple",type="b",lwd=2)
lines('LEBANON',col="black",type="b",lwd=2)
lines('OMAN',col="yellow",type="b",lwd=2)
lines('QATAR',col="violet",type="b",lwd=2)
lines('SYRIA',col="pink",type="b",lwd=2)
lines('TURKEY',col="orange",type="b",lwd=2)
lines('YEMEN',col="brown",type="b",lwd=2)

legend("left",legend=c("CYPRUS","IRAN","IRAQ","JORDAN","LEBANON","OMAN","QATAR","SYRIA","TURKEY","YEMEN"),
       lty=1,lwd=2,pch=21,col=c("blue","red","green","purple","black","yellow","violet","pink","orange","brown"),
       ncol=2,bty="n",cex=0.8,
       text.col = c("blue","red","green","purple","black","yellow","violet","pink","orange","brown"),
       inset=0.01)

