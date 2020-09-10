
# Exercise 1
AirPassengers is data frame from Base R dataset.
datasets::AirPassengers
Simply type AirPassengers in console to check 
dataset. It is of ts class which means that 
observations are organised in sequential equlispaced poins in 
time starting from January 1949.

Type name of dataset to view time series data.
Apply length(),  start(), end(), frequency() functions
to check total number of observatiojns, 
start of series , end, as well as sampling frequency

length(AirPassengers)
start(AirPassengers)
end(AirPassengers)
frequency(AirPassengers)
Note that output of above functions represents 
vector
end(AirPassengers)[1] indicates year of last observation
end(AirPassengers)[2] indicates month of last observation
frequency of 12 indicates that each 
observation correspons to specific month in a year. 





# Exercise 2
R offers methods to deal with exclusive properties of ts class,
specifically, with time stamps assign to each observations in R.
plot() function applied to ts class will automatically
assign dates labesl to x axis.

plot AirPassengers with plot(), 
add xlab and ylab arguments to provide 
names for x and y axis respectively, input for 
both argument should be characters.

plot(AirPassengers,xlab="Dates",ylab="Numner of Passengers ")



# exercise 3
We assume that each observation has unique time stamp,
lets assume that one observation is missing from AirPassengers

buff_data<-AirPassengers
buff_data[100:105]<-NA

plot(AirPassengers,col="red",type="p")
lines(buff_data,col="blue",type="l")

Apply mean function to buff_data
to estime mean of series and use 
respective values to replace missing data in buff_data.
Remember to specify na.rm argument, Next plot both
original series and series with imputations using
combination of plot and lines fucntions.


buff_data[100:105]
buff_data[100:105]<-mean(buff_data,na.rm = TRUE)
plot(AirPassengers,col="red",type="p")
lines(buff_data,col="blue",type="l")





# exercise 4
Classic approach of time series analysis assumes that time series is 
composed of sum trend, seasonal component and random variations,
refered as additive decomposition.
In the curent example we assume that trend is linear, 
which means that it continues indefinately in the future
maitaining upward or downward direction with constant slope.

Now we need to use lm() fucntion to implement simple  linear
regression were independet variable is time index 
of contact increment of 1.

length(AirPassengers) is 144, indicatin 144 months, we can use
sequence 1:144 for time indices. 


Assing time indices to variable time_index.
Assign resulm of lm() to varible model_1.
model_1$fitted.values provide access to values
we would  consider as linear trend

Solution
time_index<-1:length(AirPassengers)
model_1<-lm(AirPassengers~time_index)
trend<-model_1$fitted.values

plot(x=time_index,y=AirPassengers,col="red",type="b")
lines(x=time_index,y=trend,col="blue",cex=2)

model_2<-lm(AirPassengers~time(AirPassengers))
plot(AirPassengers,col="red",type="b")
abline(reg=model_2,col="blue",cex=2)



# exercise 5

In previous exercise we managed to extract trend from 
raw data. By extracting trend from whole series we would receive sum
of seasonal variation and random component

Exclude fitted mavues fr4om model 1 from raw serirs to 
estimate sum of seasoonal and random component.

detrended<-AirPassengers-model_1$fitted.values
plot(detrended)
Notice that series is heteroskedastic,
its variance increases as x increases.




# exercise 6

In previous exercise we managed to extract trend from 
raw data. By extracting trend from whole series 
we would receive sum
of seasonal variation and random component

Exclude fitted mavues fr4om model 1 from raw serirs to 
estimate sum of seasoonal and random component.

detrended<-AirPassengers-model_1$fitted.values
plot(detrended,col="red")
Notice that series is heteroskedastic,
its variance increases as x increases.





# exercise 7

detrended time series contains random and seasonal variations, 
lets assume that seasonal variations are constant 
and repsesent constant adjustment to trend which repreats itseld
every 11 months.
We than take grouped average by month name assuming that
average values would allows to estimate true montly seasonl variations

Use the following fucntion
aggregate(vector name, by= list of factors used for aggregation, agggegation fucntion)
use cycle(detrended) to create aggregatiobn factors 

month_index<-aggregate(c(detrended), list(month=cycle(detrended)),mean  )




# exercise 8

month_index
Now , we need to cmbine trend value and estimated seasonl to
estimate fitted seasonl and trend component

trend





















