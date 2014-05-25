unzip("./exdata_data_NEI_data.zip", exdir="./")

NEI=readRDS("summarySCC_PM25.rds")
SCC=readRDS("Source_Classification_Code.rds")

#  Have the total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#  Use the base plotting system to make a plot answering this question.
NEIBalCity=NEI[which(NEI$fips=="24510"),]
NEItotbyyearBalCity=aggregate(NEIBalCity$Emissions ~ NEIBalCity$year,FUN=sum)
colnames(NEItotbyyearBalCity)=c("Year","TotalEmissions")
plot(NEItotbyyearBalCity$Year,NEItotbyyearBalCity$TotalEmissions,type="l",xlab="Year",ylab="Total Emissions in tons",main="PM2.5 for Baltimore City")
dev.copy(png, file="Plot2.png")
dev.off()
