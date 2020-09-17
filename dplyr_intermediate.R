library(dplyr)
# Exercise 1
library(dplyr)
In addition to data indexing and filtering, dplyr
allows to modify existing data frame by adding
new column.
Two in build data frames would be used, 
mtcars and iris.

Lets have a look on mtcars
mtcars
?mtcars provides description of mtcars columns
db_1<-mtcars[,1:4] we will use only first 4 columns

with mutate fucntion we can 
can add new column to data frame by specifying 
new column name and values for each row.

Lets simply add column with random values 
mutate(db_1,Random_values=rnorm(nrow(db_1)) )
Here we use nrow(db_1) to specify that number of generated
values should be equal to number of rows in target data frame.

Now repeat example , but instead of
nrow(db_1), enter nrow(db_1)/2


mutate(db_1,Random_values=rnorm(nrow(db_1)/2 ) )

Error message appears, so whenever mutate is used make sure
that number of values you create is equal to number of rows
in data frame. Note that 
mutate(db_1,Random_values=1 ) is Possible , we simly
create column with single value,
on the other hand
mutate(db_1,Random_values=c(1,2) ) produces error.



# Exercise 2
library(dplyr)
mtcars dataset is used for current exercise.
db_1<-mtcars[,1:4] we will use only first 4 columns

mutate can also use for calculations columns which are already 
are in data frame.

mutate(db_1,"l/100km"=235.21/mpg)

We added "l/100km", litre per 100 km 
and used mpg column as variable in  calculations. 


Now repeat caclulations  add round() fucntion to
get l/100km with only 2 decimal numbers.
Secondly,  use equivalence that
1 horsepower equals 0.74 kW[kilowatts ]
and add column kW

mutate(db_1,"l/100km"=round( 235.21/mpg,2 ) )
mutate(db_1,"kW"=hp*0.74)


# Exercise 3
Assume data frame

sample_1<-data.frame(SKU=c("A","B","C","D","E","F","Q","W"),
                     Price=rchisq(8,5),
                     Quantity_Sold=rpois(8,30))
rchisq() is used to generate positive values only and
rpois() to generate integers only.

Column created with mutate can contain both output generated with 
explicit arithmetic operations[+,-,/,*]  and output formed by
R functions or control flow expressions.

Now first create column Sell_Out as product of
Price and Quantity_Sold. Sell out should be rounded
to 2 decimal numbers. 

  sample_1<-mutate(sample_1,Sell_Out=round(Price*Quantity_Sold,2) )
  
  
  
  
# Exercise 4
  Assume data frame
  
  sample_1<-data.frame(SKU=c("A","B","C","D","E","F","Q","W"),
                       Price=rchisq(8,5),
                       Quantity_Sold=rpois(8,30),
                       Stock=rpois(8,1000))
  sample_1<-mutate(sample_1,Sell_Out=round(Price*Quantity_Sold,2) )
  rchisq() is used to generate positive values only and
  rpois() to generate integers only.
  
If we sort data in sample_1$Sell_Out, 
quantile_25<-quantile(sample_1$Sell_Out,0.25) provides value which
is greater than 25% of observations.
ifelse() is control flow statement which
defines output based on TRUE or FALSE value.

ifelse(sample_1$Quantity_Sold %% 2 ==0,"Even","Uneven")
Result in Even if value in Quantity_Sold column is Even and 
Uneven otherwise. 
sample_1$Quantity_Sold %% 2 ==0 as argument of ifelse()
simply repsesent logical vectgor of same length as
number of rows in data frame.


Now use ifelse() statement to classify SKU as "Listed"
if Sell_Out>quantile_25 and "Delisted" otherwise.

mutate(sample_1,Status=ifelse(Sell_Out>quantile_25,"Listed","Delisted" ) )

Additionally , first arguemnt of ifelse() must evaluate to logical vector,
which in turn can be formed by long logical expresion

