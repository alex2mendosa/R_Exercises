#1
Most common way to create loop is to use "for" keyword.
"for" based loop syntax in R is can be generalised as:
  for ( variable in vector ) {action to perform}, for example
for ( i in 1:10) {print(i^2)}

In this loop "i" variable would sequentially take values from 
sequence from 1 to 10 [dont forget round brackets], 
apply power of 2 and print output 
[output is indicated in curly brackets].
Outputs of iterations are not connected and
repsesent separate objects.
Same result can be achieved with
(1:10)^2, but in this case output forms 
another vector which reference squared values.

Now use seq() function to form sequence form 
0 to 1000, with step of 100, translated through j variable
and estimate and print values of 
(1+1/j)^j which should converge to Eulers Number

# Solution

for ( i in seq(from=0, to=1000, by=100) ) {
  print( (1+1/i)^i   )   }
Notice that to replicate
same calculations we can take advantage of vectors in R
n<-seq(from=0, to=1000, by=100)
(1+1/n)^n

Example illustates the importance of Vectorisation in R,
specifically that many operations in R can be performed
without calling "for" structure.

However, ability to extract single value via loop
would allow more customised data manipulations.



# 2
"for" based loop would allow to create sequences in
which each consecutive values are result
of arithmetic or logical operations performed over lagged values.

ct_1=0
for (i in 1:10 ){
  ct_1=ct_1+i
}
print(ct_1)

Here loop is used to estimate sum of all values in range from 
1 to 10, R would allow to achieve the
same result with sum() function.
Now use for loop and sum() function and prod() function to print cummulative sum
for range form 1 to 10, same result should be 
achieved with cumsum() and cumprod() functions.

Solution
for (i in 1:5 ){
  print(sum(1:i))
}
for (i in 1:5 ){
  print(prod(1:i))
}
Here "i" is used as part of vector generating expression
1:i, as i increases so does number of elements in 
arguments of sum and prod functions.




### 3
In "for" loop "i" 
[any name can be used as soon as it satisfies
 R rules for variables names] iterator can accept decreasing sequence
and use it as index or part of calculations
vector_1<-sample(1:20,10)
for (i in 10:1) {
  print(vector_1[i])  }
Therefore, we print values starting from the last 
in vector_1.

Now apply the same approach to estimate square root via
sqrt() function to sequence from 10 to -1.
You should get Nan during last iteration.

for (i in 10:-1) {
  print(sqrt(i))  }




### 4

We can define more complex arithmetic progression 
as proxy for iterator in R.
vector_1<-rnorm(10,5,5)
Vector contains random numbers , wa want to extract
values whose index is even,
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

Remember than in R indices start with 1
Again, you can do the same with  
vector_1[ seq(from=1,to=20,by=2) ]
Full benefits of loops are about to reveal themselves.



### 5
Common vectorised R functions like sum(),mean(),
cumsum(),cumprod() can adress operations which are
common in data analysis tasks and involve mathematical operations
with clear analytical definition, usually performed over
forward moving calculations.

Assume non trivial task,
vector_1<-letters[1:10]
Now we want to replace positions of 
consequtive pairs:
  a,b,c,d should become : b,a,d,c
The task may not have direct practical application 
in data analysis, however
it demonstates that loop would allow more diverse
type of manipulations compare to base functions

Solution
for ( i in seq(from=2,to=length(vector_1),by=2 ) ) {
  print(i)
}   # here we define second index of each pair

for ( i in seq(from=2,to=length(vector_1),by=2 ) ) {
  buf=vector_1[i-1]
  vector_1[i-1]=vector_1[i]
  vector_1[i]=buf
} 
print(vector_1)

Notice, we introduce buf variable to keep replaced value stored,
because second operation rewrites it.

 
 
 ### 6
Now , given 
vector_1<-c(0,1,1,rep(0,7)) Generate Fibonacci sequence.
As the first step, you need to generate fourth value
which would be result of
sum of 2 previous number:
  fourth number= third number+second number or
a(i)=a(i-1)+a(i-2) or
2=1+1, next
assigh value 2 to fourth index of vector_1.
Repeat this operation 7 times, loop should start from 
4 which is index of first missing value in vector_1

 
 Solution
for (i in 4:10) {
  vector_1[i]<-vector_1[i-1]+vector_1[i-2]
}
print(vector_1)



#7

In previus examples variable "i" sequentially takes values from
specified range of numbers.It is possible to specify character vector 
as sequence to loop through.
for (i in letters) {
  print(i)
}
Here "i" would accept element by element values from in-build vector letters.
Notice, we can also use "i" as index to subset vector

