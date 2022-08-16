library(readxl)
library(dplyr)
library(zoo) 
library(lubridate)
library(janitor)

save_bb_dat <- function(path.name=NULL,sheet.name=NULL,skip.row=NULL,max.row=NULL,cols_no=NULL,yrs=NULL,start.date=NULL,var.names=NULL){
	   read.row <- max.row - skip.row
    read.df <- read_excel(path.name, sheet=sheet.name,skip=skip.row,n_max=read.row, col_names=FALSE)
    read.df.clean <- read.df %>% 
		janitor::remove_empty("cols") %>% 
		janitor::remove_empty("rows") %>% 
                dplyr::select(cols_no) 
    names(read.df.clean)  <- names(var.names)
    read.df.clean <- read.df.clean %>% 
		    dplyr::filter(!str_detect(month,yrs)) 
    date.zoo <- zoo::zooreg(1:nrow(read.df.clean),zoo::as.yearmon(start.date,format="%Y-%B"),freq=12)
    new.df  <-  read.df.clean %>% 
		mutate(date=index(date.zoo),
		       date=as_date(date)) %>% 
		dplyr::select(-month) %>% 
		dplyr::select(date,everything()) %>% 
		mutate_at(vars(-date),as.numeric)
    return(new.df)
}


