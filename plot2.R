## Plotting Assignment 1 for Exploratory Data Analysis - Plot 2

## This code file constructs the plot2.png plot

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

# 2. Plot and create the file plot2.png

png(filename = "plot2.png", width = 504, height = 504, units = "px",
    bg = "transparent")
plot(x = dadosSub$DT, y = dadosSub$Global_active_power, xlab = "",
     ylab = "Global Active Power (kilowatts)" , type = "l")
dev.off()
