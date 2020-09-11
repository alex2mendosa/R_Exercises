# Explore time series
# Exercise 1
AirPassengers is ts[time series] object from Base R dataset.
class(AirPassengers). Simply type AirPassengers in console 
and run it to check  stored observations. For ts class, 
observations are organised in sequential equlispaced poins in 
time starting from January 1949. Each observation 
has single associated time index.

Type name of dataset to check time series data.
Apply length(),  start(), end(), frequency(),time() functions
to check total number of observatiojns, 
start of series , end,  sampling frequency and time indices.

length(AirPassengers)
start(AirPassengers)
end(AirPassengers)
frequency(AirPassengers)
time(AirPassengers)

end(AirPassengers)[1] indicates year of last observation
end(AirPassengers)[2] indicates month of last observation
frequency of 12 indicates that each 
observation correspons to specific month in a year. 
time indices repsesent dicimal numbers from 1949.000
with increment of 0.08333333 which guarantees that 
time indices are equalispaced. 0.08333333 the result  of 
length(AirPassengers)/12 [12 months in year].



# Exercise 2
R offers methods to deal with exclusive properties of ts class,
specifically, with time stamps assign to each observations in R.
plot() function applied to ts class will automatically
assign dates labels to x axis.

plot AirPassengers with plot(), 
add xlab and ylab arguments to provide 
names for x and y axis respectively, input for 
both argument should be characters.
You can also add col argument which accept 
abbreviated color name to specify color of line.

plot(AirPassengers,xlab="Dates",ylab="Passenger Bookings,Thousands")
plot(AirPassengers,xlab="Dates",ylab="Passenger Bookings,Thousands",col="red")


# exercise 3
Classic approach of time series analysis assumes that time series is 
composed of sum trend, seasonal component and random variations,
refered as additive decomposition.
In the curent example we assume that trend is linear, 
which means that it continues indefinately in the future
maitaining upward or downward direction with constant slope.
The appropriate tool is regression model in which independent 
variable is equalyspaced time indices.

Now o use lm() ficntion to run regression
regression were independet variable is time index 
accesible via time(AirPassengers).


Assign resulm of lm() to varible model_1.
model_1$fitted.values provide access to values
we would  consider as tend component which you should assign
to trend variable.
Next plot both original time series
with plot fucntion followed by
abline(model_1,col="blue") to plot 
fitted values.

Solution
time_index<-time(AirPassengers)
model_1<-lm(AirPassengers~time_index)
trend<-model_1$fitted.values

We need to remove names from vector otherwise
they will be plotted on graph.
trend<-unname(trend)

model_1<-lm(AirPassengers~time_index)
plot(AirPassengers,col="red",type="b")
abline(reg=model_1,col="blue")

For single explanatiry variable model, slope is aslo equal
betta_1<-cov(time_index, AirPassengers) / var(time_index) and intercpet is
betta_0<-mean( AirPassengers- time_index* betta_1  )

plot(AirPassengers,col="red",type="b")
abline(betta_0,betta_1,col="blue")



# exercise 4

In previous exercise we managed to extract trend from 
raw data. By extracting trend from whole series we would receive sum
of seasonal variation and random componentþ

Substract fitted values from model 1 from raw series to 
estimate sum of seasoonal and random component.

detrended<-AirPassengers-model_1$fitted.values
plot(detrended,col="green")
Notice that series is heteroskedastic,
its variance increases as x increases.




# exercise 5

Now detrended variable contains sum of seasonal variations and
random component. By averaging values group by month we expect to 
receive estimates of seasonal effect.For example, 
the seasonal component for 
Feb  is the average of  detrended Feb observations.    
Consequently, we also assume that seasonal variations are constant 
and repsesent constant adjustment to trend which repreats itseld
every 11 months.



detrended<-AirPassengers-model_1$fitted.values
plot(detrended,col="red")
Notice that series is heteroskedastic,
its variance increases as x increases.

Use the following fucntion
aggregate(object,by=list(group),FUN )
object:time series converted to vector
group: grouping elements, 1 per each observation 
in time series. Use cycle(detrended)
FUN: mean to apply, use mean function

month_index<-aggregate(c(detrended), list(cycle(detrended)),mean  )




# exercise 6

