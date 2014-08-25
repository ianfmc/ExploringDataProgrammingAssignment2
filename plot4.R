plot4 <- function(NEI, SCC) {
    
  ## Find all of the classifications for coal-combustion in the SCC
  
  years <- unique(NEI$year)
  
  ## Coal related classes are those that contain both "Comb" for 
  ## Combustion and "Coal"
  
  ## Filter the NEI data set for SCC codes in the desired set
    
  coal.classes <- SCC[grep("[Cc]omb.*[Cc]oal",SCC$Short.Name),]
  coal.emissions <- NEI[NEI$SCC %in% coal.classes$SCC,]
  
  t <- xtabs(coal.emissions$Emissions ~ coal.emissions$year)
  
  totals <- as.data.frame(t)
  names(totals) <- c("year","Total")
  
  ## Scale the Total by 1000
  
  totals[,"Total"] <- totals[,"Total"]/1000
  
  png("plot4.png",
      width=600,
      height=600)
  
  g <- ggplot(totals, aes(year, Total))
  g <- g + geom_bar(stat="identity")

  g <- g + xlab("Year") + ylab("Thousands of Tons")
  g <- g + ggtitle("Total Amount of Coal Combustion Related PM2.5 Pollution") 
  
  g <- g + scale_fill_grey() + theme_bw()  
  
  print(g)
  dev.off()
  
  print(paste("Plot 4 finshed--",Sys.time()))
}