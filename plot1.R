#Question 1) Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting
#system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

#ET = Emission from all sources for each year
ET_Year <- aggregate(Emissions ~ year, data = NEI, sum) 
ET_Year$PM <- round(ET_Year[, 2]/1000,2)

#png1 device
png('plot1.png')


barplot(height=ET_Year$PM, names.arg = ET_Year$year, col = "blue", xlab="Years", 
        ylab=expression("Total PM"[2.5]*" Emission", ' in kilotons'),main=expression("Total PM"[2.5]*" Emissions at Various Years"))
dev.off()
