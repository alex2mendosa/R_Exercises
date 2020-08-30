sample( c(40:70,121:125),10 )



# Exercise 1

Assume vectors
10:14
1:5

To create a dataframe, use referenced 
vector as argument of data.frame() function.

db_1<-data.frame(1:5,10:14) 

function data.frame() coerce
vectors to data frame of 2 columns and
5 rows. Names for columns are not supplied,
therefore R automatically assignes  names
based on data in each vector.
For example, second colums name is 
X10.14 where 2 digits are part of values in 
vectors.



# Exercise 2

Use seq() function to generate sequence 
from 0 to 10 with increment of 2 and
sequence from 11 to 31 with increment of 4.

Next, use data.frame() to 
bind sequences in 1 data frame.
Sequences should be generated as 
arguments in data.frame function

Names of columns should be seq1 and seq2

seq(from=0,to=10,by=1)
seq(from=11,to=31,by=2)

db_1<-data.frame(seq1=seq(from=0,to=10,by=1),
                 seq2=seq(from=11,to=31,by=2) ) 



# Exercise 3

Assume vectors
name.list<-c("Sasha","Igor","Vlad")
test_score<-c(41,43,50)
Use data.frame() to create
data frame and call it db_1

What function you can use to verify that db_1 is actually
a data frame ?

db_1<-data.frame(name.list,test_score)
class(db_1)
is.data.frame(db_1)



# Exercise 4

Assume records
product_group: Coffee,Culinary,Dairy
avg_price: 50,54,59

Create data frame from given records.
Records names should represent colums names.
Columns names and values should be specified as
arguments for data.frame()

db_1<-data.frame(product_list=c("Coffee","Culinary","Dairy"),
                 price_list=c(50,54,59) )
class(db_1)




# Exercise 5
Assume vectors which contain 
names of forecast methods and MAPE as accuracy measure.
MAPE generated randomly.
model_id=c(11:15)
model_name=c("ARIMA","MEANF","HoltWinters","RWALK","TSLM")
mape_data=c(25.09, 24.26, 19.94, 18.89, 28.12)

Combine 3 vectors in 1 data frame which would represent
goodness of fit data.

Next use str() function to check type of data 
of each column.

goodness_fit<-data.frame(model_id,model_name,mape_data)
str(goodness_fit)

Notice that colums names are also referenced as variables.
" 'data.frame':	5 obs. of  3 variables: "




# Exercise 6

Assume vectors and data frame 
name<- c("a1", "b2", "c3")
group1 <- c(34, 24, 56)
group2 <- c(78, 78, 34)

Combime we vectots in 1 data frame
called sample_frame.

Practice str() function to verify 
type of data in  each column, total numbers of
columns and number of observations per column.

sample_frame<-data.frame(name, group1, group2)
str(sample_frame)




# Exercise 7

Assume data frame

sample_frame<-data.frame(SKU=c("SKU_1","SKU_2","SKU_3","SKU_4"),
                         Base_Price=c(23.73, 19.45, 16.60, 20.33),
                         Unit_Weight=c(101.76,101.73,99.63,100.82) )

Use names() and rownames()  to get
vector of column and rows names.

names(sample_frame)
rownames(sample_frame)

If not supplied,data.frame 
function assignes names for rows which represent 
row numbers strating from 1.





# Exercise 8

Assume data frame

sample_frame<-data.frame(c("SKU_1","SKU_2","SKU_3","SKU_4"),
                         c(23.73, 19.45, 16.60, 20.33),
                         c(101.76,101.73,99.63,100.82) )

apply names() function to sample_frame, to check what
happens if column names are not specified
for data.frame(). 

names() function is representatuive of 
replacement functions. 
It can be used both to check 
names of data frame columns and to set 
the names of data frame via code:
names(object)<-character_vector with names.

Change columns names of sample_frame to "SKU", "Base_Price",
"Unit_Weight".

names(sample_frame)<-c("SKU","Base_Price","Unit_Weight")
sample_frame



# Exercise 9

Assume data frame

sample_frame<-data.frame(c("Record_1","Record_2","Record_3"),
                         c("Exercise_1","Exercise_2","Exercise_3"),
                         c("Back","Pectoralis","Quadriceps"),
                         c(98.74, 100.31, 100.49) )

Use names() fucntion to assign 
the following names to columns:
"Records","Exercise","Muscle_Group","Weight_Lifder"


names(sample_frame)<-c("Records","Exercise","Muscle_Group",
                       "Weight_Lifder")

First column of data frame contains actual rows names for 





# Exercise 10

Assume vectors:
Records<-c("Record_1","Record_2","Record_3")
Exercise<-c("Exercise_1","Exercise_2","Exercise_3")
Muscle_Group<-c("Back","Pectoralis","Quadriceps")
Weight_Lifder<-c(98.74, 100.31, 100.49)


sample_frame<-data.frame(Records,Exercise,
                         Muscle_Group,Weight_Lifder)
rownames(sample_frame)

First columns actually contains rows numbers.
We can transform column records to row names.

row.names argument of data.frame() alows to specily
column whose values
can be used for row names.

sample_frame<-data.frame(Records,Exercise,
                         Muscle_Group,Weight_Lifder,row.names=1)

rownames(sample_frame)




