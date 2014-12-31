plot3.1 <- function() {
  
  library(ggplot2)
  
  summary.file <- "summarySCC_PM25.rds"
  source.class.file <- "Source_Classification_Code.rds"
  
  if (file.exists(summary.file) &
        file.exists(source.class.file)) {
    NEI <- readRDS(summary.file)
    SCC <- readRDS(source.class.file)
  }
  else {
    return
  }
  
  ## For the years in question, find the total of all PM2.5
  ## emission for all places using the sapply function
  
  ## Get the data for Baltimore only
  
  b <- NEI[NEI$fips == "24510",]
  
  ## create a cross-tab of year, type and total
  
  d <- xtabs(b$Emissions ~ b$year + b$type)
  d.df <- as.data.frame(d) 
  
  names(d.df) <- c("year", "type", "Total")
  
  png("plot3.1.png",
      width=600,
      height=600)
  
  g <- ggplot(d.df, aes(year, Total))
  g <- g + geom_bar(position="dodge", stat="identity")
  
  g <- g + xlab("Year") + ylab("Tons")
  g <- g + ggtitle("Total Amount of PM2.5 Emissions\nFor Baltimore") 
  
  g <- g + scale_fill_grey() + theme_bw()
  
  print(g)
  dev.off()
  
  print(Sys.time())
}