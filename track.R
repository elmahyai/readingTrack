library(ggplot2)

t <- read.table("~/Documents/pj/Readingtrack/progress.tab",stringsAsFactors = F)

t$V2 <- t$V2+1
t$V3 <- t$V3-t$V2

x <- sapply(matrix(rep(t$V1,2),byrow=TRUE,nrow=2),c)
newt <- t[,2:3]
m <- sapply(apply(newt, 1, rbind), c)
#justforLabels <- sapply(rbind(apply(newt, 1, rbind)[2,],apply(newt, 1, rbind)[1,] ),c)
justforLabels <- sapply(rbind(rep(NA,4),apply(newt, 1, rbind)[1,] ),c)
y = rep(c('done', 'not'), nrow(t))
df = data.frame(x,m,y,justforLabels)
g <- ggplot(df, aes(x,m,fill=y))+geom_bar(stat="identity")+
  geom_text(aes(y = as.numeric(y),label=justforLabels), col = "blue", vjust=0)+
  theme(axis.line=element_blank(), axis.text.x = element_text(colour = "blue",size=20),
        axis.text.y=element_blank(),axis.ticks=element_blank(),
        axis.title.x=element_blank(),
        axis.title.y=element_blank(),legend.position="none",
        panel.background=element_blank(),panel.border=element_blank(),panel.grid.major=element_blank(),
        panel.grid.minor=element_blank(),plot.background=element_rect(fill="grey7"))

png('track.png')
print(g)
dev.off()