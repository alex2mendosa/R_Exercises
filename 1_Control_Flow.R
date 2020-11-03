# Exercise 1 
Control Flow include statements which define
output based on specific conditions. 
We define set of choices to be made based on input data.
In R choices are mainly defined with if 
statement.
Code Template is represented by:
  if (condition==TRUE) {Action+Output} or
  if (condition==TRUE) {Action+Output} else {Alternative Action+Output}

Assume n variable which refers to integer number.
Define if statement which prints  
"Odd" if n is odd and "Even" otherwise.
Solution
n<-20 # fell free to choose any number
if (n %% 2!=0) {print("Odd")
} else {print("Even")}
Note that
n<-20
if (n %% 2!=0) {print("Odd")} 
else {print("Even")} 

Will result in error, so as the best practice,
else should remain in separate line
between curly brackets which
separate Main Action and Alternative



#  Exercise 2
2 lines on 2 dimentional plane
which are described by equation ax+by=c
are considered parallel if  slopes are equal,
slope is calculated as m=-a/b.
Given 2 vectors, determine if lines are parallel:
in other words estimate slope for both lines and compare them.
line_1<-c(2,4,8) #for a,b,c
line_2<-c(8,9,11)
Use [] accessor to select input 
values from vector.

Solution:
  if (line_1[1]/line_1[2]==line_2[1]/line_2[2]) { # minus is not required
    print("Lines are Parallel")                   # for this comparison
  } else { print("Lines are Not Parallel") } 


# Exercise 3

In previous example we assume
2 choices, to proceed futher we need to take 
advantage of fact that R allows to define multiple 
choices in other words, to adjust our output to 
multiple input conditions.

In this case else statement is replaced
with multiple else if depending on 
number of possible outcomes.

BMI offers the following classification:
  >=30 is classified as "Obese"
  <=25.0:29.9<= is classified as "Overweight"
  18.5:24.9<= is classified as "Normal" weight
  BMI=weight/(height^2),
  height in meters [1.78 for example].
  ":" colon represents range

Define control flow which
accepts as input human parameters and
outputs BMI classification.
You can crate function for additional 
challenge.

Solution

BMI<-function(weight,height) {
  bmi=round( weight/(height^2) ,1)
  
  if (bmi<=24.9) {
    print("Normal Weight")
  } else if (bmi>=25.0 & bmi<=29.9) {
    print("Overweight")
  } else if (bmi>=30) {
    print("Obese") 
  }
  return(bmi)    }

BMI(80,1.82)
Notice that else if is located between
2 curly brackets in separate line,
current notation allows R to read 
properly declared conditions.


# Exercise 4
if statement accepts single value as input,
technically , condition should have length 1,
for example 
if ( c(2,3)>5 ) {print("Ok")} will result in error
as c(2,3) forms vector of lenght 2.
To apply if statement to vector
ifelse  structure should be used.


x=(rnorm(5,10,2)) # random numbers are generated
print(x)
ifelse(x>10,"Values Over Mean","Values Below or equal to Mean")

ifelse applies ">10" condition to each values in x.
Code Template is represented by:
ifelse(Condition, Action if Condition TRUE, Action if FALSE)

Now , given the sequence in sample_1,
check with ifelse what values are odd or even
sample_1<-sample(1:20,10,replace = TRUE)

# Solution
sample_1<-sample(1:20,10,replace = TRUE)
ifelse(sample_1 %% 2==0, "Even","Odd" )

Use ifelse  when the result
forms binary output[only 2 possible mutually exclusive outcomes], 
in case operation  requires vector as input and considers
more than 2 possible outcomes, alternative
control flow structure should be considered.

# Exercise 5

dplyr package offers function case_when()
which operates with vectorised input[unlike if statement] and
allows to consider multiple conditions
followed by unique outcome.
Function is similar to Case When statement in SQL.

Going back to example with even and odd numbers,
we can  rewrite it using case_when:
  
sample_1<-sample(1:20,10,replace = TRUE)    
dplyr::case_when(
  sample_1 %% 2==0 ~ "Even",  
  sample_1 %% 2!=0 ~ "Odd" 
)

dplyr:: is used to refer to library to which
function belongs to.
If dplyr is activated via library(dplyr) command,
dplyr:: can be skipped. 

Now use case_when statement to define human BMI,
conditins are:
 >=30 is classified as "Obese"
 <=25.0:29.9<= is classified as "Overweight"
 18.5:24.9<= is classified as "Normal" weight
 BMI=weight/(height^2),
 height in meters [1.78 for example].

weight<-sample_1<-sample(60:90,10,replace = TRUE)   
height<-sample_1<-sample( seq(from=1.65,to=1.95,by=0.05),10,replace = TRUE)   
BMI=round( weight/height^2,1)


Solution
dplyr::case_when(
  BMI>=30 ~ "Obese",  
  BMI<=29.9 & BMI>=25.0 ~ "Overweight",
  BMI<=24.9 ~ "Normal Weight"
)

