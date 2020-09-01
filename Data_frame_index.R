# Exercise 1

Run the following code to generate
2 vectors of random numbers and letters.

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
sample_frame<-data.frame(digits=vec_1,letters=vec_2)

Sample function randomly select 10 elements from 
vectors 20:30 and letters.lettets is vector
already build in R.


Write a R expressiom to extract 
column 2 from a data frame using
column name and column number.
Use $ immediately aftet data frame name followed
by column name you want to extract

sample_frame$letters




# Exercise 2

Run the following code to generate
3 vectors of random numbers and letters.

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
sample_frame<-data.frame(digits=vec_1,case_low=vec_2,case_high=vec_3)


Write a R expressiom to extract 
second column , next write expression to 
extract only columns 1 and 3 from a data frame using
columns column numbers.
Try to use single expression.

sample_frame[,2]
sample_frame[,c(1,3)]

Data frame has 2 dimentions, numbers of rows and columns,
therefore, in square brackets you first indicate vector with wor numbers, 
next you indoicate vector with column  numbers. If row of column index is not mentioned,
all rows or all columns are dispolayed. 





# Exercise 3

Run the following code to generate
3 vectors of random numbers and letters.

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
sample_frame<-data.frame(digits=vec_1,case_low=vec_2,case_high=vec_3)


Write a R expressiom to extract 
forst  and second columns usinf $ and column name
ro referenced required columns.
Try to use single expression.


sample_frame[,c("digits","case_high")]




