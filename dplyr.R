# Exercise 1
library(dplyr)

dplyr shoud be installed, while mtcars
dataset comes with base R vertion.

select() function from dplyr allows to 
specify columns you want to extract
from raw dataset by either column order or 
name 
Columns numbers or names should 
be separated by comma.
select(mtcars,1,3)   or
select(mtcars,mpg,disp)
No need to wrap column names in quotation marks
or use $ accessor.

Now select 1-st,3-rd,last columns from
mtcars.Remenmer , ncol(mtcars) provides
number of columns in data frame. 

select(mtcars,1,3,ncol(mtcars) ) or
select(mtcars,mpg,disp,ncol(mtcars) ) 



# Exercise 2

column names in select() can be supplemented with - to 
indicate what column not to extract

select(mtcars,-1,-3,-ncol(mtcars) ) 
select(mtcars,-mpg,-disp)

extract all column except the second and third,
use column names as arguments.

names(mtcars)
select(mtcars,-cyl,-disp)



# Exercise 3

Rather than indicating each column by name
or number, it is possible to define a range of columns[blocks] 
via ":" operator.

select(mtcars,2:5) or 

names(mtcars)
select(mtcars,cyl:drat)
select(mtcars,drat:cyl) to reverse colums order
select(mtcars,cyl:hp,5) here we want to extract 
column specified by : and then column 5.

Now use : to extract all columns in reverse order
select(mtcars,ncol(mtcars):1)


# Exercise 4
We want to relocate first 5 column to the end of data frame.
while keeping the order of other columns  intact.
With select() you need to specify what block to move via 
:, as well as order all remaining columns.

relocate() function allows to specify only part 
of data frame you want to relocate. 

In relocate() we first specify name of data frame, next what block to 
move,  next we indicate the exact 
location where chosen  block should be inserted.


names(mtcars)
relocate() operates with 2 argument to specify insert location:
  .before, .after.

relocate(mtcars,cyl,.before=mpg)
Now second column is placeed before column mpg

relocate(mtcars,mpg:disp,.after=hp)

Now move block from second to 6-th column
to the end of mtcars

Now relocate block from cyl towt after column carb.
relocate(mtcars,cyl:wt,.after=carb)


# Exercise 5

With dplyr we can subset 
rows which fit certain conditions.
Filtering in R is generaly done by first creating 
logical vector with same number of rows as data frame and
then using it to extract rows for which values of 
logical vector are TRUE.

filter() function allows to specify both data frame
and logical vector used for filtering.

filter(mtcars,mpg>20) extract rows for which mpg>20
Function syntax is similar to subset function.

filter(mtcars,mpg>20 & cyl==6)

We specified 2 conditions.
Same result can be achieved with
mtcars[mtcars$mpg>20 & mtcars$cyl==6,], however 
filter() should be preferred as more flexible solution.

Now select records
where mpg>15, disp>4,hp>=100
and  manufacturer name is no Mazda,
Hint:grepl("Mazda",row.names(mtcars) ), ! is used to negate logical vector.

filter(mtcars, mpg>15& disp>4 & hp>=100 & !grepl("Mazda",row.names(mtcars) ) )



# Exercise 6

Arguments of filter() functions can also be 
separated via semicolon, acting as AND operator,
we should  be caution not to
include mutually exclusive condition for single column.

filter(mtcars, mpg>15 | mpg <10)  which 
allows to use OR operator.
filter(mtcars, mpg>15 , mpg <10)  does not produce result 
as the single value can not be both greater or smaller that 15.

Now use semicilon to choose rows where mpg>15 and disp>120
filter(mtcars, mpg>15 , disp>120)  or
filter(mtcars, mpg>15 & disp>120) 



# Exercise 7

Common way to extract rows from data frame
is to use [] with indices.

mtcars[c(1,2,3),]

dplyr offers slice() functions to extract rows by their
location. 
slice(mtcars,c(1,2,5))
function is quite straigforward.

Now extract all rows from 3-rd till the last.
Use nrow fucntion is possible.

slice(mtcars,1:nrow(mtcars))
Outpur of slice() is also data frame.


# Exercise 8

Columns from data frame can be extracted either through 
accessor $, or indexing[], mtcars[,2] or mtcars$cyl.
Same can be done with dplyr pull() function.
pull(mtcars,2) or pull(mtcars,cyl). pull() functions is
usefull when data manipulation routine includes
consequtive subsetting and filtering,
output of which is single column. 
Additionally , it can be naturally included in 
expressions sequence connected via %>% operator. 

now use pull() function to extract 
third column via column name and column number.
pull(mtcars,3)
pull(mtcars,disp)




# Exercise 9

Common way to sort data in vector is to use order() function
which creates vector of indices used to reorder rows,
order(mtcars$mpg) result in vector of indices which 
should be applied to mtcars rows.

mtcars[order(mtcars$mpg),] sorts data from lowest mpg to largest.

In dplyr sorting is done via arrange() function, 
which allows to specify columns used for sorting.

arrange(mtcars, mpg)

Now arrange data in mpg both in acsending and descending order.
descending order is produced when desc() fucntions is applied to 
column name of inside arrange() function. 

arrange(mtcars, disp)
arrange(mtcars, desc(disp))




# Exercise 10

Another function from dplyr() which can be particularly usefull when 
data is uploaded from external soure with column 
names different from names you want to see in final result.

rename() alows to specify both  replacement name and colum you want to rename.

rename(mtcars,"N. of Carburetors"=carb)

We indicate new name in double quotations 
and column that should be renamed. No assigmemt
takes place, so names in original data frame are intact.
Use semicolon to indicate multiple arguments.

Now cnahge name of mpg to "Miles per Gallon"
and wt to "Weight (1000 lbs)"

rename(mtcars,"Miles per Gallon"=mpg,"Weight (1000 lbs)"=wt)









