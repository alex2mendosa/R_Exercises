# Exercise 1
Run the following code:
  # Dataframe rearrangement
  vec_1<-sample(20:30,10,replace=TRUE)
  vec_2<-sample(letters,10,replace=TRUE)
  vec_3<-sample(LETTERS,10,replace=TRUE)
  vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
  sample_1<-data.frame(a=vec_1,b=vec_2,
                             c=vec_3,d=vec_4,stringsAsFactors=FALSE)

  Extract columns from data frame in reverse order,
  use both vectrorw tith column numkber of names of columns
  
  sample_1[length(sample_1):1 ]   or
  sample_1[,length(sample_1):1 ]
  sample_1[ c("d","c","b","a") ] 
  
  
  
  # Exercise 2 
  Run the following code:
    # Dataframe rearrangement
    vec_1<-sample(20:30,10,replace=TRUE)
  vec_2<-sample(letters,10,replace=TRUE)
  vec_3<-sample(LETTERS,10,replace=TRUE)
  vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
  sample_1<-data.frame(a=vec_1,b=vec_2,
                       c=vec_3,d=vec_4,stringsAsFactors=FALSE)
  
  Extract columns in the following order of column:
    c,d,a,b, use character vector for indexing.
  
  sample_1[ c("c","d","a","b") ] 
  
  
  
  # Exercise 3
  Run the following code:
    # Dataframe rearrangement
    vec_1<-sample(20:30,10,replace=TRUE)
  vec_2<-sample(letters,10,replace=TRUE)
  vec_3<-sample(LETTERS,10,replace=TRUE)
  vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
  sample_1<-data.frame(a=vec_1,b=vec_2,
                       c=vec_3,d=vec_4,stringsAsFactors=FALSE)
  
Data frame indexing used to poins elements from host
data frame we want to extract. Indexing is different from 
filering and allows to duplicate elements.

Extract columns in the following order 
c,d,a,b,a,a,c,c
Assign the data frame in output to varible
sample_2 and use names() fucntion to check 
if dta frame can cointain columsn with the same names.

sample_2<-sample_1[ c("c","d","a","b","a","a","c","c") ] 
names(sample_2)  

Columns of data frame should have different names, therefore 
R automaticcly modifies duplicated names.


# Exercise 4
Run the following code:
  # Dataframe rearrangement
vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1<-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)

sample_2<-sample_1[ c("d","b","a","b","a","a","c","c") ] 
 
Data frame sample_2 now contains original columns names and
modified names for duplicated columns.
Use names() function to rename columns.
New names are elements from inbuild 
vector letters  from 1 to the  length of data frame.


names(sample_2)<-letters[1:length(sample_2) ]



# Exercise 5
Run the following code:
  # Dataframe rearrangement
  vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1<-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)


Extract all columns and rows from sample_1,
with reverse row order.


sample_1[10:1,]
Vector with row indices come first,
we skip column indices therefore
we eactract all columns. 



# Exercise 6
Run the following code:
  # Dataframe rearrangement
  vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1<-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)


Now use seq() fucntion to create indices for 
even rows, and use it to extract oll even rows
folowed by duplicated first row.

loc.1<-seq(from=2, to=10,by=2)
sample_1[ c(loc.1,1,1) ,]

Notice that last row name is modified, just as we 
cant have duplicated names for columns, 
same row names are not allowed.
In practice, we shoukld be more conserned about 
informative column names and keep row names as simple 
consequtive numbers.




# Exercise 7
Run the following code:
  # Dataframe rearrangement
vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1<-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)


Rather than using length() to estimate number
of columns , use nrow and ncol to calculate
number of rows and columns respectively. 


Apply both fcuntions to sample_1
  
  
nrow(sample_1)
ncol(sample_1)  , you can also try dim(sample_1) to get
2 element sdvector with dimentions.





# Exercise 8
Run the following code:
  # Dataframe rearrangement
  vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1<-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)



we need to extract first three rows, and last 2 rows, use ncol and nrow 
fucntions to creavte vector with  indices.
Use single expression


sample_1[ c(1:3,nrow(sample_1),nrow(sample_1)-1) ,  ]





# Exercise 9
Run the following code:
  # Dataframe rearrangement
  vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1<-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)



R offers head and tail fucntion to specify 
number of rows  to extract from top and botto,
for example 
head(sample_1,2) extract first and second columns
tails(sample_1,2) extract last rows


Use head and tail to write 2 expressions to extract fitst 4 and lst 5 columns
Assign result of second expression to new data frame  sample_2 and extract
firast and second rows from it.

head(sample_1,4)
tail(sample_1,5)
sample_2<-tail(sample_1,5)
sample_2[1:2,]


Notice that if we 
assing extracted data to anothe data frame,
sample 2 inherits row  names from 
host data frame.
Row names of sample_ do not include 1 or 2,
however sample_2[1:2,] works because row 
actual indices and row names are different 
charactersitics of data frame. 










# Exercise 10
Run the following code:
  # Dataframe rearrangement
  vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)



Conbine respective vectors into data frame sample_1.
Make sure than agter binding second and third columns are
of character type.


Practice the following functuions as they form
the pillars of data frame manipulation:
  names(), ncol() ,nrow(),length() ,tail(),head(),str()





sample_1<-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)
As soon as you can access data frames dimentions,
positional indexing based of columsn and row numbers
becomes as easy as indexing with vectors.
Result of each fcuntion is either a vector or
anothe data frame.






















  
  
  