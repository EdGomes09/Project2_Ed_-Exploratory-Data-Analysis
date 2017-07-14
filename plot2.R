##Question 2) Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to
#2008? Use the base plotting system to make a plot answering this question.

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}

Baltimore <- aggregate(Emissions ~ year, NEI[NEI$fips=="24510", ], sum) 


#png2 device
png("plot2.png")

barplot(height=Baltimore$Emissions, names.arg = Baltimore$year, col = "green", xlab="Years",
ylab=expression("Total PM"[2.5]*" Emission"), main=expression("Total PM"[2.5]*" Total Emission in Baltimore City"))
dev.off()