for (i in 1:26) {
  print(letters[i])
}

Now use month.abb and month.name vector and for loop
to print element by element values from both vectors in single row,use template:
  paste(month.abb,month.name,sep=" ") and i as index

for (i in 1:12) {
  print( paste(month.abb[i],month.name[i],sep=":") )
}

If "i" is used as index, in other words, it iterates 
over arithmetic progression, 
it can be applied to subset data in multiple 
vectors or more complex structures.



#8
Assume sample data frame:
n<-sample(10:15,1)
employee_db<-data.frame(Emp_Id=paste( sample(1:n,n) , sample(letters,n),sep="-" ),
                        Salary=sample(500:700,n)  )

Now we would like to loop through each record in sample data frame employee_db.
Assume we dont know total number of records in advance, but we are aware that
"for" based loop , if "i" is used as index, requres specification 
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
indices, therefore we able to define indices and
total number od iterations.

Now , for employee_db data set, loop through 
each record and print the following sentance
"{Emp_Id} has salary of {Salary}",use combination of
paste() and print() functions

for (i in 1:nrow(employee_db) ){
  print( paste(employee_db[i,1],"has salary of",employee_db[i,2],sep=" ")  )
}


#9
Assume vector whose length is random:
  vector_1<-seq(from=1,to=sample(50:100,1),by=3)
Now use length() function and seq() to define loop and
loop through each third element of vector_1

for (i in seq(from=3,to=length(vector_1),by=3 )  ){
  print(vector_1[i])
}

#10

Use for loop to convert number from base 10 to 
base 2, number to convert is 456.
The process is the following:
first we divide 453 by desired base, in our case it is 2.If remainder is 0,
last digit[counting from left] of binary version should be 0, otherwise 1.
Then we keep dividing integer part of 453 %/% 2 by 2 [226] 
again,check the remainder and add[concatenate] either 1 or 0 to
value of previous remainder

The process remains until integer part is 0.

Total number of iterations required is 9,
digits of base 2 version should be stored in vector base_2
n<-453, use %% to check remainder and %/% for integer part of division
base_2<-vector(mode="numeric",length=9)
Indices in loop should go from last to the first index of base_2 [9:1]

 
 Solution
for (i in 9:1) {
  base_2[i]<-n %% 2
  n<-n %/% 2
}


#11
Now use for loop where each value determines how many times it should be printed
,for example,1,2,2,3,3,3,4,4,4,4
Implement the process up to digit 10,use rep() function
to accomplish task
 
for (i in 1:10) {
  print(rep(i,i))
}


#12

Random walk is defined via formula
y(i)=y(i-1)+e(i) where i represents time index.
Generate 30 values of random walk, use rnorm(1,0,1) to generate
e(i): random value(white noice)
y[1] should be equal to e(i)
Values must be stored in 
random_walk_1<-vector(mode="numeric",length=30)

Solution

random_walk_1[1]<-rnorm(1,0,1)
for (i in 2:30){
  random_walk_1[i]<-random_walk_1[i-1]+rnorm(1,0,1)
}
print(random_walk_1)
plot(random_walk_1,type="l",col="red")



#13
n<-2
use for loop to calculate sum of the following sequence after
20 iterations
n - n^3 + n^5 + n^7 ....
powers should be repsesented by "i" iterator and summaiton referenced in sum_1 variable
use seq() function to define sequence with 2 as increment.

Solution
sum_1<-0
for (i in seq(from=1,by=2,along.with = 1:10) ){
  sum_1<-sum_1+n^i
}


#14
Write a program in R to display prime numbers
in range 2 till 10
Prime  number is only divisible by 1 and itself.
As possible solution use the following combination:
  
all( c(2:10) %% 2==0) which  results in TRUE
only of logical vector c(2:10) %% 2==0 has 
all elements equal to TRUE. 

for (i in 2:10) {
     if (   all(i %% 2:(i-1)!=0)    )  {
             print(i)
     }
}


#15

Write a program in R to find the sum of the series:
2 +22 + 222 + 3333 + .. n terms.
n<-10
sm=0
Multiple solutions are possible including 
solutions which involves types manupulation [from sting to number]
using as.numeric() function and paste( ,collapse="" )
for (i in 1:n) {
  string_val=as.numeric( paste(rep(2,i),collapse = ""))
  print(string_val)
  sm=sm+string_val
}
print(sm)














