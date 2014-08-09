## Download the zip file containing the data and extract it in the same working
## directory, if the .txt file already exist then skip downloadin the zip

targetFile <- "household_power_consumption.txt"

#this checks if this R script was run before
#'twoDays' is the cleaned data frame
if(!exists("twoDays")) {

	if(!file.exists(targetFile)) {
		#Create a temp. file name
		temp <- tempfile()
		
		#download the zip file containing the data
		download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
		
		#unzipp it and read the data
		data <- read.table(unz(temp, targetFile), 
				   sep = ";", header = T, na.strings = c("?"))
		
		#delete temp file
		unlink(temp)
	}
	
	else {
		# read data directly
		data <- read.table(targetFile, sep = ";", header = T, na.strings = c("?"))
	}
	
	#clean the data (only subset on the two days needed)
	twoDays <- subset(data, Date == "1/2/2007" | Date == "2/2/2007")
	twoDays$Date <- strptime(paste(twoDays$Date, twoDays$Time), 
				 format = "%d/%m/%Y %H:%M:%S")
}
