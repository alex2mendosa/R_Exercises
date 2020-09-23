#Exercise 1
Data subsetting[filtering] is a skill inseparable
from data aanlysis, in R filtering can be done 
by invoking funcitons subset{base} 
or filter{dplyr}. Both functions requres 
specification of logical vector with values TRUE
indicating what rows{data frame} or elements{vector}
to extract from data structure.
Filtering therefore can be done without calling for
specific fcuntion and uploading specific library
as soon as you are proficient with 
logical operator.

Curtrent group of exercises uses build in mtcars 
data set.
mtcars$mpg extract first column whcih we can futher treat as 
common vector.
mtcars$mpg>20 results in logical vector with 
sequence of TRUE and False , index of any True 
value indiocates row in mtcars where mpg>20

Now generate 2 logical vectors where hp>120
and transmission is automatic

mtcars$hp>120
mtcars$am==0


#Exercise 2

Both 
mtcars$hp>120
mtcars$am==0 can now bw used to extract rows of interest:
  
mtcars[mtcars$hp>120,1:4]  
mtcars[mtcars$am==0,1:4]  
we extract rows which fit our conditions and only 4
columns starting from 1.
Same resuklt can be achieved with
subset(mtcars,mtcars$hp>120,select=1:4)
Logical vector mtcars$hp>120 is present in both cases.


vec_1<-mtcars$hp
class(vec_1) Now column hp is stored as vector
vec_1[mtcars$hp>120] or
vec_1[vec_1>120] 
Both can be used 
to filter data as soon as we specify logical vector correctly.

Now create logical values for qsec values lower than
15 and extract rows which fit rrespective condition and
first 5 columns. If possible, achieve same result 
with subset fcuntion.

mtcars$qsec<15
mtcars[mtcars$qsec<15,1:5]  or 
subset(mtcars,mtcars$qsec<15,select=1:5)


#Exercise 3
Fill potential for filtering is
achieved when comparison operators 
are combined with Logical{Boolean operators}:
and being & in R
or being | in R

mtcars$hp>120
mtcars$mpg<22
length of both vectors is similar however
as the condition is different so is the different 
sequence of True and False

mtcars$hp>120 & mtcars$mpg<22 
& does the following:
if both values in logical vector
with same indices evaluate to TRUE,
output is TRUE, generally:
TRUE & TRUE = TRUE
TRUE & FALSE = FALSE
FALSE & TRUE = FALSE
Therefore mtcars$hp>120 & mtcars$mpg<22 
will produce value of TRUE
in both values in both vectors are true.
mtcars[mtcars$hp>120 & mtcars$mpg<22,1:4]
will output rows were mtcars$hp and 
mtcars$mpg<22  are TRUE.

now write exprsiinn to generate 
logical vector where am==0, mpg>20
and qsec<15

mtcars$am==1 & mtcars$mpg>20 & mtcars$qsec<17
mtcars[mtcars$am==1 & mtcars$mpg>20 & mtcars$qsec<17,1:4]


#Exercise 4
Condition placed on same column
should not contradict each other.
mtcars$am==1 & mtcars$am==0 
column am can either be 1 or 0 but not both,
therefore all columns are 0. 
Same for 
subset(mtcars,mtcars$am==1 & mtcars$am==0 ,select=1:5)

mtcars$mpg>20 & mtcars$mpg<20 
Afain not possible, because for each values
of FALSE we have 1 value of TRUE
rendering conditions mutually exclusive

mtcars$mpg>20 & mtcars$mpg<25 
Now we have elemnet in both vectors where
for which both TRUE Exist.

Fix the following exression which contain
mutually exclusive conditions:
  
mtcars$mpg>31 & mtcars$disp>60 & mtcars$hp>70
mtcars[mtcars$mpg>31 & mtcars$disp>60 & mtcars$hp>70,1:4]
Cars with mpg greater than 31 have disp greater than 60
and all hp is lower than 70.

mtcars$mpg>31 & mtcars$disp>60 & mtcars$hp<70
mtcars[mtcars$mpg>31 & mtcars$disp>60 & mtcars$hp<70,1:4]



#Exercise 6


Anoter extremely usefull  operator 
used to generate logical vector is or

TRUE | TRUE = TRUE
TRUE | FALSE = TRUE
FALSE | TRUE = TRUE

Now because 
mtcars$mpg>25 & mtcars$mpg<15  is FALSE for all
values , while 
mtcars$hp>180 | mtcars$hp<52 is TRUE for all values for which
mpg fiths 1 out of 2 condition. 
mtcars[mtcars$hp>180 | mtcars$hp<52,1:4]
We get cars from both end of higest and lowest
hp

Now select cars with values quantile(mtcars$mpg, c(0.25,0.75))
to select cars with lowest anf higest mpg


mtcars[mtcars$mpg>22.8 | mtcars$mpg<15.42,1:4]

#Exercise 7

we can filter data based on number values
as well as presence of certain paterns in text.

grepl("Merc|Mazda",row.names(mtcars)) check if text 
"Merc" or "Mazda" are present in row names. 

Use it to create logical vector
and extract rows for Merc and Mazda for which mpg is greater
than 19.

grepl("Merc|Mazda",row.names(mtcars)) & mtcars$mpg>19 form logical vector
mtcars[grepl("Merc|Mazda",row.names(mtcars)) & mtcars$mpg>19,1:4]




#Exercise 8


db_1<-data.frame(Manufacturer=unlist(lapply(strsplit( row.names(mtcars)," "),function(x) x[1]) ),
                 mtcars)

We added column to mtcars with manufacturer name.

Assume we want to select rows only or Toyota,
Merc, Mazda.
It can be done with 
grepl("Merc|Mazda|Toyota",row.names(mtcars)) to indicate 
presence of certain text pattern among ro names.

One more approcch is use of %in% operator:
  c("x","w")  %in%   c("q","w","x","y","x")  result in TRUE
if either "x" or "w"  are not  present in  c("q","w","x","y","x") at leat ones.

Use  %in% to extract rows where Manufacturer is "Merc"

db_1$Manufacturer %in% c("Merc","Mazda")
db_1[db_1$Manufacturer %in% c("Merc","Mazda"),1:4]
Therefor if value in Manufacturer equsl to at least "Merc","Mazda"
iutput would be True.



#Exercise 9
db_1<-data.frame(Manufacturer=unlist(lapply(strsplit( row.names(mtcars)," "),function(x) x[1]) ),
                 mtcars)

Now combine %in% operator , &  to 
select Manucacturer equal to Merc, Mazda ot toyota,
manual transmission and mpg greater than 18


db_1$Manufacturer %in% c("Merc","Mazda","Toyota")
db_1[db_1$Manufacturer %in% c("Merc","Mazda","Toyota") & db_1$am==0 & db_1$mpg>18,]




#Exercise 10

Expression with %in% can be combined with "!" to negate{reverse} 
logical values[true becomes false and vice versa]
Expression to negate should be wrapped in round brackets
to keep readabilitu of expresion. 

rewrite expression in Exercise 9 by pairing ! and %in%
and select all cars exept "Merc","Mazda","Toyota"
db_1[!(db_1$Manufacturer %in% c("Merc","Mazda","Toyota")) & db_1$am==0 & db_1$mpg>18,]








