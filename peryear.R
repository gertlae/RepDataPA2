## How does the data vary over time ?
StormData <- read.csv("StormData.csv", header = TRUE)
dim(StormData)
StormData$Year = strptime(StormData$BGN_DATE, format ="%m/%d/%Y %H:%M:%S")
StormData$Year = format(StormData$Year,'%Y')
StormData$Year = as.factor(StormData$Year)

EconImp = StormData %>%
        filter(StormData$EVTYPE == 'TORNADO') %>%
        group_by(Year) %>%
        summarise(Nbr = n())
par(mfcol = c(1, 1))
x = as.integer(EconImp$Year)
y = EconImp$Nbr
reg1 <- lm(y~x)
plot(x,y, main = "Nbr of Tornados per Year")
abline(reg1)

EconImp = StormData %>%
        filter(as.numeric(as.character(Year)) >= 1996) %>%
        group_by(Year) %>%
        summarise(Nbr = n())
par(mfcol = c(1, 1))
x = as.integer(as.character(EconImp$Year))
y = EconImp$Nbr
reg1 <- lm(y~x)
plot(x,y, main = "Nbr of Events per Year")
abline(reg1)