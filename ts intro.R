# exercise 1
AirPassengers is data frame from Base R dataset.
datasets::AirPassengers
Simply type AirPassengers in console to check 
dataset. It is of ts class which means that 
onservation are organised in sequentioal equalispaced poins in 
time starting from January 1949.

type name of dataset to viwe time series data.
Apply length(), length(), start(), frequency() fucntions
to check total number of obsevations, 
start of series , end as well as sampling freauency

length(AirPassengers)
start(AirPassengers)
end(AirPassengers)
frequency(AirPassengers)
Note that output of above functions represents 
vector
end(AirPassengers)[1] indicates year of last observation
end(AirPassengers)[2] indicates month of last observation

# exercise 2
R offers methods to deal with exclusive properties of ts class,
specifically, with time stamps assign to each observations in R.
plot() function applied to ts class will automatically
assign dates labesl to x axis.

plot AirPassengers with plot(), 
add xlab and ylab arguments to provide 
names for x and y axis respectively, input for 
both argument should be characters.

plot(AirPassengers,xlab="Dates",ylab="Numner of Passengers ")

# exercise 2
We assume tghat each observation has unique time stamp,
lets assume that one observation is missing from AirPassengers

buff_data<-AirPassengers
buff_data[100:105]<-NA

plot(AirPassengers,col="red",type="p")
lines(buff_data,col="blue",type="l")

Apply mean function to buff_data
to estime mean of series and use 
respective values to replace missing data in buff_data
othremember to specify na.rm argument, Next plot both
original series and series with imputations using
combination of plot and lines fucntions.


buff_data[100:105]
buff_data[100:105]<-mean(buff_data,na.rm = TRUE)
plot(AirPassengers,col="red",type="p")
lines(buff_data,col="blue",type="l")





# exercise 3
Classic approach analysis of time series assumes that time series is 
composed of trend, seasonal component and random variations.
In the curent example we assume that trend is  determiniwstic, which means that 
as soon as we extract it, it will continue indefinately in the future
maintainf unpord or downward dire3ction with constant slope.
Lets assume linear trend.

Now we need to use lm fucntion to implement simple  linear
regression were independet variable is time index of contact increment,
1:10 or or example, 1960:1969.

lm(y~c(1:10)  ) or lm(y~c(1960:1969)  ) would provide identical 
output as the increment between of independent variables is the same.


Use lm fucntion where y as AirPassengers and x represent sequecne 
from 1 till the totan number of observatios observations.
Assing x indices to variable time_index.
Assimg resulm of lm to varible model_1
model_1$fitted.values provide access to values
we consider as linear trend

Solution
time_index<-1:length(AirPassengers)
model_1<-lm(AirPassengers~time_index)
summary(model1)
model_1$fitted.values



plot(AirPassengers,col="red",type="b")
lines(x=time_index,y=model_1$fitted.values,col="blue",cex=2)







# exercise 4

In previous exercise we managed to extract trend from 
raw data. By extracting trend from whole series we would receive sum
of seasonal variation and random component

detrended<-AirPassengers-model_1$fitted.values
plot(detrended)























