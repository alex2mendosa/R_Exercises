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



