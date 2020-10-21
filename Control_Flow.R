# Exercise 1 
Control Flow includes statements which define
output based on specific conditions. 
We define set of choices to be made based on input data.
I R choices are mainly defined with if
statement
Code Template is represented by:
  if (condition==TRUE) {Action}
if (condition==TRUE) {Action} else {Alternative}

n varibale contais numner
define of statment which output
text of n if odd or even
Solution
n<-20
if (n %% 2!=0) {print("Odd")
} else {print("Even")}
Note that
n<-20
if (n %% 2!=0) {print("Odd")} 
else {print("Even")} 

Will result in error, so as the best practice
else should remain in separate line
both with curly brackets which
separate Main Action and alternative



# Exercise 2

In previous example we assume
2 choices, as the continuatuin 
R allows to define multiple 
choices and adjust our output to 
multiple input conditions.

In this case else statamet is replaced
with multiple else if dependion on 
number of choices

BMI has the following gradation:
  >=30 is classifies as Obese
<=25.0–29.9<=is classifies as overweight
18.5–24.9<= iis classifies as normal weight
bmi=Kg/(height^2),
heiht is indicates in meters.

Define control flow which
accepts as input human parameters and
outputs bmi classification

BMI<-function(weight,height) {
  bmi=weight/(height^2)
  
  if (bmi<=24.9) {
    print("Normal Weight")
  } else if (bmi>=25.0 & bmi<=29.9) {
    print("Overweight")
  } else if (bmi>=30) {
    print("Overweight") 
  }
  
  return(bmi)    }

BMI(80,1.82)


# Exercise 3
if statement accept signle value as input,
technically , cndition should have length 1,
for example 
if ( c(2,3)>5 ) {print("Ok")} will result in error
as c(2,3) forms a vactor of lenght 2.
to apply if statemt to vector
ifelse statemtn can be employed.

x=(rnorm(20,10,2))
print(x)
ifelse(x>10,"Values Over Mean","Values Below or equal to Mean")

Now , given the sequence
check with ifelse if value is odd or even

# Solution
sample_1<-sample(1:20,10,replace = TRUE)
ifelse(sample_1 %% 2==0, "Even","Odd" )

Use ifelse is usefull when the result
forms binary variable, if operation 
requires vector as input and considers
more than 2 possible outcomes alternative
contrl flow function shouls be considered

# Exercise 4

dplyr package offers fucntion case_when
which alloes vectorised operations and
allows to consider multiple conditions 
,each which uniqu outcome.
Fucntion is similare to Case when statemnt in SQL.

Going back to example to even and uneven numbers ,
we can  rewrite it using case_when:
  
  sample_1<-sample(1:20,10,replace = TRUE)    
dplyr::case_when(
  sample_1 %% 2==0 ~ "Even",  
  sample_1 %% 2!=0 ~ "Odd" 
)

Now use case_when statement to define human BMI 
>=30 is classifies as Obese
<=25.0–29.9<=is classifies as overweight
18.5–24.9<= iis classifies as normal weight
bmi=Kg/(height^2), 

weight=sample_1<-sample(60:90,10,replace = TRUE)   
height=sample_1<-sample( seq(from=1.65,to=1.95,by=0.05),10,replace = TRUE)   
BMI=weight/height^2

dplyr::case_when(
  BMI>=30 ~ "Obese",  
  BMI<=29.9 & BMI>=25.0 ~ "Overweight",
  BMI<=24.9 ~ "Normal"
)

~, tilda can be read as "evaluate as"



# Exercise 5

With elseif statment, given input of 
3 sides of triangle, define its type:
  equilateral , isosceles and scalene.

Tru to include if, 1 else and 1 else if
or 1 if and  2 else if

triangle_type<-function(a,b,c) {
  if (a==b & b==c) {
    print("Triangle is Equilateral, all sidea are equal")
  } else if ( a==b | b==c | a==c )   {
    print("Triangle is Isosceles, only 2 sides are equal") 
  } else {print("Triangle is scalene,all sides are different")} 
}

triangle_type(5,6,5)


# Exercise 6

When defining type of triangle we should also consider that
triangle can exist if the sum of any 2 sides of a triangle
must be greater than the third size.
This shouuld be the first condition to
evaluate.

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
or error even if number of all brackes is defined correctly 
to add readability to code use
" } else { " positioning to add robustness to code.




# Exercise 7

For a dietary purposes person has limited amount
of calories intake to 2000 ccal. Whenever he/she consumes more than
1500 , "Bulking" status takes place, value equal to 2000 or lower is considered
"Maintainace".
sample_1<-sample( seq(1800,2800,by=100),20,replace = TRUE )
now with length, ifelse and sum fucntion estimate
how many days from records Diet is maintained.
Multiple solutions are possible

