# include the code for downloading, reading, cleaning the data
source("clean.R")

# redirect plotting to a png file
png('plot2.png')

with(twoDays, plot(Date, Global_active_power, type = "l", 
		   ylab = "Global Active Power (kilowatts)"))

#end plotting to png device
dev.off()