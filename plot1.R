# Exploratory Data Analysis Course; Peer Assessment of Course Project 1

# This R script (plot1.R) does the following: 
# 1. Loads an electric power consumption data set into R
# 2. Launches png graphics device
# 3. Plots a histogram of the Global_active_power variable - hist 
# 4. Annotates the plot - xlab, title
# 5. Closes the png graphical device 


# load the data into R
varClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
dataset <- read.table("./household_power_consumption.txt", header=TRUE, sep = ";", colClasses = varClasses, stringsAsFactors = FALSE, na.strings = "?")

# convert the Data variable into Date class
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")

# extract the subset with Data equals to "2007-02-01" or "2007-02-02"
dataset <- subset(dataset, dataset$Date == "2007-02-01" | dataset$Date == "2007-02-02")

# plot1.png
png(file = "plot1.png", width = 480, height = 480)
hist(dataset$Global_active_power, col="red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