vector_1<-ifelse(sample_1>2000,"Bulking","Maintainace")
vector_2<-ifelse(vector_1=="Maintainace",1,0)
paste("Diet is maitanied: ",sum(vector_2)/length(vector_2),"% of days",sep="" )




# Exercise 8

Given a sample vectro, use ifelse to
define what values are between 200 and 300
and are divisible by 8.

sample_1<-sample( 150:320,20,replace = TRUE )
ifelse(sample_1 %% 8==0 & sample_1>200 & sample_1<300,TRUE,FALSE)

Therefore you can nest multinple statemens with ifelse, however
output should be considered to classify 2 possible outcomes.


# Exercise 8

Data analysis project may require 
operation on dates represented in form of 
numerical values or cahracters.
With case_when fucntion 
convert numbers from 1 to 6
to its to full months names which 
ech number represents.


month_order<-sample(1:6,15,replace = TRUE)

dplyr::case_when(
  month_order==1 ~"January",
  month_order==2 ~"February",
  month_order==3 ~"March",
  month_order==4 ~"April",
  month_order==5 ~"May",
  month_order==6 ~"June"
)


# Exercise 9

Condition in choice control flow can be formed by 
function which results in logical type.
Assume following vector with products groups
fmcg_brands<-c("Folgers","Nescafe","Jacobs","Snickers","Milka","Pepsi","Red Bull")
grepl("Nestle","Nescafe is Nestle Brand") would result in TRUE if
"Nestle" string is present in sentecne "Nescafe is Nestle Brand"

grepl("Nestle|Pepsi","Nescafe is Nestle Brand") checks if either "Nestle" or "Pepsi"
are present in in sentecne "Nescafe is Nestle Brand"

Now use grepl and case_when to classify brands in fmcg_brands 
into groups "Coffee","Confectionery" or "Beverages"

dplyr::case_when(
  grepl("Nescafe|Folgers|Jacobs",fmcg_brands)==TRUE ~"Coffee",
  grepl("Snickers|Milka",fmcg_brands)==TRUE ~"Confectionery",
  grepl("Pepsi|Red Bull",fmcg_brands)==TRUE  ~"Beverages"
)

Current example is usefull when working with data frames or tibbles 
whenever we want to introduce additional layer of classification.


emp_exp<-c("Novice","Intermediate","Expert")
salary<-c(100,150,200)
emp_data<-data.frame(emp_exp,salary)

emp_data$Bonus<-ifelse (emp_data$emp_exp=="Expert",emp_data$salary*0.8,emp_data$salary*0.3)

As output 3 get 3 values which represent bonus value as percentage 
of salary evaluated for each row in data frame, which is assign as
separate column in or data frame.


Assume vector with the following classification
emp_data<-data.frame(Emp_Id=paste(1:5,sample(letters,5),sep="-"),
                     Base_Salary=sample(100:150,5),
                     Yr_Employed=sample(1:5,5)  )


Now create 2 vectors with choice flow
First vector would be of character type with
would include 3 classifications of employee:
"Beginner" with Yr_Employed<=1
"Intermediate"  1<Yr_Employed<=3
"Expert"  3<Yr_Employed<=5


if (emp_data$Yr_Employed<=1) {
  "Beginner"
  } else if (emp_data$Yr_Employed>1 & emp_data$Yr_Employed<=3){
    "Intermediate"
  }else {"Expert"}  
wil fail as we ae dealing with vector
We can make a step forwrd and loop through each 
value separately with loop

Emp_Vector=rep(0,nrow(emp_data))
ct=1
for (i in emp_data$Yr_Employed) {
     if (i<=1) {
       Emp_Vector[ct]<-"Beginner"
     } else if (i>1 & i<=3){
       Emp_Vector[ct]<-"Intermediate"
     }else {  Emp_Vector[ct]<-"Expert" }  
  ct=ct+1
}

Here we require loop define with for, ct variable
as index to specify position where value should be allocated,
initial emty vector Emp_Vector
Solution with case_when

buf<-emp_data$Yr_Employed
Emp_Vector<-dplyr::case_when(
  buf<1 ~"Beginner",
  buf>1 & buf<=3~"Intermediate",
  buf>3 ~ "Expert"
                 )

emp_data$Emp_Vector<-Emp_Vector

Current solution is more efficient
To estimate Bonus value 
we need to multiply Yr_Employed by Bonus Percentage
Beginner receives 20% of base salary,
Intermediate receives 50% of base salary,
Expert receives 70% of base salary

Bonus_Value<-dplyr::case_when(
  Emp_Vector=="Beginner"~ emp_data$Yr_Employed*0.2,
  Emp_Vector=="Intermediate"~ emp_data$Yr_Employed*0.5,
  Emp_Vector=="Expert"~ emp_data$Yr_Employed*0.7
)














