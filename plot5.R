##Question 5) How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

#load ggplot2
library(ggplot2)

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

ET_Year <- aggregate(Emissions ~ year, NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ], sum)

png("plot5.png", width=900, height=480)

ETY <- ggplot(ET_Year, aes(year, Emissions))
ETY <- ggplot(data = ET_Year, aes(x = year, y = Emissions)) + geom_bar(aes(fill = year), stat = "identity") +
  guides(fill = F) + ggtitle('Total Emissions of Motor Vehicle Sources in Baltimore City') +
  ylab(expression("Total PM"[2.5]*" Emissions"))+ xlab('Year') + theme(legend.position = 'none') +
  geom_text(aes(label = round(Emissions, 0), size = 1, hjust = 0.5, vjust = 2))
print(ETY)
dev.off()
