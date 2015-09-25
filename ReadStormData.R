## download file
## unzip it
## read the unzipped file into R

library(R.utils) # has unzip for bz2
fileurl = "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(fileurl, destfile = "StormData.csv.bz2")
bunzip2("StormData.csv.bz2","StormData.csv",overwrite=TRUE, remove=FALSE)
StormData <- read.csv("StormData.csv", header = TRUE)

