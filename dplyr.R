# Exercise 1
library(dplyr)

dplyr package should be installed, while mtcars
dataset comes with base R version.

select() function from dplyr allows to 
specify columns you want to extract
from raw dataset by either column order or  name.
Columns numbers or names should  be separated by comma.
select(mtcars,1,3)   or
select(mtcars,mpg,disp)
No need to wrap column names in quotation marks
or use $ accessor.

Now select 1-st,3-rd, last columns from
mtcars. Remember, ncol(mtcars) provides
total number of columns in data frame. 

select(mtcars,1,3,ncol(mtcars) ) or
select(mtcars,mpg,disp,ncol(mtcars) )
Output of select() fcuntion is also a data frame.



# Exercise 2

Columns names in select() can be adjusted with “-“ sign to 
indicate what column not to extract.

select(mtcars,-1,-3,-ncol(mtcars) ) 
select(mtcars,-mpg,-disp)

Extract all columns except the second and third,
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
select(mtcars,drat:cyl) to reverse columns order
select(mtcars,cyl:hp,5) here we want to extract 
column specified by  “:” and then column 5.

Now use “:” to extract all columns in reverse order

select(mtcars,ncol(mtcars):1)



# Exercise 4
Assume, we want to relocate first 5 columns to the end of data frame,
while keeping the order of other columns intact.
With select() you need to specify what block to move via 
“:”, as well as order of all remaining columns.

relocate() function allows to specify only columns 
of data frame you want to relocate. 

In relocate() we first specify name of data frame, next what block to 
move,  next we indicate the exact 
location where chosen block should be inserted.

names(mtcars)
relocate() requires 1 out of 2 arguments to specify insert location:
  .before and .after.

relocate(mtcars,cyl,.before=mpg)
Now second column,cyl, is inserted before column mpg.
Or , with block of columns:
relocate(mtcars,mpg:disp,.after=hp)

Now move block which includes 2-nd till 6-th column
to the end of mtcars.

relocate(mtcars,2:6,.after=carb)



# Exercise 5

With dplyr we can subset  rows which fit certain conditions.
Filtering in R is generally done by , first creating 
logical vector with same number of rows as target data frame and
then , using it to extract rows for which values of 
logical vector are TRUE.

filter() function allows to specify both data frame
and logical vector used for filtering.

filter(mtcars,mpg>20) extract rows for which mpg>20
Function syntax is similar to subset function.

filter(mtcars,mpg>20 & cyl==6)
Here we specify 2 conditions.

Same result can be achieved with more traditional approach
mtcars[mtcars$mpg>20 & mtcars$cyl==6,], however 
filter() should be preferred as more flexible solution.

Now select records
where mpg>15, disp>4, hp>=100
and manufacturer name is no Mazda,
Hint:grepl("Mazda",row.names(mtcars) ), ! is used to negate logical vector.

filter(mtcars, mpg>15& disp>4 & hp>=100 & !grepl("Mazda",row.names(mtcars) ) )




# Exercise 6

Arguments of filter()  can also be 
separated via comma, acting as AND operator,
however, we should be caution not to
include mutually exclusive condition for single column.

filter(mtcars, mpg>15 | mpg <10)  which 
allows to use OR operator.
filter(mtcars, mpg>15 , mpg <10)  does not produce result 
as the single value can not be both greater or smaller than 15.

Now use comma  to choose rows where mpg>15 and disp>120
filter(mtcars, mpg>15 , disp>120)  or
filter(mtcars, mpg>15 & disp>120)




# Exercise 7

Common way to extract rows from data frame
is to use [] with indices.

mtcars[c(1,2,3),]

dplyr offers slice() functions to extract rows via positional indexing. 
slice(mtcars,c(1,2,5))
function is quite stringboard, rows 1,2,5 are
extracted.

Now extract all rows from 3-rd till the last.
Use nrow() function if possible.

slice(mtcars,1:nrow(mtcars))
Output of slice() is also data frame.



# Exercise 8

Columns from data frame can be extracted either through 
accessor $, or indexing[], mtcars[,2] or mtcars$cyl.
Same can be done with dplyr pull() function.

pull(mtcars,2) or pull(mtcars,cyl). 
pull() functions is useful when data manipulation routine includes
consecutive subsetting and filtering,
output of which is single column. 
Additionally, it can be naturally included in 
expressions sequence connected via %>% operator. 

now use pull() function to extract 
third column both via column name and column number.
pull(mtcars,3)
pull(mtcars,disp)





# Exercise 9

Common way to sort data in vector is to use order() function
which creates vector of indices used to reorder rows,
order(mtcars$mpg) results in vector of indices which 
should be applied to mtcars rows.

mtcars[order(mtcars$mpg),] sorts data from lowest mpg to largest.

In dplyr sorting is done via arrange() function, 
which allows to specify columns used for sorting.

arrange(mtcars, mpg)

Now arrange data in mpg both in ascending and descending order.
descending order is produced when desc() functions is applied to 
column name inside arrange() function. 

arrange(mtcars, disp)
arrange(mtcars, desc(disp))





# Exercise 10

Another function from dplyr() which can be particularly useful when 
data is uploaded from external source with column 
names different from names you want to see in final result.

rename() allows to specify both  replacement name 
and column you want to rename.

rename(mtcars,"N. of Carburetors"=carb)

We indicate new name in double quotations 
and column that should be renamed. No assignment
takes place, so names in original data frame are intact.
Use comma to indicate multiple arguments.

Now change name of mpg to "Miles per Gallon"
and wt to "Weight (1000 lbs)"

rename(mtcars,"Miles per Gallon"=mpg,"Weight (1000 lbs)"=wt)