mutate(sample_1,Status=ifelse(Sell_Out>quantile_25 & Stock>800 ,"Listed","Delisted" ) )

Note that values below quantile_25 are rare, you might receive only
1 row classified as Delisted.


# Exercise 5
Assume data frame

sample_1<-data.frame(Month=c(1:7),
                     Quantity_Sold=rpois(7,40),
                     Sell_out=round(rchisq(7,100),2) )
rchisq() is used to generate positive values only and
rpois() to generate integers only.

Another control flow function is switch().
Month in sample_1 are indicated as month indices.
For reporting purpose we want to convert them to three letters 
abbreviations.

switch() function can be usefull  this case.

sample_element<-"United Kingdom"
switch(sample_element,"USA"="Washington" , "United Kingdom"="London", "Japan"="Tokyo")

sample_element<-c("Japan","USA","United Kingdom")
switch(sample_element,"USA"="Washington" , "United Kingdom"="London", "Japan"="Tokyo")

switch() choosed among several alternatives and provides 
output as soon as sample_element fits listed conditions.

Use the same approach to convert month indices to three letters 
abbreviations, for example, "1"="Jan". In this case, 1 should 
in quotation marks to be treated as character.
Exercise requres prior experience with sapply()  fucntion.

Solution
mutate(sample_1,switch(Month,"1"="Jan","2"="Feb","3"="Mar","4"="Apr","5"="May","6"="Jun","7"="Jul") )
will not work as switch cal accept only vector of length 1, while sample_1$Month contain 7 elements.
We need to circumvent this specificty of switch() and use sapply() and custom function.

f_1<-function(x) {
  switch(x,"1"="Jan","2"="Feb","3"="Mar","4"="Apr","5"="May","6"="Jun","7"="Jul")
}
mutate(sample_1,Month_Abbr=sapply(Month,f_1) )
Here, each element is Month becomes argument of f_1 
which alloes switch() fucntion to run.

Overall, this is example that expressions in  mutate can be supplied
with control flow statements combined with base and custom functions.



# Exercise 6

Assume data frame

sample_1<-data.frame(SKU=c("A","B","C","D","E","F","Q","W"),
                     Price=rchisq(8,5),
                     Quantity_Sold=rpois(8,30),
                     stock=rpois(8,1000))
rchisq() is used to generate positive values only and
rpois() to generate integers only.

It is possible to define multiple columns in mutate, 
and use previosly created column as argument for new one. 

mutate(sample_1,Sell_Out=round(Price*Quantity_Sold,2), )

sample_1<-mutate(sample_1,Sell_Out=round(Price*Quantity_Sold,2),
                          Status=ifelse(Sell_Out>quantile(Sell_Out,0.25),"Listed","Delisted" ) )

with single mutate() we created 2 column where column Status 
uses column Sell_Out for calculations. 


sample_1<-mutate(Status=ifelse(Sell_Out>quantile(Sell_Out,0.25),"Listed","Delisted" ),
                 sample_1,Sell_Out=round(Price*Quantity_Sold,2))
Will not work as Sell_Out is created after Status.


Now do the following:
with   Sell_Out   and  Status column created, and given that data in sample_1
shows sales per Month and cummulative stock,
in single mutate() expression, add column "Destock" which indicates
months before Stock would become 0  assuming constant sell out  per month
and also add column named "Investments" which does the following:
If Destock>10 and Status=="Delisted" then Destock*Sell_Out*0.15 to 
calculate Investments if company offers 15% discount for all future Sales.

mutate(sample_1,Destock=round(stock/Sell_Out,0) ,
                Investments=ifelse(Status=="Delisted" & Destock>10, Destock*Sell_Out*0.15 ,0)  )






# Exercise 7
In this exercise mtcars data frame is used
which is already present in base R vertion.
With dplyr it is possible to aggregate data 
into single value which provides summary of 
data in specific column.

