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



#2
vec<-se
for ( i in  )




Don’t use a loop when a vectorized alternative exists
Don’t grow objects (via c, cbind, etc) during the loop - R has to create a new object and copy across the information just to add a new element or row/column
Allocate an object to hold the results and fill it in during the loop








