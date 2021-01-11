#####################
1 Use getwd() function to check filepath to 
current working directory, what type of data
fcuntion returns? Notice
that / i sused as a directory separator

getwd()
typeof(getwd)

#####################
2 Use setwd() function set new working directory.
First specidy argumetn as characterm than 
use variable which refers to character.
  
setwd("C:\Users\UACecetoAl\Desktop\R_Input")
remember that R uses linux like forward slashes
, while windows uses backslashes or double backslashes

OSlution is the following, manually change backslashes
to forward slashes

setwd("C:/Users/UACecetoAl/Desktop/R_Input")

we can use gsub to format Windoes path, if
it was directly copied
gsub("\\","/","Users\UACecetoAl\Desktop\R_Input",fixed=TRUE )
is not approprate as backslashes in string is 
treated as escape symbol

To  to get it into a name vector you needed to double them all

gsub("\\","/","Users\\UACecetoAl\\Desktop\\R_Input",fixed=TRUE )
but again here we manually double backlashes

We need to solve the following , how to use
copied file path from Windows to appropriate format 
for setwd() format

file_path_1<-"C:\Users\UACecetoAl\Desktop\R_Input"
# is not appropriate, we need r expression 
We need to specify raw e string , which is possible
with later 4.0 R vertion
r"(C:\Users\UACecetoAl\Desktop\R_Input)"
will add double backslashes and it means we can 
apply gsub fucntion

setwd(r"(C:\Users\UACecetoAl\Desktop\R_Input)")






