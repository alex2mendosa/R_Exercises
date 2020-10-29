
# http://web.csulb.edu/~amonge/classes/cecs174/BigJava-EarlyObjects/chap06-loops.html#:~:text=Loop%20statements%20usually%20have%20four,step%2C%20and%20a%20loop%20body.
# 1
Combination of for loop and if statements
are intristic parts of programming languages which allows to 
define output based on multiple states of input variables.

Ability of programmer to adjust for+if to problem under consideration
clearly indicates more than average coding skills, and to find a solution
to challenge withour calling for in buids 
functions to sort, search,manupulate data structures. 

General template with single condition looks like 
for ( loop_control_variable in iterator) {
   if (Conditional_test) {Action if Condition is TRUE}
}

Assume vector 
vector_1<-sample(1:20,10)
I want to print "Even" text if value in vector is even.

for (i in vector_1){
  if (i %% 2==0) {print(paste(i,"is Even")) }
}  or
for (i in 1:length(vector_1)  ){
  if (i %% 2==0) {print(paste(i,"is Even")) }
} 

Now use the sampe approach to print
"Odd" for numners in vector_1 which are odd


for (i in vector_1){
  if (i %% 3==0) {print(paste(i,"is Odd")) }
}  or
for (i in 1:length(vector_1)  ){
  if (i %% 3==0) {print(paste(i,"is Odd")) }
} 


#2
To learn best practice in coding, it is usefull
to know how to incorporate full if+else
statement in for loop , to aacount for 
conditions not expected by Conditional_test

Assume variable j takes sequentially 
values from vector_1, vector contains
sequence of 1 and 0.
We want to print TRUE iv value equals 1
and 0 otherwise.

First the condition:
if (i==1) {
  print(TRUE)
} else {print(FALSE)}
vector_1<-sample(0:1,10,replace=TRUE)
We want loop_control_variable to take sequentially
values from vector_1, therefor, above condition should be wrapped with
for statement

for (i in vector_1) {
if (i==1) {
  print(TRUE)
} else {print(FALSE)} }

Now assume vector:
vector_1<-sample(1:20,10)
Now print message "Even" and element loop variabe in 
each iteration of loop, otherwise , print "Odd"


for (i in vector_1) {
  if (i %% 2) {
    print(print(paste(i,"is Even")))
  } else {print(paste(i,"is Odd"))} }



# 3
Assume vector with sample data
vector_1<-sample(1:30,20)
I want to print element on vector_1
if number is between 5 and 15
and divisible by 3 and count them

ct=0
for (i in 1:length(vector_1) ) {
  if (vector_1[i] %% 3==0 & vector_1[i]<=14 & vector_1[i]>=5  ) {
    ct=ct+1
    print( paste( vector_1[i],"Fits our Conditions" ) ) }
}
print( paste("Total number of elements:",ct)  )

Here besides print we incorporated variable to
count our values of interest.
Each action is written is separated row.

Now use the same approach to 
count total numebr of element divisible by 4,
between range 30 and 50  or range 70 and 90

vector_1<-sample(1:100,50)
ct=0
for (i in 1:length(vector_1) ) {
  if (vector_1[i] %% 4==0 & (vector_1[i]<=50 & vector_1[i]>=30  |  
                             vector_1[i]<=50 & vector_1[i]>=30)   ) {
    ct=ct+1
    print( paste( vector_1[i],"Fits our Conditions" ) ) }
}
print( paste("Total number of elements:",ct)  )



# 4  
Greatest Common Divisor is the largest value which is divisible 
by 2 or more numbers under consideration.
Assume numbers 345 and 675, if GCD exist it should 
be 2 tomes lowet tham minimum value in a range,
otherwise it wount be divisible with remainder of 0 by
675
Solutiuon with loop and if is the following:
  var_1<-345
  var_2<-675
loop_end<-min(var_1,var_2)/2
gcd<-0
for (i  in  1:(loop_end)   ) {
      if ( var_1 %% i==0 & var_2 %% i==0 & i>gcd  )
        gcd<-i
}
print(gcd)


Now use similar approach to estimate 
what numbest frm range from 3 to 20 are considered as
prime numbers. Prime numbers are divisible only by 1 and
itselves. Therefore , number of divisors from 2 till 
the number itself minus 1 whould be 0.

for (i in 3:20) {
    if ( sum(i %% (2:(i-1))==0)==0) {
       print( paste("Number is prime:",i)  )
    }
}

Here i %% (2:(i-1))==0 creates  vector of logical type,
each element is TRUE or FALSE. As 0 is nueric equivalent of
0, we expect that of value is prime, sum woudl be 0.




# 5

Assume string
str_1<-"sample text which contains several vowels"
Unlike Python in R we cant loop through 
string characters or subset particular element like srt_1[2].

First we store each element of srting as selarate element
of character vector:
  
str_2<-unlist( strsplit(str_1,split="") )

Unlist is requred to conver list which result from strsplit(str_1,split="")
to vector

sum_vowels<-0
for ( i in str_2 ) {
  if (  i %in% c("a", "e", "i", "o", "u")  ) {
    sum_vowels=sum_vowels+1
  }
}
print(sum_vowels)

We counted number of vowels in sentence.
%in% check if value referenced in i is contained
in vector c("a", "e", "i", "o", "u")


Now utf8ToInt() fucntion in R would depict
symbol coding  in utf8 system, fucntion workd the same way
as ord() funtion in python.
Digits are coded with indices from 48 to 57, 1 to 9
respectively.

Now use utf8ToInt() to count number and sum of difits in srt_1 via loop
and as.numeric() to conver string vertion of digit to number
str_1<-"sample23 text whi67ch contains 89several vowels"  
str_2<-unlist( strsplit(str_1,split="") )  
  
sum_digits<-0
count_digits<-0
for ( i in str_2 ) {
  if ( utf8ToInt(i)>=48 & utf8ToInt(i)<=57  ) {
    print(i)
    sum_digits<-sum_digits+as.numeric(i)
    count_digits<-count_digits+1
  }
} 
print( paste(sum_digits,count_digits)  )










