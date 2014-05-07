# Exploratory Data Analysis Course; Peer Assessment of Course Project 1

# This R script (plot2.R) does the following: 
# 1. Loads an electric power consumption data set into R
# 2. Launches png graphics device
# 3. Plots a graphic of the Global_active_power variable - plot, lines 
# 4. Annotates the plot - ylab
# 5. Closes the png graphical device 


# load the data into R
varClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
dataset <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", colClasses = varClasses, stringsAsFactors = FALSE, na.strings = "?")

# convert the Data variable into Date class
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

# extract the subset with Data equals to "2007-02-01" or "2007-02-02"
dataset <- subset(dataset, dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02", )

# convert the Date and Time variables into Date/Time class
datetime <- paste(dataset$Date,dataset$Time)
datetime <- strptime(datetime, "%Y-%m-%d %H:%M:%S")

# plot2.png
png(file = "plot2.png", width = 480, height = 480)
with(dataset, plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n"))
with(dataset, lines(datetime, Global_active_power))
dev.off()
