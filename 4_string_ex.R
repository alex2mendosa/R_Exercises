For this series of exercises you will
require to upload dplyr library and use of the following base functions:
library(dplyr)
strsplit( split="")
sub()
gsub()
cat()
substr()
grep()
grepl()
regexpr()
gregexpr()

Following sentences are used as input for
exercises, space and commas are used to separate words
Basic knowledge of regular expresions are required

x<-"Lorem ipsum dolor sit amet consectetur 
adipiscing elit sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua"

y<-"There are some things 
that are so unforgivable that they make other things easily forgivable."

z<-"Even if they are djinns, I will get djinns that can outdjinn them."

q<-"I felt happy because I saw the others were happy and 
because I knew I should feel happy, but I wasn't really happy"

song_1<-"Five little ducks went swimming one day 
Over the hills and far away 
Mother duck said, 'Quack, quack, quack, quack'
But only four little ducks came back
Old Mother Duck went out one day,
Over the hills and far away,
Mother Duck said 'Quack, quack, quack, quack
And all of those five little ducks came back."


report_1<-"2022 was another year
of strong progress. 
Our organic growth reached
12.8%. Real internal growth
accelerated to 1.9% for the
full year.Total reported sales increased by 5.6% 
to CHF 86.8 billion (2018: CHF 82.2 billion).
Net divestments had a negative impact of 0.7% and 
foreign exchange reduced sales
by 1.9%."

file_path<-"Home/sally/statusReport/report_20.csv"

sample_email<-"learn_withCodeHoroso@notprotonmail.com"

#1.+ Write a Python program to calculate the length of a string,sample_email
length(sample_email) # is not appropriate as string as single object 
nchar(sample_email) # is the solution


#2.+  Write a Python program to calculate the length of a string,sample_email
#excluding @ sign
buf_part<-gsub(pattern="@",replacement="",sample_email)
length(buf_part) # is not appropriate as string as single object 
nchar(buf_part) # is the solution

#3.+  Mistake is made and @ sign is added to Username in sample_email
#remove first appearance of @
sample_email_2<-"learn_with@CodeHoroso@notprotonmail.com" 
sub(pattern="@",replacement="",sample_email_2)


#4.+ Write R program to count the number
#of characters (character frequency) in text x. 
# we would require to remove \n  and space before count

table(strsplit( gsub("\\n| ","",x)  ,split="") ) %>% 
                as.data.frame


#5+ Write R program to get a string made of the 
#first 2 and the last 2 characters from a given sentence
y<-"There are some things 
that are so unforgivable that they make other things easily forgivable."
n<-nchar(y)
paste( substr(y,1,2),substr(y,n-1,n),sep="" )


#5+ Write R program to get a sentence from a given y
#where all occurrences of its first character (both upper and lower)
#have been changed to '$'

rep_val<-substr(y,1,1)
gsub( rep_val   ,"$",y,ignore.case = TRUE) %>% cat
# we use cat instead of paste to avoin \n outputs




#6+ Write R program to get a string from a given y
#where first occurrence of its first character (both upper and lower) 
#have been changed to '$'

rep_val<-substr(y,1,1)
sub( rep_val   ,"$",y,ignore.case = TRUE) %>% cat


#7+
#Write R program to get a single string from 
#two given strings, separated by a space then swap the first 
#two characters of each string
s1<-"You are string 1"  
s2<-"Hello world of data science"  
paste(substr(s2,1,2),substr(s1,1,2),substr(s2,3,nchar(s2)),
      substr(s1,3,nchar(s1)))

#8+
#Given string z with multiple words separated with space, add
# ING combination to end of each string

paste( unlist(  strsplit(z,split=" |\\.")  ),"ING",collapse=" ",sep="")
paste( unlist(  strsplit(z,split="\\W+")  ),"ING",collapse=" ",sep="")



#9+
#Write R program to find the first appearance of combination
#"se" in sting x
x<-"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua."
regexpr("se",x)[1]

#10+
#Write a Python program to find all start indices of
#"djinns" in sting z

