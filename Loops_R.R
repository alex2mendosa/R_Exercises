#1
Most common way to create loop is to use for keyword.
for loop syntax in R is represented in the following
form
for ( variable in vector ) {action to perform}
for ( i in 1:10) {print(i^2)}
In this loop i would sequentially take values from 
sequence from 1 to 10, apply power of 2 and print output.
Output after each iteration are not connected and
repsesent separate objects.
Same result can be achieved with
(1:10)^2, but in this case output forms 
another vector whcih stored squared values.

Now use seq() fucntion to form sequence form 
0 to 1000, with stem of 100 and estimate value of 
(1+1/i)^i which shoukld result in Eulers Number


# Silutio
for ( i in seq(from=0, to=1000, by=100) ) {
    print( (1+1/i)^i   )   }
Notice that to replicate
same calculations with can take advantage of vectors in R
n<-seq(from=0, to=1000, by=100)
(1+1/n)^n

Example illustates the importance of Vectorisation in R,
specifically that many operations in R can be performed
withour calling for structure.

However, ability to extract singlew object via loop
would allow more customised data manipulations.



# 2
For loop would allow to create sequences for
which each consequtive value is the result
of arithmetic or logical operation performed over previous values

ct_1=0
for (i in 1:10 ){
  ct_1=ct_1+i
}
print(ct_1)
Here loop is used to create sum of all values in range form 
1 to 10, againg , R woudl allow to perform the
same result with sum() fucntion.
Now use for loop and sum and prod fucntion to print cummulative sum
for range form 1 to 10, same result should be 
achieved with cumsum() and cumprod() functions


for (i in 1:5 ){
    print(sum(1:i))
}
for (i in 1:5 ){
  print(prod(1:i))
}
Here i is used as part of vecvtor generation expression
1:i


### 3

We can define more complex arithmetic progression 
as proxy for iterator in R.
vector_1<-rnorm(10,5,5)
Vector contains random numbers , wa want to extract
values from each even position,
total number of even values in sequence from 1 to 10 is 5

for (i in seq(from=2,to=10,by=2) ) {
  print( vector_1[i] )
}

Now use seq function to extract all numbers with odd position 
from sequence from 1 to 20
vector_1<-rnorm(30,5,5)

for (i in seq(from=1,to=20,by=2) ) {
  print( vector_1[i] )
}
 remember than in R indices starts with 1
 
Again, you can easily done the same with  

vector_1[ seq(from=1,to=20,by=2) ]

Full benefits of loopps are about to reveal themselves.


### 4
Common vectorised R ficntions like sum(),mean(),
cimsum(),cumprod() can adress operations which are
common in data analysi tasks and involve mathematical operations
with clear analytical definition.

Assume non trivial task,
vector_1<-letters[1:10]
now I want to replace positions of 
consequtive pairs:
  a,b,c,d should become : b,a,d,c
The task may not behave direct practical application 
in data anlysis , however
it demonstated that loop woudl allow more diverse
type of manipylations compare to base fucntions.


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
because second operation rewrirtes it.

Now , given 
vector_1<-c(0,1,1,rep(0,7))
Generate Fibonacci sequence.
YOu need to generate fourtg values 
which woulde be result of
sum of 2 previous numbert:
fouth number= third number+second number
a(t)=a(t-1)+a(t-2)
2=1+1
assigh value 2 to forth index of vector_1
Repeat this operation 7 times, loop sjould start from 
4[first missing value]

for (i in 4:10) {
  vector_1[i]<-vector_1[i-1]+vector_1[i-2]
}
print(vector_1)
































