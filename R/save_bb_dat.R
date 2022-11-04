library(readxl)
library(dplyr)
library(zoo) 
library(lubridate)
library(janitor)

save_bb_dat <- function(path.name=NULL,
			s.sheet.name=NULL,
			s.skip.row=NULL,
			s.max.row=NULL,
			s.cols=NULL,
			s.yrs=NULL,
			s.start.date=NULL,
			s.var.names=NULL){
read.row <- s.max.row - s.skip.row
read.df <- read_excel(paste0("./data-raw/",path.name), 
		      sheet=s.sheet.name,
		      skip=s.skip.row,
		      n_max=read.row, 
		      col_names=FALSE) %>% 
                      remove_empty("cols") %>% 
		      remove_empty("rows") %>% 
                      select(all_of(unlist(s.cols)))

names(read.df)  <- names(s.var.names)

read.df.clean <- read.df %>% 
                filter(str_detect(month,"^((?!OB).)*$")) %>% 
                mutate(month=str_replace(month,"(.+)\\(.+","\\1"),
		       month=str_trim(month)) 

read.df2 <- read.df.clean %>% 
		    dplyr::filter(!str_detect(month,s.yrs)) 

date.zoo <- zoo::zooreg(1:nrow(read.df2),
			zoo::as.yearmon(s.start.date,
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