gregexpr("djinns",z) # to get list with data
as.numeric(gregexpr("djinns",z)[[1]] )

#11+
#Write R code that 
#takes a sentence and returns the length of the longest one, use x variable

which.max( sapply( strsplit( gsub("\n","",x)  ,split=" |\\,")[[1]],nchar) )



#12+
#Write R program to 
#remove the nth index character from a nonempty string y.
#use indices 2,5,8

n<-c(3,5,8)
cat(  strsplit(y,split=" ")[[1]][-n]  ,collapse=" ")



#13+
#Write  R function to change 
#a given string to a new string where the first
#and last characters have been exchanged. 

s1<-"Sulforaphane"

ext_ch<-function(y,loc=1) {
   return(   strsplit(y,split="")[[1]][loc] )
}
paste( ext_ch(s1,nchar(s1)) ,  substr(s1,2,nchar(s1)-1), ext_ch(s1),sep="")



#14+
#Write R
#program to remove the characters with odd
#indices from y.

indices<-seq(from=2,to=nchar(x) , by=2)
paste( strsplit( gsub("\n","",y) ,split="")[[1]][-indices],collapse = "")


#15+
#Write R script that 
# displays x in upper case and then lower case only.
x<-"Lorem ipsum dolor sit amet consectetur 
adipiscing elit sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua."

cat(tolower(x))
cat(toupper(x))


#16+
#Write R script that 
#displays x without spaces

cat( gsub(" ","",x) )


#17+
#Remove leading and/or trailing whitespace from strings q.
x1<-"  Lorem ipsum dolor sit amet consectetur 
adipiscing elit sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua  "

cat( trimws(x1,which=c("both")) )


#18+
#Write R program that 
#prints the unique words in q

sort( unique( strsplit( gsub("\n","",q) ,split=" ")[[1]] ) )

#19+
#Write R function to create the HTML string with 
#tags around the words in x.

html_tag<-function(y) {
   return( paste("<",y,">",sep="") )
}

step_1<-strsplit(gsub("\n","",q) ,split=" ")[[1]]
cat( html_tag(step_1),collapse=" " )



#20+
#use srtsplit to split sentence q into 
#composing charaters

strsplit( gsub("\n","",q) ,split="")[[1]]


#21+
#use srtsplit to split sentence x by words

strsplit( gsub("\n","",x) ,split=" |\\.")
strsplit(x,split="\\W+")

#22+
#use srtsplit to split characters by vowels in z

strsplit(z,split="[aeiuo]")
strsplit(z,split="a|e|i|o|u")


#23+
#Write R code to insert a string 
# in the middle of another string str_1 of odd length. 
str_1<-"middle"
ins_str<-"$RR$"
split_point<-nchar(str_1)/2
cat( substr(str_1,1,split_point),ins_str,
       substr(str_1,split_point+1,nchar(str_1)),sep="" )


#24+
#Write R code to get a string made 
#of last characters of each word of another sentece y. 


part_1<-unlist( strsplit( gsub("\n","",y)  ,split="\\W+") )
paste( sapply(part_1, function(x) { substr(x,nchar(x),nchar(x))   }),collapse="" )


#experimental vertion
part_1<-unlist( strsplit( gsub("\n","",y)  ,split="") )
construct_str<-as.character()
n<-length(part_1)
for (i in  1:n) {
   if (i<n) {
      if (part_1[i+1] %in% c(" ",",",".")   ) {
         construct_str<-c(construct_str,part_1[i])
      }
   } else {construct_str<-c(construct_str,part_1[i])}
}
paste(construct_str,collapse="")




#25+
#Write R program to
#split file path and  file name, use 
#file_path

loc<-tail( gregexpr("/",file_path)[[1]] ,1)
paste("Absolute path:",substr(file_path,1,loc) )
paste("File Name:",substr(file_path,loc+1,nchar(file_path)) )

#26+
#Write R function to reverses a string  y and q

paste( rev( strsplit( gsub("\n","",y) ,split="")[[1]] ),collapse="")
cat( rev( strsplit(q ,split="")[[1]] ),collapse="")