summarise(mtcars,mean(mpg))  or summarise(mtcars,Average_mpg=mean(mpg))
Output repsesents mean of column mpg.
Multiple columns can be aggregated within  single
summarise expression.

summarise(mtcars,mean(mpg),median(disp) )
Here output is single row with summary statistics.

Now estimate mean(), median(), variance(var) of 3 columns of 
your choice.


summarise(mtcars,mean(hp),median(drat),var(qsec) )



# Exercise 8
Application of summarise() function 
can be significatly expanded if aggragation is done
not  for all rows but to individual groups.

First we would create column which indicates names of manufacturer
position<-regexpr(" ",rownames(mtcars))
position[position<1]<-7
mtcars<-mutate( mtcars,Manufacturer=substr(rownames(mtcars),1,position-1) )
mtcars<-select(mtcars,Manufacturer,mpg:carb)

Now we have column Manufacturer and our goal is to 
estimate mean of mpg for each manufacturer separately.

To do it, we need to apply group_by function to
mtcars and indicate what columns to use for aggregation
when summarise() function is called.

mtcars<-group_by(mtcars,Manufacturer)
mtcars

Notice that format of data is changeg,
only first 10 rows are shown and under name of each column ,
data type is indicated. It means that group_by 
fucntion  changed class of data from data frame to tibbbe.
tibble is exremely similar to data frame, and 
offers more comvenient methods to display and tranform data.

# Groups:   Manufacturer [22]  
notification is indicated over data itself, 
indicating that now if summary function would be called to
specific column, output would be aggregated by Manufacturer.

Now to get mean of  mpg by group

summarise(mtcars, mean(mpg) )
No need to indicate grouping columns as they are already
defined with group_by() function. 

Similar result can be achived with aggregate() function,
which requred explicit specification of list of grouping elements.

aggregate(mtcars$mpg,by=list(mtcars$Manufacturer),FUN="mean")

Now provide mean(),min(),max(),median() values of hp, 
grouped by manufacturer.

summarise(mtcars, mean(hp),max(hp),min(hp),median(hp) )




# Exercise 9

We will use iris dataset available in R base package.

Usefull aggregation functions are
mean(),median() for central tendency
sd(),var(),IQR(),min(),max() for spread measure.

Apply each of them to iris data frame grouped by  Species
over Sepal.Length column

sample_1<-group_by(iris,Species)

summarise(sample_1,mean(Sepal.Length),median(Sepal.Length),sd(Sepal.Length),var(Sepal.Length),
          IQR(Sepal.Length),min(Sepal.Length),max(Sepal.Length) )


# Exercise 10


Assume the following data.frame

sample_1<-data.frame(Business= rep( c("Dairy","Waters","Coffee"),times=c(4,6,6)  ),
                     SKU= rep( paste("SKU_",1:8,sep=""),each=2),                   
                     Month=rep( 1:2,times=8 ),
                     Sell_Out= c(rchisq(4,50),rchisq(6,70),rchisq(6,90) )  )
sample_1 is data frame for 8 different SKU sales history for 2 months. 

First group data by Format and estimate  mean() and max() Sell_out

sample_1<-group_by(sample_1,Business)
summarise(sample_1,mean(Sell_Out) )

What if we want to generate report
Were everage sales are grouped[organised] by Business and
SKU. It would require frouping by 2
variables

sample_1<-group_by(sample_1,Business,SKU)
summarise(sample_1,mean(Sell_Out) )

Here as Output we get average Sales per SKU 
sorted by Group.
sample_1<-group_by(sample_1,SKU)
summarise(sample_1,mean(Sell_Out) ) would produce identical averages
as SKU column represents  more speficic grouping level.


Now group data by Busines and month to estimate mean() and totals Sell Out
and more favorable months..

sample_1<-group_by(sample_1,Business,Month)
summarise(sample_1,mean(Sell_Out),sum(Sell_Out) )





