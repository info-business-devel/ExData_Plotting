### Coursera
### Data Science Specialization
### Exploratory Data Analysis
### Week 1
### Peer-graded Assignment

library(lubridate)

# Load data:
row_data <- read.csv("household_power_consumption.txt", header = TRUE,  na.strings="?", sep = ";")
net_data <- row_data[(row_data$Date == "1/2/2007" | row_data$Date == "2/2/2007"), ]

# Transform "Date" in date + time in order to be able to deploy a graph:
net_data$Date <- as.Date(net_data$Date, format="%d/%m/%Y")
fullTime <- paste(net_data$Date, net_data$Time)
net_data$Date <- as.POSIXct(fullTime)

# Draw the graph:
with(net_data, 
     {
        plot(Sub_metering_1 ~ Date, type = "l",  col = "black",
             ylab = "Energy sub metering", xlab = "", cex = 0.8)
        lines(Sub_metering_2 ~ Date, type = "l",  col = "red")
        lines(Sub_metering_3 ~ Date, type = "l", col = "blue")
     }
)
legend("topright", legend = c("Sub_metering_1 ", "Sub_metering_2 ", "Sub_metering_3 "), 
       col = c("black", "blue","red"), lty = 1,  lwd = 1, cex = 0.8)   

# Copy to the PNG device
dev.copy(png, file="plot3.png", height = 480, width = 480)
dev.off()

