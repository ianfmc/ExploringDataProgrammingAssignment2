plot2 <- function(NEI, SCC) {
    
  ## For the years in question, find the total of all PM2.5
  ## For Baltimore City only

  b <- NEI[NEI$fips == "24510",]
  
  years <- unique(b$year)
  totals <- xtabs(b$Emissions ~ b$year)
    
  png("plot2.png",
      width=600,
      height=600)

  barplot(totals,
          names.arg=years,
          ylab="Tons",
          ylim=c(0.0,max(totals)+0.1*max(totals)),
          xlab="Year",
          main="Total Amount of PM2.5 Emissions\nFor Baltimore, MD")
  
  dev.off()
  print(paste("Plot 2 finished--",Sys.time()))
}