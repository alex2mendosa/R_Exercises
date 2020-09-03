# logical indexing


Run the following code:
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,stringsAsFactors=FALSE)

Logical indexing and filtering, where elements are selected
as soon as they meet certain criteria, are possible for
data frames. To apply them, we need logical
vector where values of TRUE would indicate
what rows or columns to select
Lets check several examples:

sample_1$a>25
sample_1[ sample_1$a>25 , ] 

sample_1$a>20 & sample_1$a<25
sample_1[ sample_1$a>20 & sample_1$a<25 , ] 

sample_1$a>20 & sample_1$a<25  & sample_1$d==FALSE
sample_1[ sample_1$a>20 & sample_1$a<25  & sample_1$d==FALSE , ] 

$ sigil allows to access each column of data frame 
and treat it as atomic vector, then
logical vectors are formed by checking what elements 
fit our conditions. Next, we simply use created logical vector 
of length equal to number of rows in sample_1.

Now write single expression to extract 
values which fit following conditions:
  
values in column a are >=20 and 
values in d equal FALSE and  
values in b are not equal to "a" 

sample_1$a>=20 & sample_1$d==FALSE & sample_1$b!="a" # indices for rowa are formed
sample_1[sample_1$a>=20 & sample_1$a<=24 & sample_1$d==FALSE & sample_1$b!="a", ] 


# EX 2 
Run the following code:
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,stringsAsFactors=FALSE)

Data frames are the most common structures data analyst works with, 
therefore, R offers special set of functions to filter data 
in data frames.Rather than forming logical vectors manually,
we simply specify conditions  for arguments 
for data manupulation functions. 

Try 
subset(sample_1,a>25)
It seelcts only rows where values in 
column "a" are greater than 25.

Use subset() to 
extract records where "d" is equal TRUE

subset(sample_1,d==TRUE)



# EX 3
Run the following code:
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,stringsAsFactors=FALSE)


We can specify multiple conditions for 
subset().
subset(sample_1,a>21 & a&lt;25)

Use subset() to 
extract column where "d" is equal FALSE OR "a" is
less than 25

subset(sample_1,d==FALSE | a&lt;23)




# EX 4
Run the following code:
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,stringsAsFactors=FALSE)

With subset() we can also 
indicate what columns to retrieve
by suppling vector with column names
to argument select. No need to 
use quotation marks for column names.

subset(sample_1,d==FALSE | a&lt;23,select=c(a,b))

Now subset rows where a>22 and "c" is one of the first 10
letters of lower case alphabet,
do not extract column c.


subset(sample_1, a>25 & b %in% letters[1:10] ,select=c(a,b,d)  )
Expression 
sample_1$b%in% letters[1:10] checks element by element 
if values in sample_1$b equal 
to at least one element in letters[1:10]
and results in logical vector of length 10. 




# EX 5
Run the following code:
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
vec_5&lt;--sample(10:20,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,e=vec_5,stringsAsFactors=FALSE)

Use subset() to extract
values which fit following conditions:
a&lt;=25 and "c" equals first 15 letters of Uppercase
alphabet and "d" equals TRUE and "e" should be even.
Do not extract column d.

Even number %% 2 is 0 as there is no remainder.
by adding "-" sign for column name in select argument, 
you can indicate what columns not to extract.


a&lt;=25 & c %in% LETTERS[1:15] & d==TRUE & e %% 2 == 0

subset(sample_1, a&lt;=27 & c %in% LETTERS[1:15]  & e %% 2 == 0)
To maintain readability  it is perfectly fine to use round brackets

subset(sample_1, (a&lt;=27) & (c %in% LETTERS[1:15])  & (e %% 2 == 0), select=-d )





# EX 6
Run the following code:
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
vec_5&lt;--sample(10:20,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,e=vec_5,stringsAsFactors=FALSE)


":" colon operator can be used to define input for
select argument for subset().
It allows to use column names to define range of columns to extract,
for example  select(a:u) will extract all columns between
columns "a" and "u".

Use subset() to extract values
which fit the following conditions:
a>=25 or e&lt;=15,  additionally, use select() to
extract data in the following order
"b" through "e" and then columns "a".
Simply remember that for select argument we need to define 
atomic vector of names, where inputs can be separated by comma.


subset(sample_1, a>=25 & e&lt;=15,select=c(b:e,a) )




# EX 7
Run the following code:
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
vec_5&lt;--sample(10:20,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,e=vec_5,stringsAsFactors=FALSE)

First create logical vector which would indicate what values in
column 2 are even.
Then replace all even elements in column "e" with 0.

sample_1$e %% 2==0
sample_1$e[ sample_1$e %% 2==0 ]&lt;-0

TRUE values in logical vector indicate what rows 
contain even numbers, sample_1$e[ sample_1$e %% 2==0 ] basically tells:
in column "e" replace elements with 0 if result of sample_1$e %% 2==0  is TRUE.





# EX 8
Run the following code:
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
vec_5&lt;--sample(10:20,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,e=vec_5,stringsAsFactors=FALSE)

Fow rows where "a" contains uneven
numbers, replace values in column "c"  to character "Uneven". 

Now first create logical vector which would indicate what values in
column 1 are uneven.
Next apply which() to logical vector get
row numbers of uneven values.

loc.1&lt;-which( (sample_1$a %% 2)!=0 )

sample_1$c[loc.1]&lt;-"Uneven"





# EX 9
Run the following code:
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters[1:5],10,replace=TRUE)
vec_3&lt;-sample(LETTERS[1:5],10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
vec_5&lt;--sample(10:20,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,e=vec_5,stringsAsFactors=FALSE)

tolower() function converts Uppercase characters to lowercase characters.
tolower(LETTERS)==letters
        
Use subset() to extract records
where "d" equals TRUE and letters in "b" and "c" are equal when case
is lower for both.


subset(sample_1,d==TRUE  &  tolower(c)==b )
This example demonstrates that subset conditions can contain 
multiple statements with logical operators and also
modified vertions of data frame columns. 



# EX 10
Run the following code:
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
vec_5&lt;--sample(1:10,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,e=vec_5,stringsAsFactors=FALSE)

toupper() function converts lowercase  characters to Uppercase  characters.
toupper(letters)==LETTERS
        
Use subset() to extract all elements
where "d" equals FALSE and letters in "b" and "c" are equal when case
is the same for both[use either tolower ot toupper] and elements in e^2 are
greater that elements in "a".
        
        
 subset(sample_1, toupper(b)==c  & e^2>a)
Notice that in this case e^2 is treated the same way as sample_1$e^2,
because we have already specified in first argument of subset()
what data frame to use, we no longer need to access columns with
$ operator. 














