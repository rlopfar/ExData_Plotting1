
f<-fread("household_power_consumption.txt", header = TRUE, select = 1)       #read the data with data.table functions


data<-(which(f$Date %in% c("1/2/2007", "2/2/2007")      #select data from 1/2/2007 to 2/2/2007
             
s<- min(data)            #take info about the 
k<- length(data)         #length of the object created


data1<- fread("household_power_consumption.txt",        #make a data.frame with the data 
              skip = (s) , nrows = k, header = TRUE)    #selected. It skip the lines about other days

ndata1<- names(fread("household_power_consumption.txt", nrow = 1))  #take names of the rows

setnames(data1, ndata1)          #set names and classify the data table as data frame
data2<-as.data.frame(data1)

png('plot1.png')     #standard way to save a plot as png
hist(data2[,3], col="red",main="Global Active Power",     #make the histogram
     xlab="Global Active Power (kilowatts")
dev.off()