library(dplyr)

# Read the Household Power Consumption data file
HPC<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors = FALSE)

# Convert the Date column into a true date format
# and filter for the dates we are looking for
selected.dates <- HPC %>% mutate(TrueDate=as.Date(Date,"%d/%m/%Y")) %>%
  filter(TrueDate >= as.Date("2007-02-01","%Y-%m-%d") & TrueDate <= as.Date("2007-02-02","%Y-%m-%d"))

# Generate a histogram of the Global Active Power
hist(as.numeric(selected.dates$Global_active_power),
     col="red",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     main="Global Active Power")

# Save the graph as a PNG file
dev.copy(png,file="plot1.png")
dev.off()
