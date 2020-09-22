# exercise 1
library(dplyr)
mtcars
Pipe operator %>% was initially introduced in magrittr
package. Now it is intristic part of data manipulation
in dplyr. With  pipe operator full benefits of
dplyr compare to base fucntions
are revealed resulting in readable and 
robust style of coding. 

By default, pipe allows to transfer output of single
function into another one by generation a chain 
of expressions without a need to 
invoke each fucntion as argument of another one
placed in round brakets. 

unlist(lapply(strsplit( row.names(mtcars)," "),function(x) x[1]) )

Here 4 fucntions are combined to extract name of manufacturer from 
mtcars.Calculations start from the core expression
with row.names(), result becomes input for strplit() function, 
followed by lapply() and unlist(). 

With pipe operator expression 
can be rewritten as:

mtcars %>% row.names() %>% strsplit(split=" ") %>%
           lapply(function(x) x[1]) %>% unlist()

Results are identical, but we are able to clearly read
the workflow and what actions determine output.

Now replicate previous expression add table()
function to the end to calculate how many 
models are present form each manufacturer.

mtcars %>% row.names() %>% strsplit(split=" ") %>%
  lapply(function(x) x[1]) %>% unlist() %>% table()


# exercise 2

R expression with select() and filter()
functions to select first 4 columns 
for models with mpg>12 is repsented as 

filter(select(mtcars,1:4),mpg>12)

Now rewrite the same expression with pipe operator. 
mtcars %>% select(1:4) %>% filter(mpg>12)

# exercise 3

Select all columns exept the last 2 from mtcars data frame,
filter data where mpg is greater than 12 and hp
is lower than 150 and Transmission is automatic.
Use ?mtcars to check meaning of columns if requred.
Use pipe operator to define sequence

mtcars %>% select(-c("gear","carb")) %>% 
           filter(mpg>12 & hp<150 & am==0) 


# exercise 4

With %>% select first 7 columns, filter mpg>12  and hp>150,
than with arrange() function sort rows from 
highest to lowest value of hp and slice() 3 top rows.

mtcars %>% select(1:7) %>% filter(mpg>15 & hp>150 ) %>%
  arrange( desc(hp) ) %>% slice(1:3)


# exercise 5

Convert row names to column with expession 
from Exercise 1 and store it to variable Manufacturer.
Use mutate() function with %>% to add column "Manufacturer"
to mtcars, place it as first column with 
relocate() function.

Manufacturer<-mtcars %>% row.names() %>% strsplit(split=" ") %>%
  lapply(function(x) x[1]) %>% unlist()
mtcars %>% mutate(Manufacturer=Manufacturer) %>%
  relocate(Manufacturer,.before=mpg)


# exercise 6
Manufacturer<-mtcars %>% row.names() %>% strsplit(split=" ") %>%
  lapply(function(x) x[1]) %>% unlist()
db_1<-mtcars %>% mutate(Manufacturer=Manufacturer,Model=row.names(mtcars)) %>%
  relocate(c(Manufacturer,Model),.before=mpg)

With %>% select first 7 columns, sort rows from 
highest to lowest hp, use slice() to select 
first 5 rows and use pull() function to extract column
Manufacturer.

db_1 %>% select(Manufacturer:wt) %>% arrange(desc(hp)) %>%
  slice(1:5) %>% pull(Model)

# exercise 7
Manufacturer<-mtcars %>% row.names() %>% strsplit(split=" ") %>%
              lapply(function(x) x[1]) %>% unlist()
db_1<-mtcars %>% mutate(Manufacturer=Manufacturer,Model=row.names(mtcars)) %>%
  relocate(c(Manufacturer,Model),.before=mpg)

With %>% select first 8 columns, choose models 
from Mercedez,mazda and Toyota, sort rows first by 
Manufacturer than by highest
to lowest hp, and group data by Manufacturer.

db_1 %>% select(Manufacturer:wt) %>% 
  filter(Manufacturer %in% c("Merc","Toyota","Mazda")) %>%
  arrange(Manufacturer,desc(hp)) %>% group_by(Manufacturer) 

# exercise 8

Manufacturer<-mtcars %>% row.names() %>% strsplit(split=" ") %>%
  lapply(function(x) x[1]) %>% unlist()
db_1<-mtcars %>% mutate(Manufacturer=Manufacturer,Model=row.names(mtcars)) %>%
  relocate(c(Manufacturer,Model),.before=mpg)

Folowng exercise 7, for data grouped by Manufacturer, 
use summarise() and max() function to 
estimate model with largest hp for each Manufacturer.

db_1 %>% select(Manufacturer:wt) %>% 
  filter(Manufacturer %in% c("Merc","Toyota","Mazda")) %>%
  group_by(Manufacturer) %>% summarise(Max=max(hp)) %>% arrange(desc(Max))


# exercise 9
Use mutate() to change mpg to 
l per 100km, group_by() and summarise()
to estimate mean(),sd() and mad() of mpg. 

mtcars %>% mutate("l/100km"=235.215/mpg) %>%
           summarise(mean.1=mean(mpg),sd.1=sd(mpg),mad.1=mad(mpg)   ) 


# exercise 10

Manufacturer<-mtcars %>% row.names() %>% strsplit(split=" ") %>%
  lapply(function(x) x[1]) %>% unlist()
db_1<-mtcars %>% mutate(Manufacturer=Manufacturer,Model=row.names(mtcars)) %>%
  relocate(c(Manufacturer,Model),.before=mpg)

Use mutate() to change mpg to 
l per 100km, group_by() and summarise()
and filter all model with mpg greater than 75% quantile
and top 3 cars with highest mpg

db_1 %>% mutate("l/100km"=235.215/mpg) %>%
           filter( mpg>quantile(mpg,0.75) ) %>%
           arrange(desc(mpg)) %>% slice(1:3)





