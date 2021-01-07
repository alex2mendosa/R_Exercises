library(dplyr)
strsplit
sub
gsub
cat
substr
grep
grepl
regexpr
gregexpr



x<-"Lorem ipsum dolor sit amet consectetur 
adipiscing elit sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua"

y<-"There are some things 
   that are so unforgivable that they make other things easily forgivable."

z<-"Even if they are djinns, I will get djinns that can outdjinn them."

q<-"I felt happy because I saw the others were happy and because
    I knew I should feel happy, but I wasn't really happy"

song_1<-"Five little ducks went swimming one day 
Over the hills and far away 
Mother duck said, 'Quack, quack, quack, quack'
But only four little ducks came back
Old Mother Duck went out one day,
Over the hills and far away,
Mother Duck said 'Quack, quack, quack, quack
And all of those five little ducks came back."
print(song_1)
cat(song_1)

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

#https://www.nestle.com/sites/default/files/2020-03/2019-annual-review-en.pdf


#1. Write a Python program to calculate the length of a string. 
x<-"I am random text"
length(x) # is not appropriate as string as single object 
nchar(x) # is the solution


#2. Write a Python program to count the number
#of characters (character frequency) in a string. 

table(strsplit(x,split="") ) # we need to split fucntion
# firtst
typeof( table(strsplit(x,split="") ) )

# 3 Write a Python program to get a string made of the 
#first 2 and the last 2 chars from a given a string.
x<-"Extract first 2 and last 2 characters"
paste( substr(x,1,2),substr(x,nchar(x)-1,nchar(x)) )

#4 Write a Python program to get a string from a given string
#where first occurrences of its first char 
$#have been changed to '$'
  x<-"extract first 2 and last 2 characters"
#gsub replaces all accurances of character
rep_val<-substr(x,1,1)
sub(rep_val,"$",x) 

#5 Write a Python program to get a string from a given string
#where first occurrences of its first char 
#have been changed to '$'
x<-"extract first 2 and last 2 characters"
#gsub replaces all accurances of character
rep_val<-substr(x,1,1)
gsub(rep_val,"$",x) 


#6
#Write a Python program to get a single string from 
#two given strings, separated by a space and swap the first 
#two characters of each string
s1<-"You are string 1"  
s2<-"Hello world of data science"  
paste(substr(s2,1,2),substr(s1,1,2),substr(s2,3,nchar(s2)),
      substr(s1,3,nchar(s1)))


#7
#Given string with multiple words separated with space, add
# QWE combination to end of each string

x<-"Given string with multiple words"
paste( unlist( strsplit(x,split=" ") ),"QWE",collapse=" ",sep="")

#8
#Write a Python program to find the first appearance of combination
#"se" in sting x
x<-"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua."
regexpr("se",x)[1]

#9
#Write a Python program to find all appearances of combination
#"se" in sting x
x<-"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua."

gregexpr("se",x)
as.numeric(gregexpr("se",x)[[1]] )


#10
#Write a Python function that 
#takes a list of words and returns the length of the longest one
#
x<-"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua."
which.max( sapply( strsplit(x,split=" |,")[[1]],nchar) )

#11
#Write a Python program to 
#remove the nth index character from a nonempty string.
x<-"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua."

n<-c(2,3,4)

paste(strsplit(x,split=" ")[[1]][-n],collapse=" ")

#12
#Write a Python program to change 
#a given string to a new string where the first
#and last chars have been exchanged. 
#
x<-"Aquadetrim"

ext_ch<-function(y,loc=1) {
  return(   strsplit(y,split="")[[1]][loc] )
}
paste( ext_ch(x,nchar(x)) ,  ext_ch(x), substr(x,2,nchar(x)-1),sep="")

#13
#Write a Python 
#program to remove the characters which have odd
#index values of a given string.

x<-"Lorem ipsum dolor sit amet consectetur adipiscing elit sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua."

indices<-seq(from=2,to=nchar(x) , by=2)
paste( strsplit(x,split="")[[1]][-indices],collapse = " ")


#14
#Write a Python script that 
#takes input from the user and displays
#that input back in upper and lower cases.
x<-"Lorem ipsum dolor sit amet consectetur 
adipiscing elit sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua."

tolower(x)
toupper(x)


#15
#Write a Python script that 
#takes input from the user and displays
#that input without spaces
x<-"Lorem ipsum dolor sit amet consectetur 
adipiscing elit sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua."
gsub(" ","",x)


#16
#Remove leading and/or trailing whitespace from character strings.
x<-" Lorem ipsum dolor sit amet consectetur 
adipiscing elit sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua. "
trimws(x,which=c("both"))


#17
#Write a Python program that accepts a comma 
#separated sequence of words as input and prints the unique words 

y<-"I felt happy because I saw the others were happy and because
I knew I should feel happy, but I wasn't really happy"

sort( unique( strsplit(y,split=" |,")[[1]] ) )

#18 15
#Write a Python function to create the HTML string with 
#tags around the word(s).

x<-"Lorem ipsum dolor sit amet consectetur 
adipiscing elit sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua"

