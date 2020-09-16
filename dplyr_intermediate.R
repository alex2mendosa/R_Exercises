library(dplyr)
# Exercise 1
In addition to data indexing and filtering, dplyr
allows to modify existing data frame by adding
new column.
Assume data. frame
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,stringsAsFactors=FALSE)
vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1<-data.frame(Price=vec_1,SKU=vec_2,
                        Group=vec_3,Listed=vec_4,stringsAsFactors=FALSE)

mutate(sample_1,e=sample(10:20,10,replace=TRUE))
we added column e to existing data frame.

Now use mutate() function 
to repeat example  and add 
column named Quantity equal to sample(30:40,10,replace=TRUE)

mutate(sample_1,Quantity=sample(30:40,10,replace=TRUE) )


# Exercise 2
vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1<-data.frame(Price=vec_1,SKU=vec_2,
                     Group=vec_3,Listed=vec_4,stringsAsFactors=FALSE)

mutate can also use as input of calculation olumns which are already 
oresent in data frame.

sample_1<-mutate(sample_1,Quantity=sample(30:40,10,replace=TRUE) )
we added column Quantity
mutate(sample_1,Sell_Out=Price*Quantity )

Columns Price and Quantity are both parts of data frame
and are included in mutate fucntion

Now repeat caclulations and create column Quantity.
Next multiply Quantity by price and 15% and assign result to 
column Investments

mutate(sample_1,Investments=Price*Quantity*0.15 )



# Exercise 3
vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1<-data.frame(Price=vec_1,SKU=vec_2,
                     Group=vec_3,Listed=vec_4,stringsAsFactors=FALSE)

Column created with mutate can contqain both output generated with 
arithmetic operation  and output formed by
other fucntion or control flow


mutate(sample_1,Full_Charact=paste(Price,SKU,Group,sep="--")  )
We used paste fucntion to bind element from different column into 1 
string. 
ifelse fucntion allows to speofy output according to specific 
condition.

mutate(sample_1,Group_Type=ifelse(Group %in% c("A","B","C","D","E"),"Premium ","Affordable")  )

Here we created column Group_Type which can take 2 values depending on calues on 
column Group.


Run the commad
sample_1<-mutate(sample_1,Quantity=sample(30:40,10,replace=TRUE) )
and create column Sell_Out, which equals Quantity*Price if 
value in Listed is TRUE and 0 otherwise.

mutate(sample_1,Sell_Out=ifelse(Listed=="TRUE",Quantity*Price,0) )


# Exercise 4
vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1<-data.frame(Price=vec_1,SKU=vec_2,
                     Group=vec_3,Listed=vec_4,stringsAsFactors=FALSE)

mutate allows to simultaneiusly create multiple column as
well as you column which were previously created in same mutate ()
function.

mutate(sample_1,Quantity=sample(30:40,10,replace=TRUE),
                Sell_Out=ifelse(Listed=="TRUE",Quantity*Price,0) )

Here with 1 expression  we created column Quantity, and,
within , same fucntion, cretaed column Sell_Out which 
refers to column Quantity.

Now , using original data frame , in 1 mutate fucntion
create column quantity with sample(30:40,10,replace=TRUE),
estimate Sell_out for all SKU, and add column Discount,
with values of 0.15 for products with price greater than 27,
and 0.05 otherwise.

mutate(sample_1,Quantity=sample(30:40,10,replace=TRUE),
       Sell_Out=Quantity*Price,Discount=ifelse(Price>28,0.15,0.05) )



# Exercise 5
In this exercise mtcars data frame is used
which is already present in base R vertion.
mtcars.
With Dplyr it is possible to aggregate data 
into single value which provides summary of 
data in specific column.

summarise(mtcars,mean(mpg))  or summarise(mtcars,Average_mpg=mean(mpg))
Output repsesents mean og column mpg.
Multiple columns can be aggregated withib single
summarise expression.

summarise(mtcars,mean(mpg),median(disp) )
Here output is single row with summary statistics.

Now estimate mean(), median(), variance(var) of 3 olumns of 
your choice.


summarise(mtcars,mean(hp),median(drat),var(qsec) )



# Exercise 6
Application of summarise fucntion 
can be significatly expanded if aggragation is done
to for whole column but to individual groups.

First we would create column which indicates names of manufacturer
position<-regexpr(" ",rownames(mtcars))
position[position<1]<-7
mtcars<-mutate( mtcars,Manufacturer=substr(rownames(mtcars),1,position-1) )
mtcars<-select(mtcars,Manufacturer,mpg:carb)

Now we have column Manufacturer and our goal is to 
estimate mean of mpg for each manufacturer separately.

To do it, we need apply group_by fucntion to
mtcars, whcih would indicate waht column to use for aggregation
when summarise fucntion is called.

mtcars<-group_by(mtcars,Manufacturer)
mtcars

Notice that format of data is changeg,
only first 10 rows are shown and under name of each column ,
data type is indicated. It mean that group_by 
fucntion  changed class of data from data. frame to tibbbe.
tibble is exremely similar to data frame, and 
offers more comvenient methos to dosplay and tranform data.

# Groups:   Manufacturer [22]  notification is indicated over data itself, 
indicating that now data , if aggregated, would be grouped by Manufactyrer

Now to get mean og mpg by group

summarise(mtcars, mean(mpg) )
No need to indicate grouping columns as they are already
defined with group by fcuntion. 

Similar result can be achived with aggregate() function,
whcih requred explicit specification of list of grouping elements. 


Now provide mean(),min(),max(),median() values of hp, 
grouped by manufacturer

summarise(mtcars, mean(hp),max(hp),min(hp),median(hp) )


# Exercise 7

position<-regexpr(" ",rownames(mtcars))
position[position<1]<-7
mtcars<-mutate( mtcars,Manufacturer=substr(rownames(mtcars),1,position-1) )
mtcars<-select(mtcars,Manufacturer,mpg:carb)

When data is grouped by single characterisric, 
aggregation fucntion runs calculation over rows
which coinside with each unique element of grouping variable.
For example, Name Mazda specifies that aggregation 
should be done for rows wheve values in Manufacturer 
column equals Mazda.

It is possible to run aggregation for multiple grouping variable
, therefore each row of output would be related to 
several characteristic of group. 

For example, we would group data by Manufacturer and cyl


mtcars<-group_by(mtcars,Manufacturer,cyl)
mtcars

Groups:   Manufacturer, cyl [25]
now indicated 2 grouping variables

summarise(mtcars, mean(mpg))

Now output is first grouped by Manufacturer, then 
for each manufacturer , for each cylinder available for given manufacturer,
mean is calculated.

Now estimate mean mg hp by cyl and gear


mtcars<-group_by(mtcars,cyl,gear)
mtcars
summarise(mtcars, mean(mpg) )


# Exercise 8

We will use iris dataset available in R base package.

Usefull agregatin fucntios are
mean(),median(),sd(),var(),IQR(),min(),max()


Apply each of them to sample_1 for data goruped by 
SKU on price column

sample_1<-group_by(sample_1,SKU)


summarise(sample_1,mean(Price),median(Price),sd(Price),var(Price),IQR(Price),min(Price),max(Price) )

If NA value in present in output, add na.rm=TRUE argument to fucntion.


# Exercise 9













