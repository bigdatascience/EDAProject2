unzip("./exdata_data_NEI_data.zip", exdir="./")

NEI=readRDS("summarySCC_PM25.rds")
SCC=readRDS("Source_Classification_Code.rds")

# of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a 
# plot answer this question.
library(ggplot2)
NEIBalCity=NEI[which(NEI$fips=="24510"),]
NEItotbyyearBalCitybytype=aggregate(NEIBalCity$Emissions ~ NEIBalCity$year*NEIBalCity$type,FUN=sum)
colnames(NEItotbyyearBalCitybytype)=c("Year","Type","TotalEmissions")
qplot(Year,TotalEmissions,data=NEItotbyyearBalCitybytype, col=Type, geom="line", facets=Type~.,main="PM 2.5 by Type for Baltimore City",xlab="Year",ylab="Total Emissions in tons")
dev.copy(png, file="Plot3.png")
dev.off()
