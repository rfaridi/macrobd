library(readxl)
library(dplyr)
library(zoo) 
library(lubridate)
library(janitor)

save_bb_dat <- function(path.name=NULL,
			s.sheetname=NULL,
			s.skiprow=NULL,
			s.maxrow=NULL,
			s.cols=NULL,
			s.yrs=NULL,
			s.startdate=NULL,
			s.varnames=NULL){
read.row <- s.maxrow - s.skiprow
read.df <- read_excel(paste0("./data-raw/",path.name), 
		      sheet=s.sheetname,
		      skip=s.skiprow,
		      n_max=read.row, 
		      col_names=FALSE) %>% 
                      remove_empty("cols") %>% 
		      remove_empty("rows") %>% 
                      select(all_of(unlist(s.cols)))

names(read.df)  <- names(s.varnames)

read.df.clean <- read.df %>% 
                filter(str_detect(month,"^((?!OB).)*$")) %>% 
                mutate(month=str_replace(month,"(.+)\\(.+","\\1"),
		       month=str_trim(month)) 

read.df2 <- read.df.clean %>% 
		    dplyr::filter(!str_detect(month,s.yrs)) 

date.zoo <- zoo::zooreg(1:nrow(read.df2),
			zoo::as.yearmon(s.startdate,
					format="%Y-%B"),
			freq=12)

new.df  <-  read.df2 %>% 
		mutate(date=index(date.zoo),
		       date=as_date(date)) %>% 
		dplyr::select(-month) %>% 
		dplyr::relocate(date) %>% 
		mutate(across(-date,as.numeric))
    return(new.df)
}



