##Question 6) Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle 
#sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor
#vehicle emissions?

#load ggplot2
library(ggplot2)

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

Year_Fips <- aggregate(Emissions ~ year + fips, NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ], sum)
Year_Fips$fips[Year_Fips$fips=="24510"] <- "Baltimore"
Year_Fips$fips[Year_Fips$fips=="06037"] <- "Los Angeles"

png("plot6.png", width=1360, height=480)
YF <- ggplot(Year_Fips, aes(factor(year), Emissions))
YF <- YF + facet_grid(. ~ fips)
YF <- YF + geom_bar(stat="identity")  +
  xlab("Year") +
  ylab(expression('PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City X Los Angeles, 1999-2008') 
print(YF)
dev.off()
