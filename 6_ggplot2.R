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

library(ggplot2)
library(dplyr)


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
to display data from 1955

ggplot(data=ts1,aes(x=Date_Full,y=Cust))+
  geom_line(col="red",size=1.5,linetype=1)+
  scale_x_date(name="Year/Month",date_label="%Y/%m",breaks = "12 month",
                       limits=as.Date(c("1955-1-1","1960-1-12") )    )









