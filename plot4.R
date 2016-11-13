## Plotting Assignment 1 for Exploratory Data Analysis - Plot 4

## This code file constructs the plot4.png plot

## Student Name: Luiz Carlos Moutinho Pataca - luiz.pataca@gmail.com


# 1. Read the data and subsetting

Sys.setlocale("LC_TIME", "C") # Set time locale to english
inicial <- read.csv(file = "household_power_consumption.txt", na.strings = "?",
                    sep = ";", nrows = 10)
classes <- sapply(inicial, class)                    
dadosEPC <- read.csv(file = "household_power_consumption.txt", na.strings = "?",
                     sep = ";", colClasses = classes)

dadosEPC$DT <- paste0(dadosEPC$Date, " ", dadosEPC$Time)
dadosEPC$DT <- strptime(dadosEPC$DT, format = "%d/%m/%Y %X")

dadosSub <- subset(dadosEPC, Date == "1/2/2007" | Date == "2/2/2007")

rm(list = c("inicial", "classes", "dadosEPC"))

# 2. Plot and create the file plot4.png

png(filename = "plot4.png", width = 504, height = 504, units = "px",
    bg = "transparent")
par(mfrow = c(2, 2))

with(dadosSub, plot(x = DT, y = Global_active_power, xlab = "",
     ylab = "Global Active Power" , type = "l"))

with(dadosSub, plot(x = DT, y = Voltage, xlab = "datetime", type = "l"))

with(dadosSub, plot(x = DT, y = Sub_metering_1, xlab = "",
                    ylab = "Energy sub metering", type = "l",
                    ylim = c(0, max(Sub_metering_1))))
with(dadosSub, points(x = DT, y = Sub_metering_2, type = "l",
       col = "red"))
with(dadosSub, points(x = DT, y = Sub_metering_3, type = "l",
       col = "blue"))
legend("topright", col = c("black", "red", "blue"), lty = 1,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

with(dadosSub, plot(x = DT, y = Global_reactive_power, xlab = "datetime",
                    type = "l"))
dev.off()
