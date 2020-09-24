#Exercise 1
Data subsetting[filtering] is a skill inseparable
from data aanlysis, in R filtering can be done 
by invoking functions subset{base} 
or filter{dplyr}. Both functions require 
specification of logical vector with values TRUE
indicating what rows{data frame} or elements{vector}
to extract from data structure.
Filtering therefore, can be done without calling for
specific function or uploading specific library
as soon as you are proficient with 
comparison and logical operators.

Current group of exercises uses build in mtcars 
data set.
mtcars$mpg extracts first column
which can further treated as common vector.
mtcars$mpg>20 results in logical vector with 
sequence of TRUE and FALSE , position of TRUE 
value indicates rows in mtcars where mpg>20.

Now generate 2 logical vectors where hp>120
and transmission is automatic.

mtcars$hp>120
mtcars$am==0


#Exercise 2
Both 
mtcars$hp>120
mtcars$am==0 can now be used to extract rows of interest:
  
mtcars[mtcars$hp>120,1:4]  
mtcars[mtcars$am==0,1:4]  
We extract rows which fit our conditions and only 4
columns starting from 1.
Same result can be achieved with
subset(mtcars,mtcars$hp>120,select=1:4)
Logical vector mtcars$hp>120 is present in both cases.

vec_1<-mtcars$hp
class(vec_1) now data is stored as vector
vec_1[mtcars$hp>120] or
vec_1[vec_1>120] 
Both can be used to filter data as
soon as we specify logical vector correctly.

Now create logical for qsec values lower than
15 and extract rows which fit respective conditions and
first 5 columns. If possible, achieve the  result 
with subset function.

mtcars$qsec<15
mtcars[mtcars$qsec<15,1:5]  or 
subset(mtcars,mtcars$qsec<15,select=1:5)


#Exercise 3
Full potential or R for data filtering is
achieved when comparison operators 
are combined with Logical{Boolean operators}:
and being "&" in R
or being "|" in R

mtcars$hp>120
mtcars$mpg<22
length of both vectors is similar,however
as the condition is different,so is the different 
sequence of True and False

mtcars$hp>120 & mtcars$mpg<22 
& does the following:
if both values in logical vector with same
indices evaluate to TRUE, output is TRUE, generally:
TRUE & TRUE = TRUE
TRUE & FALSE = FALSE
FALSE & TRUE = FALSE
Therefore, mtcars$hp>120 & mtcars$mpg<22 
will produce value of TRUE
if both values in both vectors are True.
mtcars[mtcars$hp>120 & mtcars$mpg<22,1:4]
Output represents rows were mtcars$hp and 
mtcars$mpg<22 are both TRUE.

Now write expression to generate logical 
vector where am==0, mpg>20 and qsec<15

mtcars$am==1 & mtcars$mpg>20 & mtcars$qsec<17
mtcars[mtcars$am==1 & mtcars$mpg>20 & mtcars$qsec<17,1:4]


#Exercise 4
Condition placed on same column
should not contradict each other.
mtcars$am==1 & mtcars$am==0 
Column am can either be 1 or 0 but not both,
therefore no meaningfull output is possible. 
Same for 
subset(mtcars,mtcars$am==1 & mtcars$am==0 ,select=1:5)

mtcars$mpg>20 & mtcars$mpg<20 
Again not possible, because for each value
of FALSE we have 1 value of TRUE
rendering conditions mutually exclusive.

mtcars$mpg>20 & mtcars$mpg<25 
Now we have indices in 2 vectors where
TRUE values exist for both.

Fix the following exression which contain
mutually exclusive conditions:
  
mtcars$mpg>31 & mtcars$disp>60 & mtcars$hp>70
mtcars[mtcars$mpg>31 & mtcars$disp>60 & mtcars$hp>70,1:4]
Some cars with mpg greater than 31 have disp greater than 60
and all hp is lower than 70.

mtcars$mpg>31 & mtcars$disp>60 & mtcars$hp<70
mtcars[mtcars$mpg>31 & mtcars$disp>60 & mtcars$hp<70,1:4]



#Exercise 5
Another compulsory operator
used to generate logical vector is "or"
TRUE | TRUE = TRUE
TRUE | FALSE = TRUE
FALSE | TRUE = TRUE

mtcars$mpg>25 & mtcars$mpg<15  is FALSE for all
indices, while 
mtcars$hp>180 | mtcars$hp<52 produces True for some rows. 
mtcars[mtcars$hp>180 | mtcars$hp<52,1:4]
We get cars from both ends of highest and lowest
hp.

Now select cars with values quantile(mtcars$mpg, c(0.25,0.75))
to select cars with lowest and highest mpg.

mtcars[mtcars$mpg>22.8 | mtcars$mpg<15.42,1:4]

#Exercise 6
We can filter data based on numbers comparison
as well as presence of certain patterns in text.

grepl("Merc|Mazda",row.names(mtcars)) checks if strings 
Merc or Mazda are present as row names. 

Use it to create logical vector
and extract rows for Merc and Mazda for which mpg is greater
than 19.

grepl("Merc|Mazda",row.names(mtcars)) & mtcars$mpg>19  forms logical vector
mtcars[grepl("Merc|Mazda",row.names(mtcars)) & mtcars$mpg>19,1:4]




#Exercise 7
db_1<-data.frame(Manufacturer=unlist(lapply(strsplit( row.names(mtcars)," "),function(x) x[1]) ),
                 mtcars)

We added column to mtcars with Manufacturer name.

Assume we want to select rows only for Toyota,
Merc, Mazda.
It can be done with 
grepl("Merc|Mazda|Toyota",row.names(mtcars)) to indicate 
presence of certain text pattern among row names.

One more approcch is use of %in% operator:
  c("x","w")  %in%   c("q","w","x","y","x")  result in TRUE
if either "x" or "w"  are present in  c("q","w","x","y","x") at least ones.

Use  %in% to extract rows where Manufacturer is Merc

db_1$Manufacturer %in% c("Merc","Mazda")
db_1[db_1$Manufacturer %in% c("Merc","Mazda"),1:4]
Therefore, if value in Manufacturer equals to at least 
1 element in  Merc or Mazda, output would be True.



#Exercise 8
db_1<-data.frame(Manufacturer=unlist(lapply(strsplit( row.names(mtcars)," "),function(x) x[1]) ),
                 mtcars)

Now combine %in% operator , &  to 
select Manufacturer equal to  either Merc, Mazda or Toyota,
manual transmission and mpg greater than 18.

db_1$Manufacturer %in% c("Merc","Mazda","Toyota")
db_1[db_1$Manufacturer %in% c("Merc","Mazda","Toyota") & db_1$am==0 & db_1$mpg>18,]


#Exercise 9

Expressions with %in% can be combined with "!" to negate{reverse} 
logical values[True becomes False and vice versa].
Expression to negate should be wrapped in round brackets
to keep readability of expression. 

rewrite expression in Exercise 9 by pairing ! and %in%
and select all cars exept Merc,Mazda,Toyota
                                     
db_1[!(db_1$Manufacturer %in% c("Merc","Mazda","Toyota")) & db_1$am==0 & db_1$mpg>18,]