html_tag<-function(y) {
  return( paste("<",y,">",sep="") )
}

step_1<-strsplit(x,split=" ")[[1]]
paste( html_tag(step_1),collapse=" " )



#19
#use srtsplit to split sentenc e into 
#composing charaters
y<-"There are some things 
   that are so unforgivable that they make other things easily forgivable."

strsplit(y,split="")



#19
#use srtsplit to split words separated witt space  
y<-"There are some things 
   that are so unforgivable that they make other things easily forgivable."

strsplit(y,split=" ")


#20
#use srtsplit to split characters by vowels
y<-"There are some things 
   that are so unforgivable that they make other things easily forgivable."

strsplit(y,split="[aeiuo]")


#21
#Write a Python function to insert a string 
#  in the middle of another string of odd length. 
str_1<-"middle"
ins_str<-"$RR$"
split_point<-nchar(str_1)/2
paste( substr(str_1,1,split_point),ins_str,
       substr(str_1,split_point+1,nchar(str_1)),sep="" )


#22
#Write a Python code to get a string made 
#of last characters of each word of another sentece. 

sentence_1<-"Even if they are djinns 
I will get djinns that can outdjinn them."

part_1<-unlist( strsplit(sentence_1,split="") )
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

#23
#Write a Python program to
#split file path anf file name

file_path<-"Home/sally/statusReport/report_20.csv"

loc<-tail( gregexpr("/",file_path)[[1]] ,1)
paste("Absolute path:",substr(file_path,1,loc) )
paste("File Name:",substr(file_path,loc+1,nchar(file_path)) )

24
#Write a Python function to reverses a string 
q<-"I felt happy because I saw the others were happy and because
I knew I should feel happy, but I wasnt really happy"


paste( rev( strsplit(q,split="")[[1]] ),collapse="")

#25
#Write a Python function to convert all vowels to uppercase 
y<-"There are some things 
that are so unforgivable that they make other things easily forgivable."

part_1<-unlist(strsplit(y,split=""))
loc<-which(part_1 %in% c("a","e","i","o","u"))
part_1[loc]<-toupper(part_1[loc])
paste(part_1,collapse="")

#26
#Write a Python program to count occurrences of a substring in a string

z<-"Even if they are djinns, 
I will get djinns that can outdjinn them."
search_str<-"djinn"
length( gregexpr("djinn",z)[[1]] )


#27

x<-"Lorem ipsum dolor sit amet consectetur 
adipiscing elit sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua"

gsub("[aeiou]","",x)

#28
# Count and sort cahracters with form the sentecne

song_1<-"Five little ducks went swimming one day 
Over the hills and far away 
Mother duck said, 'Quack, quack, quack, quack'
But only four little ducks came back
Old Mother Duck went out one day,
Over the hills and far away,
Mother Duck said 'Quack, quack, quack, quack
And all of those five little ducks came back."
Letters<-strsplit(song_1,split="")[[1]]
Letters<-Letters[-which(Letters %in% c(" ",".",",","'","\n") )]
data.frame( table( Letters ) ) %>% arrange(desc(Freq) )


#29
#Write a Python program to check if a string contains all letters of the alphabet
#and display what letters are present and what not 

x<-"Lorem ipsum dolor sit amet consectetur 
adipiscing elit sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua"

Letters<-tolower(strsplit(song_1,split="")[[1]])
Letters<-Letters[-which(Letters %in% c(" ",".",",","'","\n") )]
db1<-data.frame( table( Letters ) ) %>% arrange(desc(Freq) )
data.frame(letters,Count=db1$Freq[match(letters ,db1$Letters) ] )

#30
#Write programm to extract all $ digits form text
#decimal part of digir contains only 1 number
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


#31
#Write a
#Python program to count how many times words repreated in string.

q<-"I felt happy because I saw the others were happy and because
I knew I should feel happy, but I wasn't really happy"

words<-strsplit(q,split=" |,")[[1]]
data.frame(table(part_1))


#32
#replace word in consectetur to its reverse vertion
x<-"Lorem ipsum dolor sit amet consectetur 
adipiscing elit sed do eiusmod tempor incididunt ut
labore et dolore magna aliqua"

loc<-regexpr("consectetur",x)
n<-nchar("consecteur")
rev_version<-paste(rev( strsplit("consecteur", "")[[1]] ),collapse="")
substr(x,start=loc,stop=loc+n)<-rev_version
cat(x)


#33
#Write a Python program to compute sum of digits of a given string. 
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


#34
#Write a Python program to remove duplicate words from a given string


song_1<-"Five little ducks went swimming one day 
Over the hills and far away 
Mother duck said, 'Quack, quack, quack, quack'
But only four little ducks came back
Old Mother Duck went out one day,
Over the hills and far away,
Mother Duck said 'Quack, quack, quack, quack'
And all of those five little ducks came back."

words<-strsplit(song_1,split="\\W+")[[1]]
words_count<-data.frame(table(words)) %>% filter(Freq>1) %>%
             pull(words) %>% as.character()

for (i in length(words_count)) {
  gsub(words_count[i],"",song_1)
}




