~, tilda can be read as "evaluates to"



# Exercise 6

With else if combination, given input of 
3 length triangle sides, define its type:
equilateral , isosceles and scalene.

Try to include one if, one else and one else if
or obe if and two else if statements.
Create function for additional challenge.

triangle_type<-function(a,b,c) {
  if (a==b & b==c) {
    print("Triangle is Equilateral, all sidea are equal")
  } else if ( a==b | b==c | a==c )   {
    print("Triangle is Isosceles, only 2 sides are equal") 
  } else {print("Triangle is Scalene,all sides are different")} 
}

triangle_type(5,6,5)


# Exercise 7

When defining type of triangle we should also consider that
triangle can exist if the sum of any 2 sides of a triangle
is greater than the third side.
This condition should be evaluated before we
classify triangle.
Now modify your solution to
exercise 6, specifically:
check the rule for triangle existance before
defining type of triangle

Solution:

triangle_type<-function(a,b,c) {
  
  if ( a+b>c & a+c>b & b+c>a ) {
    if (a==b & b==c) {
      print("Triangle is Equilateral, all sidea are equal")
    } else if ( a==b | b==c | a==c )   {
      print("Triangle is Isosceles, only 2 sides are equal") 
    } else {print("Triangle is scalene,all sides are different") } 
  } else {print("Triangle Inequality Theorem is violated")}
}

triangle_type(5,1,8)
Multiple presence of else if and else can be source
or error even if number of all brackets is defined correctly. 
To add readability to code use
" } else { " positioning when binding multiple conditions.




# Exercise 8

For a dietary purposes person has limited amount
of calories intake to 2000 cal. Whenever he/she consumes more than
2200, "Bulking" status takes place, value between 2200 and 1800 is considered
"Maintainace", and value lower than 1800 is classified as "Cutting"
sample_1<-sample( seq(1600,2500,by=100),20,replace = TRUE )

Now with length(), ifelse() and sum() function to estimate
how many days in sample_1 vector  diet is maintained.
Multiple solutions are possible.

Solution

vector_1<-ifelse(sample_1>2200,"Bulking","Maintainace")
vector_2<-ifelse(vector_1=="Maintainace",1,0)
paste("Diet is maitanied: ",(sum(vector_2)/length(vector_2))*100,"% of days",sep="")
Current solution account only for 2 outcomes, to add
3 possible states of diet we can use the following:
  
vector_1<-dplyr::case_when(
  sample_1>2200~"Bulking",
  sample_1<=2200 & vector_1>=1800 ~"Maintainace",
  sample_1<1800~"Cutting"
)  
vector_2<-ifelse(vector_1=="Maintainace",1,0)
paste("Diet is maitanied: ",
      (sum(vector_2)/length(vector_2))*100,"% of days",sep="")



# Exercise 9

Given sample vector, use ifelse to
define what values are between 200 and 300
and are divisible by 8 [use %% operator].


Solution
sample_1<-sample( 180:320,20,replace = TRUE )
ifelse(sample_1 %% 8==0 & sample_1>200 & sample_1<300,TRUE,FALSE)

Therefore, you can nest multiple statements with ifelse, however
output would account for only 2 possible outcomes.


# Exercise 10

Data analysis project may require 
operation on dates represented in form of 
numerical values or characters.
With case_when() function 
convert month indices from 1 to 6
to full months names.

month_order<-sample(1:6,15,replace = TRUE)

Solution

dplyr::case_when(
  month_order==1 ~"January",
  month_order==2 ~"February",
  month_order==3 ~"March",
  month_order==4 ~"April",
  month_order==5 ~"May",
  month_order==6 ~"June"
)


# Exercise 11

Condition in choice control flow can be formed by 
function which results in logical type.
Assume following vector with products groups
fmcg_brands<-c("Folgers","Nescafe","Jacobs","Snickers","Milka","Pepsi","Red Bull")
grepl("Nestle","Nescafe is Nestle Brand") would result in TRUE if
"Nestle" string [treated as pattern] 
is present in sentence "Nescafe is Nestle Brand"

grepl("Nestle|Pepsi","Nescafe is Nestle Brand") checks if either "Nestle" or "Pepsi"
are present in sentecne "Nescafe is Nestle Brand"

Now, use grepl() and case_when() to classify brands in fmcg_brands 
into groups "Coffee","Confectionery" or "Beverages"
use grepl() to define pattern and apply it to fmcg_brands vector.

Solution
dplyr::case_when(
  grepl("Nescafe|Folgers|Jacobs",fmcg_brands)==TRUE ~"Coffee",
  grepl("Snickers|Milka",fmcg_brands)==TRUE ~"Confectionery",
  grepl("Pepsi|Red Bull",fmcg_brands)==TRUE  ~"Beverages"
)

Current example is usefull when working with data frames or tibbles,
whenever we want to introduce additional layer of classification
or aggregation to data.



