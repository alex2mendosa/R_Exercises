# Exercise 1
Run the following code:

  vec_1&lt;-sample(20:30,10,replace=TRUE)
  vec_2&lt;-sample(letters,10,replace=TRUE)
  vec_3&lt;-sample(LETTERS,10,replace=TRUE)
  vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
  sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                             c=vec_3,d=vec_4,stringsAsFactors=FALSE)

  Extract columns from data frame in reverse order,
  use both vector with column numbers and vector with
  column names as indices.

  sample_1[length(sample_1):1 ]   or
  sample_1[,length(sample_1):1 ]
  sample_1[ c("d","c","b","a") ] 
  
  
  
  # Exercise 2 
  Run the following code:

  vec_1&lt;-sample(20:30,10,replace=TRUE)
  vec_2&lt;-sample(letters,10,replace=TRUE)
  vec_3&lt;-sample(LETTERS,10,replace=TRUE)
  vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
  sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                       c=vec_3,d=vec_4,stringsAsFactors=FALSE)
  
  Extract columns in the following order:
  c,d,a,b, use character vector for indexing.
  Use str() function to check if columns type
  is preserved after extraction. 
  
  sample_1[ c("c","d","a","b") ] 
  str(sample_1); str(  sample_1[ c("c","d","a","b") ]  )
  
  
  # Exercise 3

  vec_1&lt;-sample(20:30,10,replace=TRUE)
  vec_2&lt;-sample(letters,10,replace=TRUE)
  vec_3&lt;-sample(LETTERS,10,replace=TRUE)
  vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
  sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                       c=vec_3,d=vec_4,stringsAsFactors=FALSE)
  
Data frame indexing  is used to point and extract elements from host
data frame. Indexing is different from 
filtering and allows to duplicate elements.

Extract columns in the following order 
c,d,a,b,a,a,c,c
Assign data frame in output to varible
sample_2 and use names() fucntion to check 
if data frame can contain columns with identical names.

sample_2&lt;-sample_1[ c("c","d","a","b","a","a","c","c") ] 
names(sample_2)  

Columns of data frame must have different names, therefore 
R automatically modifies duplicated names.


# Exercise 4
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)

sample_2&lt;-sample_1[ c("d","b","a","b","a","a","c","c") ] 
 
Data frame sample_2 now contains original names and
modified names for duplicated columns.
Use names() function to rename columns.
New names should be elements from build in 
vector "letters" from 1 to the length of data frame.


names(sample_2)&lt;-letters[1:length(sample_2) ]



# Exercise 5

vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)

Extract all columns and rows from sample_1,
with reverse rows order.

sample_1[10:1,]
Vector with rows indices comes first,
we skip column indices, therefore
we extract all columns. 



# Exercise 6
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)

Now use seq() function to create indices for 
even rows, and use it to extract all even rows
folowed by duplicated first row.

loc.1&lt;-seq(from=2, to=10,by=2)
sample_1[ c(loc.1,1,1) ,]

Notice that last row name is modified, just as we 
cant have duplicated names for columns, 
same names for rows are not allowed.
In practice, we should be more conserned about 
informative column names and keep rows names as simple 
consecutive numbers.




# Exercise 7

vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)

Rather than using length() to estimate number
of columns, use nrow() and ncol() functions to calculate
number of rows and columns respectively. 

Apply both functions to sample_1.
  
nrow(sample_1)
ncol(sample_1)  , you can also try dim(sample_1) to get
2 element vector with dimentions.





# Exercise 8

vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)

We need to extract first three rows, and last two rows, use ncol() and nrow() 
functions to create vector with indices.
Use single expression.

sample_1[ c(1:3,nrow(sample_1),nrow(sample_1)-1) ,  ]





# Exercise 9

vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)

R offers head() and tail() functions to specify 
number of rows to extract from top and bottom,
for example, 
head(sample_1,2) extract first and second rows
tails(sample_1,2) extract last two rows

Use head() and tail() to write 2 expressions to extract first
four and first five columns. Assign result of second 
expression to new data frame sample_2 and extract
first and second rows from it.

head(sample_1,4)
tail(sample_1,5)
sample_2&lt;-tail(sample_1,5)
sample_2[1:2,]

Notice that when we assign extracted data to another data frame,
sample 2 inherits row names from 
sample_1.
Rows names of sample_2  do not include 1 or 2,
however sample_2[1:2,] works because actual rows
indices and row names are different 
characteristics of data frame. 










# Exercise 10

vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)


Combine respective vectors into data frame sample_1.
Make sure that after binding second and third columns are
of character type.


Practice following functions as they form
pillars of data frame manipulation:
names(), ncol() ,nrow(),length() ,tail(),head(),str()





sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,stringsAsFactors=FALSE)

As soon as you can access data frames dimentions,
positional indexing based of columns and rows numbers
becomes as easy as indexing for vectors.


















  
  
  
