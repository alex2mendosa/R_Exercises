#####################
https://www.geeksforgeeks.org/file-handling-in-r-programming/

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

list.files(r"(C:\Users\UACecetoAl\Desktop\STD_REPORTS)")

#5 Create in any folder 5 files with names
run the following command to create 10 files for exercises
in working directory
file.create( paste("File",sample(c("delete","keep","modify"),10,replace=TRUE),
        sample(1:10,10,replace=FALSE),sep="_") )
Notice that if we randomly creatre files with same name,
only unique would be displayed, hterefore sample(1:10,10,replace=FALSE)
is used to make all fiules names unique

list.files has pattern argument which allow to return 
files names whci meet certain criteria
Specify, expression to return files which contain 
delete word or odd number from 2 to 6
lile

list.files(path=r"(C:\Users\UACecetoAl\Desktop\R_Input)",
           pattern="delete|[2,4,6]+")


#6 Modify expresison above to retun absolute paths

list.files(path=r"(C:\Users\UACecetoAl\Desktop\R_Input)",
           pattern="delete|[2,4,6]+")
Why \\ are returned?
  
list.files(path=r"(C:\Users\UACecetoAl\Desktop\R_Input)",
             pattern="delete|[2,4,6]+",full.names=TRUE)  
  

#7 run the following command

file.create( paste("File","DELETE",10) )

list.files(path=r"(C:\Users\UACecetoAl\Desktop\R_Input)",
           pattern="delete|[2,4,6]+")

Wil lnot return File_DELETE_4.csv, modify 
ignore.case to return all names ingoring case
which fit our pattern
list.files(path=r"(C:\Users\UACecetoAl\Desktop\R_Input)",
           pattern="delete|[2,4,6]+",ignore.case = TRUE)


#8
file.choose() allows to choose file name interactively
Run file.choose(), which directory is initiated to 
select file

Next chanhe working dorectory
to the one you prefer and 
run file choose again 
setwd(r"(N:\Projects\1_SL_Dep_Reports)")
getwd()
file.choose()

file.choose() command now opens another directory
which we previously marked as working. 
which you can define with file.choose()



#9
after file is interactively selected 
r return is full name, whcih can be assignewd to
variable and later used in code to specify which file to use
f1_name<-file.choose()
read.csv(f1_name) % to upload data

use file.choose() to select file you prefer and srote the 
data in contains in variable variable_1




#10
use file.create() to create 3 files 
named Dummy_file with extensions csv,xlsx,txt
in wrokinf dorectiy

file.create("Dummy_file.csv")
file.create("Dummy_file.xlsx")
file.create("Dummy_file.Py")

##11
Run the following command to create
directory in working directiry
dir.create("Dymmy_Dir")
Modift  example from  ex 5 to create 20
files which randomly define names and file extentions
[txt, csv, xlsx]
Files shoulkd be created in Dymmy_Dir

file.create( paste("Dymmy_Dir/","File",sample(c("delete","keep","modify"),20,replace=TRUE),
                   sample(1:20,20,replace=FALSE),
                   sample(c(".txt",".csv",".xlsx"),20,replace=TRUE),
                   sep="_")   )
#if action is about ot be performed in working directir folder
# no need to estimate fool file path


#12

setwd(r"(C:\Users\UACecetoAl\Desktop\R_Input)")
In single expresion with
file.create(), create 2 files in working dorectory of
different  type

file.create("Dummy_file.csv","Dummy_file.xlsx")


##13
Use paste() fucntion to 
concatenate file patha nd file name to specify location 
of directory to which file should be created

file.create( paste(r"(C:\Users\UACecetoAl\Desktop\R_Input\1_Code Sample)","Dummy_file.csv",
                   sep="\\")  ) 

#14
Use file.create() fucntion to create 2 files ony any extention tou prefer in 
2 directries , ecxept workig direcitry

file.create( paste(r"(C:\Users\UACecetoAl\Desktop\R_Input)","Dummy_file.csv",sep="\\"),
             paste(r"(C:\Users\UACecetoAl\Desktop\R_Input\Dymmy_Dir)","Dummy_file.csv",sep="\\")
             ) 



#15
R wount crete 2 files with same name and extention in same 
directiry, check how many fileas are
generated by the following expresision:

file.create( paste("File",sample(c("delete","keep"),10,replace=TRUE),
                     sample(1:10,10,replace=TRUE),sep="_") )
  
#We specified 10 samples by lower number of files was generated
as no files with same and exrention are possible
  
  
#16

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



#15 file.create and file.exist  will produce 
warning message is we apply action to 
directiry we dont have access to

file.create( r"(N:\Projects\Reports\Dummt.csv)" ) #reason 'Permission denied'
file.exists( r"(N:\Projects\Reports\Dummt.csv)" )  # False




#16
file.remove() #attempts to remove the files named in its argument
# access to file shoukd be granted,
#by default file is checked in working directory
file.create("DUMMY.csv")
Use file.remove() to remove DUMMY.csv frow wd
file.remove("DUMMY.csv")
# be aware that file is deleted permanently, trash bin wont contain respectiver file

#16
Run the command 

