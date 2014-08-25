plot1 <- function(NEI, SCC) {
   
  ## For the years in question, find the total of all PM2.5 emissions
  
  years <- unique(NEI$year)
  totals <- xtabs(NEI$Emissions ~ NEI$year)
  
  ## Scale the amounts by 1000
  
  totals <- totals/1000
    
  png("plot1.png",
      width=600,
      height=600,
      type="quartz")

  barplot(totals,
          names.arg=years,
          ylab="Thousands of Tons",
          ylim=c(0.0,max(totals)+0.1*max(totals)),
          xlab="Year",
          main="Total Amount of PM2.5 Emissions")
  
  dev.off()
  
  print(paste("Plot 1 finished--",Sys.time()))
}