### Coursera
### Data Science Specialization
### Exploratory Data Analysis
### Week 1
### Peer-graded Assignment

# Load data:
row_data <- read.csv("household_power_consumption.txt", header = TRUE,  na.strings="?", sep = ";")
net_data <- row_data[(row_data$Date == "1/2/2007" | row_data$Date == "2/2/2007"), ]

# Draw the histogram:
hist(net_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
                    ylab="Frequency", col = "Red", cex.sub = 0.8)

# Copy to the PNG device
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