file.create( paste("Dymmy_Dir/","File",sample(c("delete","keep","modify"),20,replace=TRUE),
                   sample(1:20,20,replace=FALSE),
                   sample(c(".txt",".csv",".xlsx"),20,replace=TRUE),
                   sep="_")   )
allows list.files with patterm
argumetn to specify expresisin to delete files whole name mathes 
regular expression,
Now delete all files with single 
file.remove() by adjustinf pattern argumetn in 
list.files(), notice you need to specify directory 
where files are located

setwd( r"(C:\Users\UACecetoAl\Desktop\R_Input\Dymmy_Dir)" )
getwd()
list.files( pattern="_File_delete_" )
file.remove(   list.files( pattern="_File_delete_" )      )


#17
Use file.remove to delete files in 2 comlately different direcotris
,except working directoty



#18
setwd( r"(C:\Users\UACecetoAl\Desktop\R_Input)"  )
getwd()

Run the code to perform the following, if DUMMY.csv
is present in workig directry, 
delete it, otherwise create it

if ( file.exists("Dummy.csv")==TRUE ) {
  file.remove("Dummy.csv")
 }  else { file.create("Dummy.csv") }

#19

#let us check if file.create  is case sensetive

file.create("Dummy.csv")
file.create("DuMmY.csv")
file.create("dummy.csv")
Only dsingle file is created, 
name is same as for first file.create("Dummy.csv"),
names generated by 
file.create("DuMmY.csv")
file.create("dummy.csv") are all treated 
as identical to Dummy

Therefore i is recommendet to 
separate the files by different bane not diffetent cases

#20

#let us check if file.create  is case sensetive

 
Therefore, file exist is not case sensetive, we need to adjust 
ingore.case argument
file.exists("Dummy.csv",ignore.case =TRUE)
file.exists("DUMMY.csv",ignore.case=TRUE)

# DummY.csv" and ignore.case = FALSE are both consifered as file names
#we cant supply ignore.case argument
#here how we can delete multiple files 
# Case-insensitive file systems are the norm on Windows and macOS

sample(   c( file.create("DuMmY.csv"), 
             file.create("Dummy.csv"),
             file.create("dummy.csv") ),1)
We randomly crete file with names diffrent by cases

Solution is to call for list.files
c("Dummy.csv","DuMmY.csv","dummy.csv") %in% list.files(ignore.case = FALSE)
Will indicate name whih exists ,
 therefore
file.remove(), file.create(), file.exists()
behave like case insensetive system.


#21
setwd( r"(C:\Users\UACecetoAl\Desktop\R_Input\Dymmy_Dir)" )
getwd()
file.create("I_Dont_like_my_name.csv")
file.create("Dummy_file_2.csv")
use file.rename() to rename
file, 2 arguemnt are required, 
first full path to the file with original name,
same path to the file with new name
file.rename(r"(C:\Users\UACecetoAl\Desktop\R_Input\Dymmy_Dir\I_Dont_like_my_name.csv)",
            r"(C:\Users\UACecetoAl\Desktop\R_Input\Dymmy_Dir\This_name_is_Better.csv)")
file.rename(r"(C:\Users\UACecetoAl\Desktop\R_Input\Dymmy_Dir\I_Dont_like_my_name.csv)",
            "This_name_is_Better.csv")
#second expression works if we are dealing with files in same directory,
#otherwise , full name specification is required



#22
setwd( r"(C:\Users\UACecetoAl\Desktop\R_Input\Dymmy_Dir)" )
file.create( paste("File",sample(c("delete","keep","modify"),20,replace=TRUE),
                   sample(1:20,20,replace=FALSE),
                   sample(c(".txt",".csv",".xlsx"),20,replace=TRUE),
                   sep="_")   )

Now rename of files whch contain "delete" to "Pending_Status",
list.files might be helpfull
Dont forget that files with same names are not possible in same direcotry

getwd()
list.files(pattern="delete")
file.rename( list.files(pattern="delete"),"Pending_Status"   )

we can try to loop thtrough
n<-length( list.files(pattern="delete") )
for (i in 1:n )  {
  file.rename( list.files(pattern="delete")[i], paste("Pending_Status",i,sep="_")     )
}
# will fail as list.files(pattern="delete")[i] depend on i
# and index of delete values which changes after each 
#file.rename execution

#while loop would be a better choice
n<-length( list.files(pattern="delete") )
i<-1
names_list<-list.files(pattern="delete")
while (i<=n)  {
  file.rename( names_list[i], paste("Pending_Status",i,sep="_")     )
  i<-i+1
}


#23
file.create("mtcars.csv")
write.csv(mtcars,"mtcars.csv")

Now use rename fucntion to change the extention of file 
from csv to txt
file.rename("mtcars.csv","mtcars.txt")


# 24
Asume path name
path_1<-r"(C:\Users\UACecetoAl\Desktop\R_Input\Dymmy_Dir\File_keep_19_.csv)"

Now use regexp to extract name of file

loc<-tail( gregexpr("\\\\",path_1)[[1]] ,1)+1
substr( path_1,loc,nchar(path_1) )


# 25
Asume path name
path_1<-r"(C:\Users\UACecetoAl\Desktop\R_Input\Dymmy_Dir\File_keep_19_.csv)"

Use
basename() to extract file name
basename(path_1)





