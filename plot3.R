##Question 3) Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of
#these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in
#emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

#load ggplot2
library(ggplot2)

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

Type_Year <- aggregate(Emissions ~ year + type, NEI[NEI$fips=="24510", ], sum)

#png3 device
png("plot3.png", width=700, height=480)
TY <- ggplot(Type_Year, aes(year, Emissions, color = type))
TY <- TY + geom_line() +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" Emissions")) +
  ggtitle("Total Emissions in Baltimore City from 1999 to 2008")
print(TY)
dev.off()
