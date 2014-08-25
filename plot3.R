plot3 <- function(NEI, SCC) {
    
  ## For the years in question, find the total of all PM2.5 emissions  
  ## For Baltimore City only

  b <- NEI[NEI$fips == "24510",]
  
  ## create a cross-tab of year, type and total
  
  d <- xtabs(b$Emissions ~ b$year + b$type)
  
  d.df <- as.data.frame(d)
  names(d.df) <- c("year", "type", "Total")

  png("plot3.png",
      width=600,
      height=600)
  
  g <- ggplot(d.df, aes(type, Total, fill=year)) 
  g <- g + geom_bar(position="dodge", stat="identity")

  g <- g + xlab("Pollutant Type") + ylab("Tons")
  g <- g + ggtitle("Total Amount of PM2.5 Emissions By Type\nFor Baltimore, MD") 
  
  g <- g + scale_fill_grey() + theme_bw()
  
  print(g)
  dev.off()
  
  print(paste("Plot 3 finished--",Sys.time()))
}