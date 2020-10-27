#1
Most common way to create loop is to use "for" keyword.
for based loop syntax in R is represented in the following
form:
for ( variable in vector ) {action to perform}
for ( i in 1:10) {print(i^2)}
In this loop "i" would sequentially take values from 
sequence from 1 to 10, apply power of 2 and print output.
Outputs of iterations are not connected and
repsesent separate objects.
Same result can be achieved with
(1:10)^2, but in this case output forms 
another vector which stores squared values.

Now use seq() fucntion to form sequence form 
0 to 1000, with step of 100 translated through i variable
and estimate value of 
(1+1/i)^i which should converge to Euler's Number

# Silution
for ( i in seq(from=0, to=1000, by=100) ) {
  print( (1+1/i)^i   )   }
Notice that to replicate
same calculations we can take advantage of vectors in R
n<-seq(from=0, to=1000, by=100)
(1+1/n)^n

Example illustates the importance of Vectorisation in R,
specifically that many operations in R can be performed
withour calling "for" structure.

However, ability to extract single value via loop
would allow more customised data manipulations.




# 2
for based  loop would allow to create sequences for
which each consecutive values are result
of arithmetic or logical operations performed over lagged values

ct_1=0
for (i in 1:10 ){
  ct_1=ct_1+i
}
print(ct_1)
Here loop is used to estimate sum of all values in range from 
1 to 10, againg , R would allow to perform the
same result with sum() function.
Now use for loop and sum() function and prod() function to print cummulative sum
for range form 1 to 10, same result should be 
achieved with cumsum() and cumprod() functions

Solution
for (i in 1:5 ){
    print(sum(1:i))
}
for (i in 1:5 ){
  print(prod(1:i))
}
Here i is used as part of vector generating expression
1:i



### 3

We can define more complex arithmetic progression 
as proxy for iterator in R.
vector_1<-rnorm(10,5,5)
Vector contains random numbers , wa want to extract
values whose ondex is even,
total number of even values in sequence from 1 to 10 is 5

for (i in seq(from=2,to=10,by=2) ) {
  print( vector_1[i] )
}

Now use seq() function to extract all numbers with odd position 
from sequence from 1 to 20 given vector
vector_1<-rnorm(30,5,5)

Solution

for (i in seq(from=1,to=20,by=2) ) {
  print( vector_1[i] )
}
 remember than in R indices start with 1
 
Again, you can easily done the same with  

vector_1[ seq(from=1,to=20,by=2) ]

Full benefits of loops are about to reveal themselves.



### 4
Common vectorised R functions like sum(),mean(),
cumsum(),cumprod() can adress operations which are
common in data analysys tasks and involve mathematical operations
with clear analytical definition ususalyy performed over
forward moving calculations.

Assume non trivial task,
vector_1<-letters[1:10]
now I want to replace positions of 
consequtive pairs:
  a,b,c,d should become : b,a,d,c
The task may not have direct practical application 
in data anlysis , however
it demonstates that loop would allow more diverse
type of manipulations compare to base functions

Solutions
for ( i in seq(from=2,to=length(vector_1),by=2 ) ) {
  print(i)
}   # here we define second index of each pair

for ( i in seq(from=2,to=length(vector_1),by=2 ) ) {
      buf=vector_1[i-1]
      vector_1[i-1]=vector_1[i]
      vector_1[i]=buf
} 
print(vector_1)

Notice we introduce buf variable to keep replaced value stored,
because second operation rewrites it.

Now , given 
vector_1<-c(0,1,1,rep(0,7)) Generate Fibonacci sequence.
As the first step, you need to generate fourth value
which woulde be result of
sum of 2 previous number:
fourth number= third number+second number or
a(i)=a(i-1)+a(i-2) or
2=1+1, next
assigh value 2 to fourth index of vector_1.
Repeat this operation 7 times, loop should start from 
4[index of first missing value]

for (i in 4:10) {
  vector_1[i]<-vector_1[i-1]+vector_1[i-2]
}
print(vector_1)



#5

In previus examples variable "i" sequentially takes values from
specified range of numbers.It is possible to specify character vector 
as sequence to loop through.
for (i in letters) {
  print(i)
}
Here "i" would accept element by element values from in-build vector letters.
Notice, we can also  use "i" as index to subset vector letters

for (i in 1:26) {
  print(letters[i])
}

Now use month.abb and month.name vector and for loop
to print element by element values from both vectors in single row,use template:
paste(month.abb,month.name,sep=" ") and i as index

for (i in 1:12) {
  print( paste(month.abb[i],month.name[i],sep=":") )
}

If i is used as index , in other words, it iterates over arithmetic progression, 
it can be applied to subset data in multiple vectors or more complex structures.



#6
Assume sample data frame:
 n<-sample(10:15,1)
employee_db<-data.frame(Emp_Id=paste( sample(1:n,n) , sample(letters,n),sep="-" ),
                         Salary=sample(500:700,n)  )

Now we would like to loop through each record in sample data frame employee_db.
Assume we dont know total number of records in advance, but we are aware that
"for" based loop , if i is used as index, requres specification 
of first and last index. In this case , we can use 
sevaral functions to initiate loop:
  nrow(),length()

for (i in 1:nrow(employee_db) ){
  print(employee_db[i,])
}
for (i in 1:length(employee_db$Emp_Id) ){
  print(employee_db[i,])
}

Here nrow() or length() hepled us to define 
indices which is compulsory as we dont know in advance 
last index.

Now , for employee_db, loop through 
each record and print the following sentance
{Emp_Id} has salary of {Salary},use combination of
paste() and print() functions

for (i in 1:nrow(employee_db) ){
  print( paste(employee_db[i,1],"has salary of",employee_db[i,2],sep=" ")  )
}


#7
Assume vector whose length is random:
vector_1<-seq(from=1,to=sample(50:100,1),by=3)
Now use length() function and seq() to define loop and
loop through each third element of vector_1

for (i in seq(from=3,to=length(vector_1),by=3 )  ){
print(vector_1[i])
}

#8

Use for loop to conver number from base 10 to 
base 2, number to convert is 456
The process is the following.
first we divide 453 by desired base, in our case it is 2.If remainder is 0,
last digit of binary vertion should be 0, otherwise 1.
Then we keep dividing integer part of 453/2 by 2 [226] again and check the remainder.
The process remains until integer part is 0.

Total number of iterations requred is 9,
digits of base 2 vertions should be stored in vector base_2
n<-453, use %% to check remainder and %/% for integer part of divition
base_2<-vector(mode="numeric",length=9)
indices in loop should go from last to the first index of base_2 [9:1]

for (i in 9:1) {
    base_2[i]<-n %% 2
    n<-n %/% 2
}


#9
Now use for loop where each value is number of times it should be printed
,for example,1,2,2,3,3,3,4,4,4,4
Implement the process up to digit 10,use rep() function
to accomplish task

for (i in 1:10) {
print(rep(i,i))
}


#10

Random walk is defined via formula
y(i)=y(i-1)+e(i) where i represents time index
Generate 30 values of random walk, use rnorm(1,0,1) to generate
e(i): random value(white noice)
y(1) is e(i)
Valies must be stored in 
random_walk_1<-vector(mode="numeric",length=30)
random_walk_1[1]<-rnorm(1,0,1)
for (i in 2:30){
random_walk_1[i]<-random_walk_1[i-1]+rnorm(1,0,1)
}
print(random_walk_1)
plot(random_walk_1,type="l",col="red")












