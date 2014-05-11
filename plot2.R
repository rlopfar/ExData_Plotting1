
f<-fread("household_power_consumption.txt", header = TRUE, select = 1)       #read the data with data.table functions


data<-(which(f$Date %in% c("1/2/2007", "2/2/2007")))      #select data from 1/2/2007 to 2/2/2007
             
s<- min(data)            #take info about the 
k<- length(data)         #length of the object created
         
data1<- fread("household_power_consumption.txt",        #make a data.frame with the data 
              skip = (s) , nrows = k, header = TRUE)    #selected. It skip the lines about other days
             
ndata1<- names(fread("household_power_consumption.txt", nrow = 1))  #take names of the rows
     
setnames(data1, ndata1)          #set names and classify the data table as data frame
data2<-as.data.frame(data1)
     
x2<-as.Date(data2$Date,format='%d/%m/%Y')   #save Data in Data/time class
y2<-as.character(data2$Time)                #save Time as character
xy<-as.POSIXct(paste(x2,y2))                #make a vector with data/time in POSIXct class

png('plot2.png')      #standard way to save a plot as png
plot(xy,data2[,3],type="l",
     ylab="Global Active Power (kilowatts)",xlab="")   #set plot with the format required
dev.off()