# Exercise 12

Assume data frame with the following classification
emp_data<-data.frame(Emp_Id=paste(1:10,sample(letters[1:2],10,replace = TRUE),sep="-"),
                     Yr_Employed=sample(1:5,10,replace = TRUE)  )

Now create 2 vectors with choice control flow.
First vector would be of character type which
should include 3 classifications of employees:
"Beginner" with Yr_Employed<=1
"Intermediate"  1<Yr_Employed<=3
"Expert"  3<Yr_Employed<=5


if (emp_data$Yr_Employed<=1) {
  "Beginner"
} else if (emp_data$Yr_Employed>1 & emp_data$Yr_Employed<=3){
  "Intermediate"
} else {"Expert"}  

Will fail as we are dealing with vector: length(emp_data$Yr_Employed)>1
We can make a step forward and loop through each 
value separately with for loop

Emp_Status=rep(0,nrow(emp_data))
ct=1
for (i in emp_data$Yr_Employed) {
  if (i<=1) {
    Emp_Status[ct]<-"Beginner"
  } else if (i>1 & i<=3){
    Emp_Status[ct]<-"Intermediate"
  }else {  Emp_Status[ct]<-"Expert" }  
  ct=ct+1
}

Here, we require loop defined with for, ct variable
as index to specify position where value should be allocated,
initial emty vector Emp_Status.

Solution with case_when:
  buf<-emp_data$Yr_Employed
  Emp_Status<-dplyr::case_when(
  buf<=1 ~"Beginner",
  buf>1 & buf<=3~"Intermediate",
  buf>3 ~ "Expert"
)

Now to attach new vector to data frame:
  emp_data$Emp_Status<-Emp_Status


Bonus_Value is formed by base value multiplied by
number semiannual(6 months) working periods.
Base value for Bonus_Value depends on
Emp_Status and Department:
  department "a":
  Beginner:50, Intermediate:60, Expert:70
  department "b":
  Beginner:80, Intermediate:90, Expert:100

Now create vector which estimates
Bonus_Value, input variables Emp_Status and Emp_Id
represent vectors, so you can use for loop and if 
statement or case_when.
Use grepl(pattern,text) to check to which department employee belongs to.
Overall, you require to specify 6 conditions,
remember that practice makes perfect.


Bonus
Bonus_Value<-with (emp_data,
                   dplyr::case_when(
                     grepl("a",Emp_Id) &  Emp_Status=="Beginner"~50*Yr_Employed*2,
                     grepl("a",Emp_Id) &  Emp_Status=="Intermediate"~60*Yr_Employed*2,
                     grepl("a",Emp_Id) &  Emp_Status=="Expert"~70*Yr_Employed*2,
                     grepl("b",Emp_Id) &  Emp_Status=="Beginner"~80*Yr_Employed*2,
                     grepl("b",Emp_Id) &  Emp_Status=="Intermediate"~90*Yr_Employed*2,
                     grepl("b",Emp_Id) &  Emp_Status=="Expert"~100*Yr_Employed*2
                   ) )

with() is used to constuct environment from our data frame,
otherwhise, we would requre $ accessor to specify 
what column we want to use, for example 
grepl("a",emp_data$Emp_Id) & emp_data$Emp_Status=="Beginner"


emp_data$Bonus_Value<-Bonus_Value



# Exercise 13

Assume time series which contains Sales data for
17 months. We need to estimate outliers and replace them 
with appropriate proxy for normal Sales level.

ts1<-c(47, 52, 50, 46, 200, 54, 58, 55, 200, 51, 49, 60, 48, 200, 57,45,43)
print(ts1)
Value is considered as outlier if it is more than 2 standard deviations 
away from mean.

First, use ifelse() to replace outliers with NA values,
then use for loop and if statement to replace outliers
with averages of lag 1 and lead 1 observations.
To solve it, you would require loop to 
access value by index, or call for lag() and lead()
function from dplyr package combined with case_when().

Use mean() function and sd() to calculate statistics,
to estimate how many standard deviations value is form mean use Z score
(Value-Mean)/Standard Deviation,isna() to check if value is NA.


Solution
ts1_outliers_1<-ifelse( ( (ts1-mean(ts1))/sd(ts1) )>2,NA,ts1)

for (i in seq_along(ts1_outliers_1)) {
  if (is.na(ts1_outliers_1[i]) ) {
    ts1_outliers_1[i]<-(ts1[i-1]+ts1[i+1])/2 } 
}

With lag() and lead() functions solution is 
{please install dplyr library to run code}

ts1_outliers_2<-ifelse( ( (ts1-mean(ts1))/sd(ts1) )>2,NA,ts1)
ts1_outliers_2<-case_when(
  is.na(ts1_outliers_2)~ (lag(ts1_outliers_2)+lead(ts1_outliers_2))/2,
  TRUE~ts1_outliers_2
)

all(ts1_outliers_1==ts1_outliers_2)











