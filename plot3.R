# include the code for downloading, reading, cleaning the data
source("clean.R")

# redirect plotting to a png file
png('plot3.png')

plot(twoDays$Date, twoDays$Sub_metering_1, type = "n", 
     ylab = "Energy sub metering", xlab = "")

with(twoDays, lines(Date, Sub_metering_1))
with(twoDays, lines(Date, Sub_metering_2, col = "red"))
with(twoDays, lines(Date, Sub_metering_3, col = "blue"))

legend("topright", lty = 1, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#end plotting to png device
dev.off()
