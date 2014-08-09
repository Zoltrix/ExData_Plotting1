# include the code for downloading, reading, cleaning the data
source("clean.R")

# redirect plotting to a png file
png('plot4.png')

## plot the four graphs on a 2x2 matrix
par(mfrow = c(2, 2))

#1st Plot: plot on first row, first col
with(twoDays, plot(Date, Global_active_power, type = "l", 
		   ylab = "Global Active Power (kilowatts)"))

#2nd Plot: plot on first row, second col
with(twoDays, plot(Date, Voltage, type = "l", 
		   ylab = "Voltage", xlab = "datetime"))

#3nd Plot: plot on second row, first col
plot(twoDays$Date, twoDays$Sub_metering_1, type = "n", 
     ylab = "Energy sub metering", xlab = "")

with(twoDays, lines(Date, Sub_metering_1))
with(twoDays, lines(Date, Sub_metering_2, col = "red"))
with(twoDays, lines(Date, Sub_metering_3, col = "blue"))

#4th Plot: plot on second row, second col
with(twoDays, plot(Date, Global_reactive_power, type = "l", 
		   ylab = "Global_reactive_power", xlab = "datetime"))

#end plotting to png device
dev.off()