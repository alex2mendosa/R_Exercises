library(ggplot2)
library(dplyr)
library(tibble)

ts1<-AirPassengers %>% as_tibble() %>%
  mutate(Date_Full=seq.Date( as.Date("1949/1/1"),
                             as.Date("1960/12/1"),by="1 month"  ),
         Cust=as.numeric(x) ) %>% select(-x)


db2<-ToothGrowth %>% as_tibble()

db1<-as_tibble(mtcars,rownames = NA)
db1<-rownames_to_column(db1,var="Model")
db1["Manufacturer"]<-sapply(strsplit(db1$Model," "),
                            function(x) x[[1]]) 
db1<-select(db1,Manufacturer,everything())



#1
Use ggolot2 function 
geom_line() to visualise ts1 time series, set the color
of libe to blue, no other argumetns should be adjusted

ggplot(data=ts1,aes(x=Date_Full,y=Cust))+geom_line(col="red")

#2
modify 
ggplot(data=ts1,aes(x=Date_Full,y=Cust))+geom_line(col="red")
with scale_x_date to chage x label to "Year/Month" and
date label to "%Y/%m" format

ggplot(data=ts1,aes(x=Date_Full,y=Cust))+geom_line(col="red")+
  scale_x_date(name="Year/Month",date_label="%Y/%m")


#3
modify 
ggplot(data=ts1,aes(x=Date_Full,y=Cust))+geom_line(col="red")+
  scale_x_date(name="Year/Month",date_label="%Y/%m")
to display x label with 12 months breaks

ggplot(data=ts1,aes(x=Date_Full,y=Cust))+geom_line(col="red")+
  scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month")

#4
modify
ggplot(data=ts1,aes(x=Date_Full,y=Cust))+geom_line(col="red")+
  scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month")
to increase size to 1.5 of line and set linetype to dots

ggplot(data=ts1,aes(x=Date_Full,y=Cust))+geom_line(col="red",size=1.5,linetype=4)+
  scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month")


#5
modify
ggplot(data=ts1,aes(x=Date_Full,y=Cust))+geom_line(col="red",size=1.5,linetype=1)+
  scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month")
to display data from 1955, specify limit parameter for  scale_x_date

ggplot(data=ts1,aes(x=Date_Full,y=Cust))+
  geom_line(col="red",size=1.5,linetype=1)+
  scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month",
               limits=as.Date(c("1955-1-1","1960-1-12") )    )
alternatively, we can filter data in ggplot section

ggplot(data= filter(ts1,Date_Full>"1955-1-1") ,aes(x=Date_Full,y=Cust))+
  geom_line(col="red",size=1.5,linetype=1)+
  scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month" )   


#6
Modify 
ggplot(data= filter(ts1,Date_Full>"1955-1-1") ,aes(x=Date_Full,y=Cust))+
  geom_line(col="red",size=1.5,linetype=1)+
  scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month" ) 
with scale_y_continuous() to set name of labet to "Customers,ml" and 
10 labes 
ggplot(data= filter(ts1,Date_Full>"1955-1-1") ,aes(x=Date_Full,y=Cust))+
  geom_line(col="red",size=1.5,linetype=1)+
  scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month" ) +
  scale_y_continuous(name="Customers,ml",n.breaks = 10  )


#7
Modify 
ggplot(data= filter(ts1,Date_Full>"1955-1-1") ,aes(x=Date_Full,y=Cust))+
  geom_line(col="red",size=1.5,linetype=1)+
  scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month" ) +
  scale_y_continuous(name="Customers,ml",n.breaks = 10  )
to add title to plot, "Monthly Airline Passenger Numbers",
and subtitles "1949-1960"

ggplot(data= filter(ts1,Date_Full>"1955-1-1") ,aes(x=Date_Full,y=Cust))+
  geom_line(col="red",size=1.5,linetype=1)+
  scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month" ) +
  scale_y_continuous(name="Customers,ml",n.breaks = 10  )+
  ggtitle("Monthly Airline Passenger Numbers",subtitle = "1949-1960")



#8
we modity ts1 with synthetic additional time line
ts2<-ts1 %>% mutate(Dummy=Cust*(1+sample(seq(0,0.15,by=0.01),1) ))

Modify
ggplot(data= filter(ts2,Date_Full>"1955-1-1") ,aes(x=Date_Full,y=Cust))+
  geom_line(col="red",size=1.5,linetype=1)+
  scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month" ) +
  scale_y_continuous(name="Customers,ml",n.breaks = 10  )+
  ggtitle("Monthly Airline Passenger Numbers",subtitle = "1949-1960")

To add second line of color blue and width equal to 1.5
ggplot(data= filter(ts2,Date_Full>"1955-1-1") ,aes(x=Date_Full,y=Cust))+
  geom_line(col="red",size=1.5,linetype=1)+
  geom_line(aes(y=Dummy),color="blue",size=1.5)+
  scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month" ) +
  scale_y_continuous(name="Customers,ml",n.breaks = 10  )+
  ggtitle("Monthly Airline Passenger Numbers",subtitle = "1949-1960")