#27+
#Write R code to convert all vowels to uppercase in z

part_1<-unlist(strsplit(z,split=""))
loc<-which(part_1 %in% c("a","e","i","o","u"))
part_1[loc]<-toupper(part_1[loc])
paste(part_1,collapse="")

#28+
#Write R program to count occurrences of a 
#substring djinnin a string z

z<-"Even if they are djinns, 
I will get djinns that can outdjinn them."
search_str<-"djinn"
length( gregexpr("djinn",z)[[1]] )


#29+
# Count and sort cahracters which form the sentecne

song_1<-"Five little ducks went swimming one day 
Over the hills and far away 
Mother duck said, 'Quack, quack, quack, quack'
But only four little ducks came back
Old Mother Duck went out one day,
Over the hills and far away,
Mother Duck said 'Quack, quack, quack, quack
And all of those five little ducks came back."
Letters<-strsplit( gsub("\n","",song_1)  ,split="")[[1]]
Letters<-Letters[-which(Letters %in% c(" ",".",",","'","\n") )]
data.frame( table( Letters ) ) %>% arrange(desc(Freq) )


#30+
#WriteR program to check if a string contains all letters of the alphabet
#and display what letters are present and what not , use x

x<-"Lorem ipsum dolor sit amet consectetur 
adipiscing elit sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua"

Letters<-tolower(strsplit(gsub("\n","",song_1) ,split="")[[1]])
Letters<-Letters[-which(Letters %in% c(" ",".",",","'","\n") )]
db1<-data.frame( table( Letters ) ) %>% arrange(desc(Freq) )
data.frame(letters,Count=db1$Freq[match(letters ,db1$Letters) ] )

#31+
#Write program to extract all % digits form text,
#decimal part of digit contains only 1 number
report_1<-"2022 was another year
of strong progress. 
Our organic growth reached
12.8%. Real internal growth
accelerated to 1.9% for the
full year.Total reported sales increased by 5.6% 
to CHF 86.8 billion (2018: CHF 82.2 billion).
Net divestments had a negative impact of 0.7% and 
foreign exchange reduced sales
by 1.9%."


loc<-gregexpr("[0-9]{1,5}.[0-9]{1}%",report_1)[[1]]
match_len<-attr(loc,"match.length")-1

for (i in 1:length(loc)) {
   print( substr(report_1,start=loc[i],stop=loc[i]+match_len[i]) )  
}


#32+
#Write a #R program to count
#how many times words and spaces are repreated in string q.

words<-strsplit( gsub("\n","",q) ,split=" |,")[[1]]
data.frame(table(words))


#33+
#replace word consectetur in x to its reverse vertion

loc<-regexpr("consectetur",x)
n<-nchar("consecteur")
rev_version<-paste(rev( strsplit("consecteur", "")[[1]] ),collapse="")
substr(x,start=loc,stop=loc+n)<-rev_version
cat(x)


#34+
#Write R program to print digits of a given string,
#except percentages

report_1<-"2022 was another year
of strong progress. 
Our organic growth reached
12.8%. Real internal growth
accelerated to 1.9% for the
full year.Total reported sales increased by 5.6% 
to CHF 86.8 billion (2018: CHF 82.2 billion).
Net divestments had a negative impact of 0.7% and 
foreign exchange reduced sales
by 1.9%."


loc<-gregexpr("[0-9]{1,5}.[0-9]{1}[^%]",report_1)[[1]]
match_len<-attr(loc,"match.length")-2

for (i in 1:length(loc)) {
   print( substr(report_1,start=loc[i],stop=loc[i]+match_len[i]) )  
}


#35+
#WriteR program to remove duplicate words from a given string
#song_1

words<-strsplit(song_1,split="\\W+")[[1]]
words_count<-data.frame(table(words)) %>% filter(Freq>1) %>%
   pull(words) %>% as.character()

for (i in length(words_count)) {
   print( gsub(words_count[i],"",song_1) )
}




