month_index and trend contain our estimated 
for trend and seasonal component for AirPassengers
data. Because trend data represents sequence
from 1to 12  recycled each year, and month_index
is sequence from 1 till 12 month we can cimply add
2 vectors of different size to model 
deterministi component of time series.

trend_seas<-month_index$x+ trend
Becase AirPassengers is time series and trend_seas
is not , it would be conveniebt to 
convert trend_seas to time series with same time indices as original series.

trend_seas<-ts(trend_seas,start=start(AirPassengers),frequency = 12)

Plot trend_seas AirPassengers
on the same plot, use combination of plot and 
lines fucntions.


plot(AirPassengers,xlab="Dates",ylab="Passenger Bookings,Thousands",col="red")
lines(trend_seas,xlab="Dates",ylab="Passenger Bookings,Thousands",col="blue")

Notice that variation of Raw data increse with trend while
estimated trend_seas variations are constant. 
It can imply that we need to relate seasonal variations 
to trend value.

plot(AirPassengers-trend_seas,col="red")


# exercise 7

Pre3viously we assumed that seasonal variations for 
each month are independent of trend dynamics and are constat
for each month.

To relate trend and month we assume multiplicative decompositiomn where 
Raw data is prodcut of trend and season. 
Rather thant substacting trend from raw data , now we
ned to divide trend by raw data to estimate of of the multipliers
which form raw data.

divide  fitted values from model 1 by  raw series to 
estimate seasoonal and random component.

detrended_mult<-AirPassengers/model_1$fitted.values
plot(detrended_mult,col="red")

detrended_mult[1:12]
Notice that values repsesent percentage increment of decrement
agains baseline. For example, values of 1.24 indicates that baseline 
for given month should be increased by 24%, indicating
that seasonal variations take the same relative magnitude each 
year.



# exercise 8
Values in detrended_mult should be averaged
by month. Approach is similar to additive decomposition, 
we simply average the rations for each season.

month_index_mult<-aggregate(c(detrended_mult), list(cycle(detrended_mult)),mean  )

Second column now contains values which
we will combine with rend values to form estimated for 
trend * season for multipliative model. 



# exercise 9

Prodcut of month_index_mult and trend
should form our vision of trend season component 
derived from multiplicative model.
Assign result of multiplication to variable 
trend_seas_mult, form a time series and plot
both trend_seas_mult and AirPassengers

trend_seas_mult<-month_index_mult$x*trend

trend_seas_mult<-ts(trend_seas_mult,start=start(AirPassengers),frequency = 12)

plot(AirPassengers,xlab="Dates",ylab="Passenger Bookings,Thousands",col="red")
lines(trend_seas_mult,col="blue")

We ca clearly see that as we move along x axis and as 
time indices increase, variations of blues line increse 
togetehr with trend, which overall improves 
capacity of our model to capture dynamics of raw data.


par(mfrow=c(1,2))

plot(AirPassengers,xlab="Dates",ylab="Passenger Bookings,Thousands",col="red")
lines(trend_seas,col="blue")

plot(AirPassengers,xlab="Dates",ylab=NULL,col="red")
lines(trend_seas_mult,col="blue")




# exercise 10

 We assume that trend_seas_mult allows 
 sufficient aproximation of trues diretion and magnitude
 of raw series trend and seasonal variations,
 however , we still nedd explore error term as 
 which is difference between AirPassengers-trend_seas_mult,
 repsesenting a gap between blue and red line.
 
 plot(AirPassengers-trend_seas_mult,col="blue")

 Error term which remains after model fit
 should repsenet sequence of values with mean 0, stable variance and
 no autocorrelation 

Estimate mean of error term and use acf() fucntion with arguemtn
plot=FALSE to explore presence of autocorrelation. 

mean( AirPassengers-trend_seas_mult )
acf(AirPassengers-trend_seas_mult,plot=FALSE)
acf(AirPassengers-trend_seas_mult)


We can clearly that that mean is different from 0 and 
values of autocorrelation are signifficate(over blue line)
indicating that there is still rom for model improvement.
Excessive correlation promarily presenct  till lag 5 
with graduall decay implying that error term contain usefull information
regarding trend dynamics and simple linear model is 
insufficient to setimete trand value.

















