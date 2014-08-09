# include the code for downloading, reading, cleaning the data
source("clean.R")

# redirect plotting to a png file
png('plot1.png')

hist(twoDays$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "red")

#end plotting to png device
dev.off()