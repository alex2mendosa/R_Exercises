# exercise 1
library(dplyr)
mtcars
Pipe operator %>% was initially introduced in magrittr
package. Now it is intristic part of dara manipulation
in dplyr. With  pipe operator full benefits of
dplyr to manifest itself resulting in readable and 
robust style of coding. 


By de3fault pipe allows to transfer output of 1
fucntion into another one by generation a chain 
of expression without a need to 
invoke each fucntion as argument of another one
placed in roweud brakets. 

unlist(lapply(strsplit( row.names(mtcars)," "),function(x) x[1]) )

Here 4 fucntion are combined to extract anme of manufacturer from 
mtcars.Calculations starts from the core expression
with row.names, result becomes inputo fo strplit fucntion 
followed by lapply and unlist fcuntions. 

With pipe expression can be rewritten as

mtcars %>% row.names() %>% strsplit(split=" ") %>%
           lapply(function(x) x[1]) %>% unlist()

Result are identical but  we are able to read chain of experrions 
starting from first call to row.names finishing with
unlist()


Now rewrite previous expression add table() fucntion at the and to 
calcual how many model are present form each manufacturer

mtcars %>% row.names() %>% strsplit(split=" ") %>%
  lapply(function(x) x[1]) %>% unlist() %>% table()


# exercise 2

 R expression with select and filter
fucntion to select first 4 columns 
for cars with mpg>12 is repsented as 

filter(select(mtcars,1:4),mpg>12)

Nex rewrite the same expression with pipe operator. 
mtcars %>% select(1:4) %>% filter(mpg>12)

# exercise 3

Select first 5 column from mtcars data frame,
filter data where mpg is greater than 12 and disp
is lower than 150 and extract row names.
Use pipe operator to define sequence

mtcars %>% select(1:5) %>% filter(mpg>12 & hp<150) ) 



# exercise 4

With %>% select first 7 columns , filter mpg>12  and hp>150
than with arrange fucntion sort rows from 
highest to lowest value of hp

mtcars %>% select(1:7) %>% filter(mpg>15 & hp>150 ) %>%
           arrange( desc(hp) )



# exercise 5

Convert row anmes to column with expession 
from Exercise 1 and store it to variable Manufacturer.
Use mutate fucntion with %>% to add column "Manufacturer"
to mtcars, place it as first column with 
relocate() fucntion
Manufacturer<-mtcars %>% row.names() %>% strsplit(split=" ") %>%
  lapply(function(x) x[1]) %>% unlist()
mtcars %>% mutate(Manufacturer=Manufacturer) %>%
           relocate(Manufacturer,.before=mpg)


# exercise 6
Manufacturer<-mtcars %>% row.names() %>% strsplit(split=" ") %>%
  lapply(function(x) x[1]) %>% unlist()
db_1<-mtcars %>% mutate(Manufacturer=Manufacturer,Model=row.names(mtcars)) %>%
  relocate(c(Manufacturer,Model),.before=mpg)

with %>% select first 7 columns, sort rows from 
highest to lowest hp , use slice to select 
first 5 rows and use pull fucntion to extract column
Manufacturer

db_1 %>% select(Manufacturer:wt) %>% arrange(desc(hp)) %>%
         slice(1:5) %>% pull(Model)



# exercise 7
Manufacturer<-mtcars %>% row.names() %>% strsplit(split=" ") %>%
  lapply(function(x) x[1]) %>% unlist()
db_1<-mtcars %>% mutate(Manufacturer=Manufacturer,Model=row.names(mtcars)) %>%
  relocate(c(Manufacturer,Model),.before=mpg)

with %>% select first 8 columns, choose only models 
from Mercedez,mazda and Toyota, sort rows from 
highest to lowest hp , and gtoup data my Manufacturer

db_1 %>% select(Manufacturer:wt) %>% 
  filter(Manufacturer %in% c("Merc","Toyota","Mazda")) %>%
  arrange(Model,desc(hp)) %>% group_by(Manufacturer) 


# exercise 8

Manufacturer<-mtcars %>% row.names() %>% strsplit(split=" ") %>%
  lapply(function(x) x[1]) %>% unlist()
db_1<-mtcars %>% mutate(Manufacturer=Manufacturer,Model=row.names(mtcars)) %>%
  relocate(c(Manufacturer,Model),.before=mpg)


Folowng exercise 7, for data gotuped by model, 
use summarise() and max() function to 
estiimae model with largest hp for each Manufacturer

db_1 %>% select(Manufacturer:wt) %>% 
  filter(Manufacturer %in% c("Merc","Toyota","Mazda")) %>%
  group_by(Manufacturer) %>% summarise(Max=max(hp)) %>% arrange(desc(Max))


# exercise 9
You want to find 
fasters car with more tha 20mpg  and more than 150 
horsepowers, automatic transmission

mtcars %>% select(1:7) %>% filter(mpg>20 & hp>110 ) %>%
  arrange( desc(hp) )














