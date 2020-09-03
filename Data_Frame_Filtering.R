# logical indexing
vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters,10,replace=TRUE)
vec_3<-sample(LETTERS,10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1<-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,stringsAsFactors=FALSE)


Run the following code:
vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,stringsAsFactors=FALSE)

Logical indexing, where elements are selected
as soon as they meet certainn criteria is possible for
data frames. Similatrly to vectors, to use logival filtering
we need logical vector where values of TRUE would indicate
what rows or coluns to extract.

Lets check several examples

sample_1$a>25
sample_1[ sample_1$a>25 , ] 

sample_1$a>20 & sample_1$a<25
sample_1[ sample_1$a>20 & sample_1$a<25 , ] 

sample_1$a>20 & sample_1$a<25  & sample_1$d==FALSE
sample_1[ sample_1$a>20 & sample_1$a<25  & sample_1$d==FALSE , ] 

Logical vectors are formed by checking if elements
in each column row by row fit our condition.
Next we simply use created logical vector 
with length equal to number of rows in sample_1
$ accesor is used to check condition for 
each column.

Now write single expression to extract 
values which fit following conditions:
  
values in a>=20 and <=24   and 
values in d equal FALSE and  
values in b are not equal to "a" 

sample_1$a>=20 & sample_1$a<=24 & sample_1$d==FALSE & sample_1$b!="a"
sample_1[sample_1$a>=20 & sample_1$a<=24 & sample_1$d==FALSE & sample_1$b!="a", ] 


# EX 2 
Run the following code:
  vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,stringsAsFactors=FALSE)

Data frame are the most common structure data analyst workd with, 
therefore
R offers special set of fcuntion to filter data 
in data frame. Rater that forming logical vector4 manually,
we simply specify conditions as arguements 
for filtering fucntion. 

Try 
subset(sample_1,a>25)
It leaves only rows where values in 
column a are greater than 25


Use subset function to 
extract column where d is equal TRUE
subset(sample_1,d==TRUE)



# EX 3
Run the following code:
  vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,stringsAsFactors=FALSE)


We can specilymultiple conditions for 
subset fucntion.
subset(sample_1,a>21 & a<25)

Use subset function to 
extract column where d is equal FALSE OR a is
less than 25

subset(sample_1,d==FALSE | a<23)




# EX 4
Run the following code:
  vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,stringsAsFactors=FALSE)


Besides what rows to extract, we cna also 
indicate what columns to retrieve
by suppling vectro with column names
to arguemtn select

subset(sample_1,d==FALSE | a<23,select=c(a,b))

Now subset rows where a>22,c is one of the first twenty
letters of lower case alphabet, d equals FALSE,
do not extract column c.


subset(sample_1, a>25 & b %in% letters[1:10] ,select=c(a,b,d)  )
Expression 
sample_1$b%in% letters[1:20] checks element by element 
if values in sample_1$b equal 
to at least one element in letters[1:20]
and result in logical vector of length ten. 




# EX 5
Run the following code:
  vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
vec_5&lt;--sample(10:20,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,e=vec_5,stringsAsFactors=FALSE)


use subset fcuntion to extract
values which fit the following condition
a<=25 and c equals first 15 letters of Uppercase
alphabet and d eauls TRUE and e should be even.
Do not extract column d

even number %% 2 is 0 as there is no remainder.
by adding - sign for column name in select arguemnt 
you can indicate what columns not to extract.


a<=25 & c %in% LETTERS[1:10] & d==TRUE  & e %% 2 == 0

subset(sample_1, a<=27 & c %in% LETTERS[1:15]  & e %% 2 == 0)
To maintain readability it is perfectly fine to use round brackets

subset(sample_1, (a<=27) & (c %in% LETTERS[1:15])  & (e %% 2 == 0),select=-d )





# EX 6
Run the following code:
  vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
vec_5&lt;--sample(10:20,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,e=vec_5,stringsAsFactors=FALSE)


: colon operator can be used to define input for
select arguemtn fo subset fucntion.
It allows to use column to define range of colun to eatract,
for example  select(a:u) will extract all columns between
columns and u.

use subset fcuntion to extract
values which fit the following condition
a>=25 or e<=15, use select fucntion to
extract data in the following order
b through e defined with colon and then colon a.
simply remenet than for select argument we need to define 
atomic vector of names, where inputs are  separated by comma.


subset(sample_1, a>=25 & e<=15,select=c(b:e,a) )




# EX 7
Run the following code:
  vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
vec_5&lt;--sample(10:20,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,e=vec_5,stringsAsFactors=FALSE)


Now first create logical vector which would indicate what values in
column 2 are even.
Next replace all even element in column e with 0.

(sample_1$e %% 2)==0
sample_1$e[ sample_1$e %% 2==0 ]<-0

TRUE values in logical values indica what rows 
contain even numbers, sample_1$e[ sample_1$e %% 2==0 ] basically tells:
in column e replace elements with 0 if result of sample_1$e %% 2==0  is TRUE

also 




# EX 8
Run the following code:
  vec_1&lt;-sample(20:30,10,replace=TRUE)
vec_2&lt;-sample(letters,10,replace=TRUE)
vec_3&lt;-sample(LETTERS,10,replace=TRUE)
vec_4&lt;-sample( c(TRUE,FALSE) ,10,replace=TRUE)
vec_5&lt;--sample(10:20,10,replace=TRUE)
sample_1&lt;-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,e=vec_5,stringsAsFactors=FALSE)


Fow rows whenre a contains uneven
numbers, replace values in column cto UNEVEN. 

Now first create logical vector which would indicate what values in
column 1 are uneven.
Next apply to logical vector which fcuntion
to get row numbers of uneven values.


loc.1<-which( (sample_1$a %% 2)==0 )

sample_1$c[loc.1]<-"Uneven"








# EX 9
Run the following code:
  vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters[1:5],10,replace=TRUE)
vec_3<-sample(LETTERS[1:5],10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
vec_5<-sample(1:100,10,replace=TRUE)
sample_1<-data.frame(a=vec_1,b=vec_2,
                        c=vec_3,d=vec_4,e=vec_5,stringsAsFactors=FALSE)

tolower(fucntion converts Uppercase Character to lowercase characters
tolower(LETTERS)==letters
        
Use subset fucntion to extract all elements
from column a only where d equals TRUE and leters in b cnd c are qual when case
is lower for both.


subset(sample_1,d==TRUE  &  tolower(c)==b & d==FALSE)
This examle shows that subset condition can contain both
multiple statement with logical operator  but also
modified vertion od data frame columns. 









# EX 10
Run the following code:
  vec_1<-sample(20:30,10,replace=TRUE)
vec_2<-sample(letters[1:5],10,replace=TRUE)
vec_3<-sample(LETTERS[1:5],10,replace=TRUE)
vec_4<-sample( c(TRUE,FALSE) ,10,replace=TRUE)
vec_5<-sample(1:10,10,replace=TRUE)
sample_1<-data.frame(a=vec_1,b=vec_2,
                     c=vec_3,d=vec_4,e=vec_5,stringsAsFactors=FALSE)

toupper(fucntion converts lowercase  Character to uppercase  characters
        tolower(LETTERS)==letters
        
        Use subset fucntion to extract all elements
        from column a only where d equals FASLE and leters in b cnd c are qual when case
        is lower for both.
        and power 2 of ements in column e is grater that elemtns in a.
        
        
        subset(sample_1, toupper(b)==c  & e^2>a)
notice that in this case e^2 is treated same way as sample_1$e,
but because, we have already specified in first arguemnt of subset
function waht data frame is used, we no longer need to call for
$ operator. 














