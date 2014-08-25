plot5 <- function(NEI, SCC) {
        
    ## Select for Baltimore
   
    b <- NEI[NEI$fips == "24510",]
    
    years <- unique(NEI$year)
    
    ## Find all the vehicle-related classes; use the SCC Category
    ## "Onroad" to find those classes
    
    ## Filter the NEI data set for SCC codes in the desired set
    
    vehicle.classes <- SCC[SCC$Data.Category == "Onroad",]
    vehicle.emissions <- b[b$SCC %in% vehicle.classes$SCC,]
    
    t <- xtabs(vehicle.emissions$Emissions ~ vehicle.emissions$year)
    
    totals <- as.data.frame(t)
    names(totals) <- c("year","Total")
    
    png("plot5.png",
        width=600,
        height=600)
    
    g <- ggplot(totals, aes(year, Total))
    g <- g + geom_bar(stat="identity")
    
    g <- g + xlab("Year") + ylab("Thousands of Tons")
    g <- g + ggtitle("Total Amount of Motor Vehicle Related PM2.5 Pollution\nFor Baltimore, MD") 
    
    g <- g + scale_fill_grey() + theme_bw()  
    
    print(g)
    dev.off()
    
    print(paste("Plot 5 finished--",Sys.time()))
}