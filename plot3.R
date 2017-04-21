library(lubridate)
library(dplyr)

# Read the Household Power Consumption data file
HPC<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE)

# Convert the Date column into a true date format
# and filter for the dates we are looking for
selected.dates <- HPC %>% mutate(TrueDate=dmy_hms(paste(Date,Time))) %>%
  filter(TrueDate >= as.Date("2007-02-01","%Y-%m-%d") & TrueDate < as.Date("2007-02-03","%Y-%m-%d"))

# Produce a line chart of Energy sub metering with 3 groups for the two days
X<-selected.dates$TrueDate
Y1<-as.numeric(selected.dates$Sub_metering_1)
Y2<-as.numeric(selected.dates$Sub_metering_2)
Y3<-as.numeric(selected.dates$Sub_metering_3)
plot.new()
plot(x=X,y=Y1,type = "l",
     xlab="",
     ylab="Energy sub metering")
lines(x=X,y=Y2,col="red")
lines(x=X,y=Y3,col="blue")
legend("topright",
       col=c("black","red","blue"),
       lty=c(1,1,1),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))



# Save the graph as a PNG file
dev.copy(png,file="plot3.png")
dev.off()