geom_line(aes(y=Dummy) inherits x labels and we are able to plot 2 lines
          
          
          #9
          ts2<-ts1 %>% mutate(Dummy=Cust*(1+sample(seq(0,0.15,by=0.01),1) ))
          
          
          odify wtih geom_vline() to add verical lines to dates
          "1956-01-01" "1958-10-01" "1959-12-01"    
          first identify indices of respective values in 
          loc<-which(as.character(ts2$Date_Full) %in% c("1956-01-01","1958-10-01","1959-12-01"))
          
          ggplot(data= filter(ts2,Date_Full>"1955-1-1") ,aes(x=Date_Full,y=Cust))+
            geom_line(col="red",size=1.5,linetype=1)+
            geom_line(aes(y=Dummy),color="blue",size=1.5)+
            scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month" ) +
            scale_y_continuous(name="Customers,ml",n.breaks = 10  )+
            ggtitle("Monthly Airline Passenger Numbers",subtitle = "1949-1960")+
            geom_vline( xintercept = as.numeric(ts2$Date_Full[loc]),colour = "red",linetype = "dashed"  )
          
          when dealing with axis x with dates, we need to convert
          xintercept arguments to numeric
          
          
          #10    
          Use geom_point() to illustate relation between mpg and hp, 
          where hp is on the x axis
          Set color of poins to red and size of point to 5
          Use ggtitle to set name of plot to "hp VS mpg"
          
          ggplot(data=db1,aes(x=hp,y=mpg)) + geom_point(col="red",cex=5)+
            ggtitle("hp VS mpg")
          
          
          
          #11
          Modify 
          ggplot(data=db1,aes(x=hp,y=mpg)) + geom_point(col="red",cex=5)+
            ggtitle("hp VS mpg") 
          to set numer of labales on x and y  axis to 10, use scale_x_continuous,
          also set axis names to upper case
          
          ggplot(data=db1,aes(x=hp,y=mpg)) + geom_point(col="red",cex=5)+
            ggtitle("hp VS mpg") + scale_x_continuous(name="HP",n.breaks = 10) +
            scale_y_continuous(name="MPG",n.breaks = 10)
          
          
          #12
          modify aes argument in  geom_point() to relate color of point 
          to car manufacturer
          
          ggplot(data=db1,aes(x=hp,y=mpg)) + geom_point(cex=5,aes(col=Manufacturer))+
            ggtitle("hp VS mpg") + scale_x_continuous(name="HP",n.breaks = 10) +
            scale_y_continuous(name="MPG",n.breaks = 10)    
          
          #13
          Modify 
          ggplot(data=db1,aes(x=hp,y=mpg)) + geom_point(cex=5,aes(col=Manufacturer))+
            ggtitle("hp VS mpg") + scale_x_continuous(name="HP",n.breaks = 10) +
            scale_y_continuous(name="MPG",n.breaks = 10)    
          
          to display only Mercedes and Mazda and Hornet
          ggplot(data= filter(db1,Manufacturer %in% c("Mazda","Merc","Hornet") ) ,aes(x=hp,y=mpg)) + 
            geom_point(cex=5,aes(col=Manufacturer))+
            ggtitle("hp VS mpg") + scale_x_continuous(name="HP",n.breaks = 10) +
            scale_y_continuous(name="MPG",n.breaks = 10)   
          
          
          #14
          Modify 
          ggplot(data=db1,aes(x=hp,y=mpg)) + geom_point(cex=5,aes(col=Manufacturer))+
            ggtitle("hp VS mpg") + scale_x_continuous(name="HP",n.breaks = 10) +
            scale_y_continuous(name="MPG",n.breaks = 10)   
          to add color only for Mercedes
          
          ggplot(data=db1,aes(x=hp,y=mpg)) + geom_point(cex=5)+
            geom_point(data=filter(db1,Manufacturer=="Merc"),aes(x=hp,y=mpg,col=Manufacturer),cex=5)+
            ggtitle("hp VS mpg") + scale_x_continuous(name="HP",n.breaks = 10) +
            scale_y_continuous(name="MPG",n.breaks = 10)+ labs(fill = "Dose (mg)")
          
          #15
          creta graph geom_point() to relate size of point to 
          hp values, set color of all points  to green
          
          ggplot(data=db1,aes(x=hp,y=mpg)) + geom_point(aes(size=hp),color="green")+
            ggtitle("hp VS mpg") + scale_x_continuous(name="HP",n.breaks = 10) +
            scale_y_continuous(name="MPG",n.breaks = 10)    
          
          
          #16
          Modify
          ggplot(data=db1,aes(x=hp,y=mpg)) + geom_point(aes(size=hp),color="blue")+
            ggtitle("hp VS mpg") + scale_x_continuous(name="HP",n.breaks = 10) +
            scale_y_continuous(name="MPG",n.breaks = 10)  to 
          add geom_smooth which fitl Simple lenear regression to data
          
          ggplot(data=db1,aes(x=hp,y=mpg)) + geom_point(aes(size=hp),color="blue")+
            ggtitle("hp VS mpg") + scale_x_continuous(name="HP",n.breaks = 10) +
            scale_y_continuous(name="MPG",n.breaks = 10) +
            geom_smooth(method="lm",col="red")
          
          
          #17
          Modify
          ggplot(data=db1,aes(x=hp,y=mpg)) + geom_point(aes(size=hp),color="blue")+
            ggtitle("hp VS mpg") + scale_x_continuous(name="HP",n.breaks = 10) +
            scale_y_continuous(name="MPG",n.breaks = 10)  to 
          add geom_smooth which fitl Lowess to data, remove Confidence
          interval from fitted line
          
          ggplot(data=db1,aes(x=hp,y=mpg)) + geom_point(aes(size=hp),color="blue")+
            ggtitle("hp VS mpg") + scale_x_continuous(name="HP",n.breaks = 10) +
            scale_y_continuous(name="MPG",n.breaks = 10) +
            geom_smooth(method="loess",se=FALSE,col="red",cex=2)
          
          
#18          
Use mpg dataset
str(mpg)
to genereate geom_point with class 
of x axis and cty milage as on y axis,  
change size of x labels via there
theme parameter and axis.text argument,
relate size of point to cty values

ggplot(data=mpg,aes(x=class,y=cty)) + 
      geom_point(aes(size=cty),color="blue")+
      theme(axis.text.x=element_text(size=10),
            axis.text.y=element_text(size=10))
          
#19


          
          
          
          
          