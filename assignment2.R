assignment2 <- function(s) {
  
  library(ggplot2)
  
  source("plot1.R")
  source("plot2.R")
  source("plot3.R")
  source("plot4.R")
  source("plot5.R")
  source("plot6.R")
  
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
  
  if (grepl("1", s)) plot1(NEI, SCC)
  if (grepl("2", s)) plot2(NEI, SCC)
  if (grepl("3", s)) plot3(NEI, SCC)
  if (grepl("4", s)) plot4(NEI, SCC)
  if (grepl("5", s)) plot5(NEI, SCC)
  if (grepl("6", s)) plot6(NEI, SCC)
  
}