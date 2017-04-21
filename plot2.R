library(lubridate)
library(dplyr)

# Read the Household Power Consumption data file
HPC<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE)

# Convert the Date column into a true date format
# and filter for the dates we are looking for
selected.dates <- HPC %>% mutate(TrueDate=dmy_hms(paste(Date,Time))) %>%
  filter(TrueDate >= as.Date("2007-02-01","%Y-%m-%d") & TrueDate < as.Date("2007-02-03","%Y-%m-%d"))

# Produce a line chart of Global Active Power for the two days
X<-selected.dates$TrueDate
Y<-as.numeric(selected.dates$Global_active_power)
plot.new()
plot(x=X,y=Y,type = "l",
     xlab="",
     ylab="Global Active Power (kilowatts)")


# Save the graph as a PNG file
dev.copy(png,file="plot2.png")
dev.off()
