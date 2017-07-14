##Question 4) Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

#load ggplot2
library(ggplot2)

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# merge the two data sets 
if(!exists("NEISCC")){
  NEI_SCC <- merge(NEI, SCC, by="SCC")
}

#Find the coal combustion
coal<-grepl("coal", NEI_SCC$Short.Name, ignore.case=TRUE)

# Get the total emissions from coal combustion-related sources
coal.emissions <- aggregate(Emissions ~ year, NEI_SCC[coal,], sum)

#png4 device
png("plot4.png", width=1360, height=480)
NS <- ggplot(data = coal.emissions, aes(x = year, y = Emissions / 1000))
NS <- NS + geom_line(aes(group = 1, col = Emissions)) + geom_point(aes(size = 2, col = Emissions)) +
  ggtitle(expression('Total Emissions of PM'[2.5])) + ylab(expression(paste('PM'[2.5]*" Emissions", ' in kilotons'))) +
  xlab('Year') + geom_text(aes(label = round(Emissions / 1000, digits = 2), size = 2, hjust = 1.5, vjust = 1.5)) +
  theme(legend.position = 'none') + scale_colour_gradient(low = 'black', high = 'red')
print(NS)

# Close png device
dev.off()
