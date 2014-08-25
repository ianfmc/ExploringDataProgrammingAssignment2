plot6 <- function(NEI, SCC) {
  
  ## Select for Baltimore and Los Angeles
  
  both <- NEI[(NEI$fips == "24510") | (NEI$fips == "06037"),]
  
  years <- unique(NEI$year)
  
  ## Find all the vehicle-related classes; use the SCC Category
  ## "Onroad" to find those classes
  
  ## Filter the NEI data set for SCC codes in the desired set
  
  vehicle.classes <- SCC[SCC$Data.Category == "Onroad",]
  vehicle.emissions <- both[both$SCC %in% vehicle.classes$SCC,]
  
  t <- xtabs(vehicle.emissions$Emissions ~ vehicle.emissions$year + 
               vehicle.emissions$fips)
  
  totals <- as.data.frame(t)
  names(totals) <- c("year","city", "Total")
  
  totals[,"city"] <- gsub("24510", "Baltimore, MD", totals[,"city"])
  totals[,"city"] <- gsub("06037", "LA, CA", totals[,"city"])
  
  png("plot6.png",
      width=600,
      height=600)
  
  g <- ggplot(totals, aes(year, Total, fill=city))
  g <- g + geom_bar(stat="identity", position="dodge")
  
  g <- g + xlab("Year") + ylab("Tons")
  g <- g + ggtitle("Comparison of Motor Vehicle Related PM2.5 Pollution\nFor Baltimore, MD and Los Angeles, CA") 
  
  g <- g + scale_fill_grey() + theme_bw()  
  
  print(g)
  dev.off()
  
  print(paste("Plot 6 finshed--",Sys.time()))
}
