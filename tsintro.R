# Explore time series
# Exercise 1
AirPassengers is ts[time series] object from Base R dataset.
Simply type AirPassengers in console  and run it
to check  stored data. For ts class, 
observations are organized in sequential equispaced  points in 
time starting from January 1949. Each observation 
has single associated time index.

Type name of dataset to check time series data.
Apply length(),  start(), end(), frequency(),time() functions
to check total number of observations, 
start of series, end,  sampling frequency and time indices.

length(AirPassengers)
start(AirPassengers)
end(AirPassengers)
frequency(AirPassengers)
time(AirPassengers)

end(AirPassengers)[1] indicates year of last observation
end(AirPassengers)[2] indicates month of last observation
frequency of 12 indicates that each 
observation corresponds to specific month in a year. 
Time indices represent decimal numbers from 1949.000
with increment of 0.08333333 which guarantees that 
time indices are of same increment. 0.08333333 is the result of 
length(AirPassengers)/12 [12 months in year].



# Exercise 2
R offers methods to deal with unique properties of ts class,
specifically, with time indices assigned to each observation.
plot() function applied to ts class will automatically
assign dates labels to x axis.

plot AirPassengers with plot(), 
add xlab and ylab arguments to provide 
names for x and y axis respectively, input for 
both arguments should be of character type.
You can also add col argument which accept 
abbreviated color name to specify color of line.

plot(AirPassengers,xlab="Dates",ylab="Passenger Bookings,Thousands")
plot(AirPassengers,xlab="Dates",ylab="Passenger Bookings,Thousands",col="red")


# exercise 3
Classic approach of time series analysis assumes that time series is 
sum trend, seasonal component and random variations,
The respective model is referred as additive decomposition.
In the current example we assume that trend is linear, 
which means that it continues indefinitely in the future
maintaining upward or downward direction with constant slope.
The appropriate tool to extract trend given above assumptions is regression model with single  independent variable as time indices.

Now o use lm() function to run regression were independent variable are  time indices 
accessible via time(AirPassengers).

Assign result of lm() to variable model_1.
trend<-model_1$fitted.values provide access to fitted values
we would consider as tend component.
Next plot both original time series
with plot function followed by expression
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

For single explanatory variable model, slope is also equal
betta_1<-cov(time_index, AirPassengers) / var(time_index) and intercept is
betta_0<-mean( AirPassengers- time_index* betta_1  )

plot(AirPassengers,col="red",type="b")
abline(betta_0,betta_1,col="blue")





# exercise 4

In previous exercise we managed to extract trend from 
raw data. By extracting trend from whole series we would receive sum
of seasonal variation and random component.

Subtract fitted values stored in trend variable from raw series to 
estimate sum of seasonal and random component.

detrended<-AirPassengers-trend
plot(detrended,col="green")
Notice that series is heteroskedastic,
its variance increases as x increases.




# exercise 5

Now detrended variable contains sum of seasonal variations and
random component. By averaging values group by month we expect to 
receive estimates of seasonal effect. For example, 
the seasonal component for 
Feb is the average of detrended Feb observations.    
Consequently, we also assume that seasonal variations 
represent constant adjustment to trend which repeats itself
every 11 months.

Use the following expression
aggregate(object,list(group),FUN )
object:time series converted to vector
group: grouping elements, 1 per each observation 
in time series. Use cycle(detrended).
FUN: function applied to grouped data, use mean function

month_index<-aggregate(c(detrended), list(cycle(detrended)),mean  ) or
month_index<-aggregate(as.numeric(detrended), list(cycle(detrended)),mean  )








# exercise 6

month_index and trend contain our estimates
for trend and seasonal component of AirPassengers
series. Because trend represents sequence
from 1 to 12 recycled each year, and month_index
is sequence from 1 to 12, we can simply add
2 vectors of different size to model 
deterministic component of time series.

trend_seas<-month_index$x+ trend
Because AirPassengers is time series and trend_seas
is not , it would be convenient to 
convert trend_seas to time series with same time indices as original series.

trend_seas<-ts(trend_seas,start=start(AirPassengers),frequency = 12)

Now plot trend_seas and  AirPassengers
on the same plot, use combination of plot and 
lines functions.


plot(AirPassengers,xlab="Dates",ylab="Passenger Bookings,Thousands",col="red")
lines(trend_seas,xlab="Dates",ylab="Passenger Bookings,Thousands",col="blue")

Notice that variations of Raw data increase with trend while
estimated trend_seas variations are constant. 
It can imply that we need to relate seasonal variations 
to trend value.

plot(AirPassengers-trend_seas,col="red")


# exercise 7

Previously we assumed that seasonal variations for 
each month are independent of trend dynamics and are constant
for each month.

To relate trend and month we assume multiplicative decomposition where 
Raw data is product of trend and season. 
Rather than subtracting trend AirPassangers , we
need to divide trend by raw data to estimate second multipliers.

Divide  trend estimated by model_1 by  raw series to 
estimate seasonal component.

detrended_mult<-AirPassengers/trend
plot(detrended_mult,col="red")

detrended_mult[1:12]
Notice that values represent percentage increment or decrement
against trend. For example, values of 1.24 indicates that trend 
for given month should be increased by 24%, indicating
that seasonal variations take the same relative magnitude each 
year.



# exercise 8
Values in detrended_mult should be averaged
by month. Approach is similar to additive decomposition, 
we simply average the rations for each season.

month_index_mult<-aggregate(c(detrended_mult), list(cycle(detrended_mult)),mean  )

Second column now contains values which
we will combine with trend values to form product 
trend * season for multiplicative model. 



# exercise 9

Product of month_index_mult and trend
should form our vision of trend  and seasonal component 
derived from multiplicative model.
Assign result of multiplication to variable 
trend_seas_mult, form a time series and plot
both trend_seas_mult and AirPassengers

trend_seas_mult<-month_index_mult$x*trend

trend_seas_mult<-ts(trend_seas_mult,start=start(AirPassengers),frequency = 12)

plot(AirPassengers,xlab="Dates",ylab="Passenger Bookings,Thousands",col="red")
lines(trend_seas_mult,col="blue")

We ca clearly see that as we move along x axis and as 
time indices increase, variations of blues line increase 
together with trend, which overall improves 
ability of our model to capture dynamics of raw data.


par(mfrow=c(1,2))

plot(AirPassengers,xlab="Dates",ylab="Passenger Bookings,Thousands",col="red")
lines(trend_seas,col="blue")

plot(AirPassengers,xlab="Dates",ylab=NULL,col="red")
lines(trend_seas_mult,col="blue")




# exercise 10

 We assume that trend_seas_mult allows 
 sufficient approximation of trues direction and magnitude
 of raw series trend and seasonal variations,
 however , we still need explore error 
 which is difference between AirPassengers-trend_seas_mult,
 representing a gap between blue and red line.
 
 plot(AirPassengers-trend_seas_mult,col="blue")

 Error term which remains after model fit
 should resent sequence of values with mean 0, stable variance and
 no autocorrelation.

Estimate mean of error term and use acf() function with argument
plot=FALSE to explore presence of autocorrelation. 

mean( AirPassengers-trend_seas_mult )
acf(AirPassengers-trend_seas_mult,plot=FALSE)
acf(AirPassengers-trend_seas_mult)


We can clearly that that mean is different from 0 and 
values of autocorrelation are significant(over blue line),
indicating that there is still room for model improvement.
Significant autocorrelation with gradual decay present till lag 5 
implies that error term contain useful information
regarding trend dynamics and simple linear model is 
insufficient to estimate trend value.

















