# Exercise 1
library(dplyr)

dplyr shoud be installed, while mtcars
dataset comes with base R vertion.

select fucntion from dplyr allows to 
specify columns by either order or 
column names which you want to extract
from raw dataset.
Column numner or name shoukld 
be separated by comma.
select(mtcars,1,3 or)
select(mtcars,mpg,disp)
No need to wrap column names in quotation marks
or use $ accessor.

Now select 1-st,3-rd,last columns from
mtcars.Remenmer , ncol(mtcars) provides
number of columns in data frame. 

select(mtcars,1,3,ncol(mtcars) ) or
select(mtcars,mpg,disp,ncol(mtcars) ) 



# Exercise 2

column names in select can be supplemented with - to 
indicate what column not ot extract

select(mtcars,-1,-3,-ncol(mtcars) ) 
select(mtcars,-mpg,-disp)

extract all column except the second and third,
use column names as arguments.

names(mtcars)
select(mtcars,-cyl,-disp)



# Exercise 3

Rather than indicating each column by name
ot order, it is possible to define a range of column to 
extract via ":" operator.

select(mtcars,2:5) or 

names(mtcars)
select(mtcars,cyl:drat)
select(mtcars,drat:cyl) to reverse
select(mtcars,cyl:hp,5) here we want to extract 
column specified by : and then column 5.

extract all columns in reverse order

select(mtcars,ncol(mtcars):1)


# Exercise 4
Assume we want to relocate first 5 columsn to the end.
while keppeng order of other columns  intact.
With select you need to specify what bloch to move via 
:, and order oall remaining columns.

relocate fucntion allows to specify only whqat block to move. 

in relocate() we first specify name of data frame, next what column or block to 
move,  next we indicate the exact 
location where chosen  column should be inserted.

If you worked  in excel, the proces is similat to adding columns
in the middle of table: we first select before and after what columns
to add new data and after that insert new columns.

names(mtcars)
relocat operates with 2 argument to read exactinsert location:
  .before, .after.

relocate(mtcars,cyl,.before=mpg)
Noe second column is placeed before column mpg

relocate(mtcars,mpg:disp,.after=hp)

Now move block from second to 6-th column
to the end of mtcars

relocate(mtcars,cyl:wt,.after=carb)


# Exercise 5

With dplyr we can subset data
rows which fit certain conditions.
Filtering in R generaly is done by forst creating 
logical vector with TRUE and FALSe values and
then using it to extract rows of data frame equal to
logical vector indices for which values is TRUE

filter function allows to specify data frame
and logicar vector to select rows where the 
values of vector is TRUE.

filter(mtcars,mpg>20) extract rows for which mpg>20
Fucntion syntax is similar to subset function.

filter(mtcars,mpg>20 & cyl==6)

We specified 2 conditions.
Same result can be achieved with
mtcars[mtcars$mpg>20 & mtcars$cyl==6,], however 
filter should be preferred as more flexible and faster solution.

Now select records
where mpg>15, disp>4,hp>=100
and name manufacturer is no Mazda,
Hint:grepl("Mazda",row.names(mtcars) ), ! is used to negate logical vector

filter(mtcars, mpg>15& disp>4 & hp>=100 & !grepl("Mazda",row.names(mtcars) ) )



# Exercise 6

Argument of filter fucntion can also be 
separated via semicolon, actians as AND operator,
we should  be caution not to
include mutually exclusive condition for single colomn.

filter(mtcars, mpg>15 | mpg <10)  which 
allowsto use OR operator
filter(mtcars, mpg>15 , mpg <10)  does not produce result 
as the single value canbe both greater or smaller that 15.

Now use semicilon to choose rows where mpg>15 and disp>120
filter(mtcars, mpg>15 , disp>120)  or
filter(mtcars, mpg>15 & disp>120) 



# Exercise 7

Common way to extract rows from data frame
is to use [] with indices

mtcars[c(1,2,3),]

dplyr offers slice() fucntion to index rows by their
location. 
slice(mtcars,c(1,2,5))
fucntion is quite straigforward.

Now extract all rows from 3ord till the last.
Use nrow fucntion.

slice(mtcars,1:nrow(mtcars))
Outpur of slice is data frame.





# Exercise 8

Column from data frame cab be extracted eiter through 
accessor $, or indexing[], mtcars[,2] or mtcars$cyl.
Same can be done with dplyr pull() fucntion.
pull(mtcars,2) or pull(mtcars,cyl). pull operator is
usefull when data manipulation routine includes
consequtive subsetting and filtering,
output of which is single column. 
Patrivularry , it can be organically included in 
expression sequence connected via %>% operator, disculles
in part 2. 

now use pull() function to extract 
third column via column name and column number.
pull(mtcars,3)
pull(mtcars,disp)




# Exercise 9

Common way to sort data in vector is to use order fucntion
whcih creates vector of indices used to reorder rows,
order(mtcars$mpg) result in vector of indices which 
should be applied to mtcars rows.


mtcars[order(mtcars$mpg),] Sorts data from lowest mpg to largest

In dplyr sorting is done via arrange() function, 
ahich allows to specify columns [variables] to use for sorting.

arrange(mtcars, mpg)

Now arrange data in mpg both in acsending and descending order.
descending order is produces when desc fucntion is applied to 
column name of arrnge fucntion. 

arrange(mtcars, disp)
arrange(mtcars, desc(disp))




# Exercise 10

Another useful fucntion from dplyr() can be particularly usefull when 
data is uploaded from extrnal soure with column 
names different from names you ant to gein in output  data frame.


rename() alows to specify bot  replacement name and colum you want to rename and.

rename(mtcars,"N. of Carburetors"=carb)

We indicated new name in douvble brackets followed by
equl sine and column which should be renamed. No assigmemt
takes place so names in original data fra,e are intact.
Use semicolon to indicate more than column.

Now cnahge name of mpg to "Miles per Gallon"
and wt to "Weight (1000 lbs)"


rename(mtcars,"Miles per Gallon"=mpg,"Weight (1000 lbs)"=wt)









