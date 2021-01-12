#####################
1 Use getwd() function to check filepath to 
current working directory, what type of data
fucntion returns? Notice
that "/" is used as a directory separator

getwd()
typeof(getwd)

#####################
2 Use setwd() function set new working directory.
First specify argument as character. For second task 
use variable which refers to character as argument.

setwd("C:\Users\UACecetoAl\Desktop\R_Input")
Remember that R uses linux like forward slashes
,while windows uses backslashes or double backslashes


text "C:\Users\UACecetoAl\Desktop\R_Input" is not possible
due to precence of escape character

It is also impossible to assgin it to variabe
file_path_1<-"C:\Users\UACecetoAl\Desktop\R_Input"

Solution is the following, manually change backslashes
to forward slashes

setwd("C:/Users/UACecetoAl/Desktop/R_Input")

We can use gsub() to format Windows pathif
it was directly copied from Windows Address bar
gsub("\\","/","Users\UACecetoAl\Desktop\R_Input",fixed=TRUE )
is not appropriate as backslashes in file path string is 
treated as escape symbol

To  get it into a name vector you needed to 
double backslashes them all

setwd("Users\\UACecetoAl\\Desktop\\R_Input")
but again, here we manually double backlashes

We need to solve the following , how to use
copied file path from Windows as input
for setwd() format,threrefore we need to specify
raw e string , which is possible
with later 4.0 R vertion
r"(C:\Users\UACecetoAl\Desktop\R_Input)"
will add double backslashes and it means we can 
apply gsub fucntion

setwd(r"(C:\Users\UACecetoAl\Desktop\R_Input\)")

What if directory does not exist
setwd(r"(C:\Users\UACecetoAl\Desktop\R_Input\Dummy_Dir)")
cannot change working directory is thrown

#3 
Run list.files() to generate list of files in 
current working directory
#
#4 
Run list.files() with part= argumetn
diferent from working directory

list.files(r"(N:\Projects\1_SL_Dep_Reports\1_TTS_2019_2020\TTS_Report_By_Business_FV_2020)")

#5 Create in any folder 5 files with names
File_delete_1.csv,
File_keep_2.csv,File_keep+_3.csv,File_delete_4.csv,File_keep_5.csv

list.files has pattern argument which allow to return 
files names whci meet certain criteria
Specify, expression to return files which contain 
+ or delete word
lile

list.files(path=r"(N:\Projects\1_SL_Dep_Reports)",
           pattern="delete|\\+")


#6 Modify expresison below to retun absolute paths

list.files(path=r"(N:\Projects\1_SL_Dep_Reports)",
           pattern="delete|\\+")
Why \\ are returned?

list.files(path=r"(N:\Projects\1_SL_Dep_Reports)",
           pattern="delete|\\+",full.names=TRUE)


#7 Create in any folder 5 files with names
File_delete_1.csv,
File_keep_2.csv,File_keep+_3.csv,File_DELETE_4.csv,File_keep_5.csv

list.files(path=r"(N:\Projects\1_SL_Dep_Reports)",
           pattern="delete|\\+")
Wil lnot return File_DELETE_4.csv, modify 
ignore.case to return all names ingoring case
list.files(path=r"(N:\Projects\1_SL_Dep_Reports)",
           pattern="delete|\\+",ignore.case = TRUE)

#8
file.choose() allows to choose file interactively
Run file.choose(), which directory is initiated to 
select file

Next chanhe working dorectory
to the one you prefer and 
run file choose again 
setwd(r"(N:\Projects\1_SL_Dep_Reports)")
getwd()
file.choose()

file.choose() command opens working directory


#9
after file is interactively selected 
r return is full name, whcih can be assignewd to
variable and later used in code
f1_name<-file.choose()
read.csv(f1_name)

use file.choose() to select file you prefer and srote the 
data in contains in variable variable_1


#10
use 
use file.create() to create 3 files 
named Dummy_file with extensions csv,xlsx,Py

file.create("Dummy_file.csv")
file.create("Dummy_file.xlsx")
file.create("Dummy_file.Py")

##
11
setwd(r"(C:\Users\UACecetoAl\Desktop\R_Input)")
In single expresion with
file.create(), create 2 files in working dorectory of
different  type

file.create("Dummy_file.csv","Dummy_file.xlsx")


##12
Use paste() fucntion to 
concatenate file patha nd file name to specify location 
of directory to which file should be created

file.create( paste(r"(C:\Users\UACecetoAl\Desktop\R_Input\1_Code Sample)","Dummy_file.csv",
                   sep="\\")  ) 

##13

file.exists()
# returns a logical vector indicating whether the files named by its argument exist
#answer can be given only for files for which access is grnated whoich can be
#verufued with file.aceess function
getwd()
file.exists("2_FRST_20_TT.csv")

##13
Check if 2 specific file exist in working direcotry

file.exists("2_FRST_20_TT.csv","1_IN_DataSW.csv")

##14
Check if 2 files exist in 2 different direcities nin of which is working
directiry

file.exists(r"(C:\Users\UACecetoAl\Desktop\Phone_Data\Calendar\8E6B3063.jpg)",
            r"(C:\Users\UACecetoAl\Desktop\cv\Keywords.docx)" )
# now manually write wrong name for any fiel and check how putput changes
file.exists(r"(C:\Users\UACecetoAl\Desktop\Phone_Data\Calendar\QQE6B3063.jpg)",
            r"(C:\Users\UACecetoAl\Desktop\cv\Keywords.docx)" )


#15
file.remove() #attempts to remove the files named in its argument
# access to file shoukd be granted,
#by default file is checked in working directory

Use file.remove() to remove DUMMY.csv frow wd


#16
Run the command 
file.create( paste(sample(1:5,1),"DUMMY.csv",sep="_")   )

Use  list.files() to delete file which contain 
Dummy in ints name, as full name is andom 

file.remove( list.files(pattern="DUMMY") )











