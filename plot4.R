unzip("./exdata_data_NEI_data.zip", exdir="./")

NEI=readRDS("summarySCC_PM25.rds")
SCC=readRDS("Source_Classification_Code.rds")

# Across the United States, how have emissions from coal combustion-related
# sources changed from 1999–2008?
SCCCoal=SCC[grepl("coal", SCC$EI.Sector, ignore.case=TRUE),]
NEICoal=subset(NEI, SCC %in% SCCCoal$SCC)
NEICoalTotal=aggregate(NEICoal$Emissions ~ NEICoal$year,FUN=sum)
colnames(NEICoalTotal)=c("Year","TotalEmissions")
plot(NEICoalTotal$Year,NEICoalTotal$TotalEmissions,type="l",xlab="Year",ylab="Total Emissions in tons",main="PM2.5 from coal combustion-related sources")
dev.copy(png, file="Plot4.png")
dev.off()
