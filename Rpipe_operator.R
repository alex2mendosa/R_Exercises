# exercise 1
library(dplyr)
mtcars
Pipe operator %>% was initially introduced in magrittr
package. Now it is intristic part of dara manipulation
in dplyr.  pipe operator full benefits of
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

mtcars %>% row.names() %>% strsplit(,split=" ") %>%
           lapply(function(x) x[1]) %>% unlist()

Result are identical but  we are able to read chain of experrions 
starting from first call to row.names finishing with
unlist()


Now rewrite previous expression add table() fucntion at the and to 
calcual how many model are present form each manufacturer

mtcars %>% row.names() %>% strsplit(,split=" ") %>%
  lapply(function(x) x[1]) %>% unlist() %>% table()


# exercise 2

write R expression with select and filter
fucntion to select first 4 columns 
for cars with mpg>12

Nex rewrite the same expression with pipe operator. 

filter(select(mtcars,1:4),mpg>12)
mtcars %>% select(1:4) %>% filter(mpg>12)

# exercise 2




