library(readxl)
library(dplyr)
library(zoo) 
library(lubridate)
library(janitor)
data_extract_bb  <- function(org.df,cols,yrs,start.date,var.names){
    new.df <- org.df %>% 
		select(cols) 
    names(new.df)  <- names(var.names)
    new.df <- new.df %>% 
		    filter(!grepl(yrs,month)) 
    date.zoo <- zoo::zooreg(1:nrow(new.df),zoo::as.yearmon(start.date,format="%Y-%B"),freq=12)
    new.df  <-  new.df %>% 
		mutate(date=index(date.zoo),
		       date=as.Date(date)) %>% 
		select(-month) %>% 
		select(date,everything())
    return(new.df)
}


