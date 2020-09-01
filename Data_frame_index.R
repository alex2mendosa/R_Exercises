# Exercise 1

Run the following code to generate
2 vectors of random numbers and letters.

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
sample_frame<-data.frame(digits=vec_1,letters=vec_2)

sample() function randomly select 10 elements from 
vectors 20:30 and letters.lettets is vector
already build in R.

Write 2 R expressions to extract 
column 1 and all rows from a data frame using
column name and column number.
Use $ immediately after data frame name followed
by column name you want to extract.

sample_frame$digits
sample_frame[,1]  

Notice that in case we extract 1 column, 
output would represent atomic vector which
has the same type as the column which was
extracted.


# Exercise 2

Run the following code to generate
3 vectors of random numbers and letters.

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE) # vector of character class
vec_3<-sample(LETTERS,10,replace=TRUE) # vector of character class
sample_frame<-data.frame(digits=vec_1,case_low=vec_2,case_high=vec_3)

Write 2 R expression to extract 
second column by column number, next write expression to 
extract only columns 1 and 3 from a data frame using
vectors with columns numbers as indices.
Use single expressions for both tasks.

sample_frame[,2]  
# Notice that class of vec_2 and vec_3 are characters
# however when combined in data frame, character class is 
# coerced to factor class. 
# Extracted columns now also inherit factor class.
                 
sample_frame[,c(1,3)]

Data frame has 2 dimentions, numbers of rows and columns,
therefore, in square brackets you first indicate vector with row numbers, 
next you indicate vector with column numbers. 
If row of column index are not specified,
all rows or all columns would be displayed. 



# Exercise 3

Run the following code to generate
3 vectors of random numbers and letters.

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
sample_frame<-data.frame(digits=vec_1,case_low=vec_2,case_high=vec_3)

Write R expressiom to extract 
first and second columns using their names
referenced by character vector.
Use single expression.

sample_frame[,c("digits","case_high")]
class( sample_frame[,c("digits","case_high")] ) indicates data.frame
class( sample_frame[,c("digits")] ) indicates atomic vector



# Exercise 4

Use  the following code to generate
3 vectors of random numbers and letters.

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE) # vector of character class
vec_3<-sample(LETTERS,10,replace=TRUE) # vector of character class

Write  R expressions which do the following:

1.Create data frame named sample_frame where columns are named
digits, case_low,case_high.
use str() fucntion to check type of data for each column.

2. Repeat task 1, but add to data.frame
fucntion argument stringsAsFactors=FASLE.
use str() again to check if columns now have different class.

3. Extract columns 1 and 3 from a data frame using
vectors with columns numbers.

sample_frame<-data.frame(digits=vec_1,case_low=vec_2,case_high=vec_3)  
str(sample_frame)

sample_frame<-data.frame(digits=vec_1,case_low=vec_2,case_high=vec_3,
                        stringsAsFactors=FALSE)  
str(sample_frame)


sample_frame[,c(1,3)] or
sample_frame[,c("digits","case_high")] 




# Exercise 4

Run the following code:

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
sample_frame<-data.frame(digits=vec_1,case_low=vec_2,case_high=vec_3)


Write 2 R expressions to extract 
second and fifth , first and fourth rows where
indices  are referenced in numeric vector. 

sample_frame[c(2,5),]
sample_frame[c(1,4),]

Notice, we indicate rows, commo,
columns are not referenced, therefore 
we extract all columns. 



# Exercise 5

Run the following code:

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
sample_frame<-data.frame(digits=vec_1,case_low=vec_2,case_high=vec_3)

when length() fucnton is applied to data frame , output
indicates total number of columns. 

Write 2  R expressiom to extract 
first and last columns, second and penultimate column. Use length() 
to estimate indices of columns.

sample_frame[,c(1,length(sample_frame) )]
sample_frame[,c(2,length(sample_frame)-1 )]

Because we dont indocate specific rows, 
R reads it as instruction to eactract all rows. 



# Exercise 6

Run the following code:

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)

sample_frame_1<-data.frame(digits=vec_1,case_low=vec_2, stringsAsFactors=FALSE)
sample_frame_2<-data.frame(case_high=vec_3,y_logic=vec_4, stringsAsFactors=FALSE)


$ allows to access columns of each data frame,
Useit ot define arguments data.frame() fucntion to bind 
vectors in the following order

digits,y_logic,case_low,case_high
forming data frame called sample_frame_3

Next, use name fucntion to rename columns
of sample_frame_3

sample_frame_3<-data.frame(sample_frame_1$digits,sample_frame_2$y_logic,
            sample_frame_1$case_low,sample_frame_2$case_high)

names(sample_frame_3)<-c("digits","y_logic","case_low","case_high")


OR

sample_frame_3<-data.frame(digit=sample_frame_1$digits,y_logic=sample_frame_2$y_logic,
            case_low=sample_frame_1$case_low,case_high=sample_frame_2$case_high)



# Exercise 7

Run the following code:

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)

sample_frame_1<-data.frame(vec_1,vec_2,
            vec_3,vec_4,stringsAsFactors=FALSE)
names(sample_frame_1)<-c("digits","case_low","case_high","y_logic")


Use vector with indices to extract
element in 4-th row  and 2-nd column, next extract 
4-th row  and 4-nd column

sample_frame_1[4,2] or sample_frame_1[4,"case_low"]
sample_frame_1[5,4] or sample_frame_1[4,"case_low"]


# Exercise 8

Run the following code:

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)

sample_frame_1<-data.frame(vec_1,vec_2,
            vec_3,vec_4)
names(sample_frame_1)<-c("digits","case_low","case_high","y_logic")


Use vector with indices to extract elements 
which correspond to
1-st and 4-th row and 1-st and 3-rd columns
in singgle expression

sample_frame_1[c(1,4),c(1,3)]



# Exercise 9

Run the following code:

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)

sample_frame_1<-data.frame(vec_1,vec_2,
            vec_3,vec_4)
names(sample_frame_1)<-c("digits","case_low","case_high","y_logic")


use seq() function to create vector of uneven numbers and use it to extract 
uneven rows from columns 1 and 3

loc.1<-seq(from=1,to=10,by=2)
sample_frame_1[loc.1,c(1,3)]




# Exercise 10

Run the following code:

vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)

sample_frame_1<-data.frame(vec_1,vec_2,
            vec_3,vec_4)
names(sample_frame_1)<-c("digits","case_low","case_high","y_logic")


use seq() function to create vector of even  numbers and use it to extract 
even rows from all columns, columns should be in reverse order

loc.1<-seq(from=2,to=10,by=2)
sample_frame_1[loc.1,4:1]












