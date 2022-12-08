#------------ Table IIA --------------
library(janitor)
library(readxl)
library(zoo)
library(lubridate)

path.name <- TableIIB.file.list[6]
s.maxrow  <- TableIIB.maxrow[6]
s.skiprow  <- TableIIB.skiprow[6]
s.yrs  <- TableIIB.yrs[6]
s.startdate <- TableIIB.startdate[6] 
s.sheetname  <- TableIIB.sheetname[6]
s.varnames <- TableIIB.varnames
s.cols <- TableIIB.colsno[6]

read.row <- s.maxrow - s.skiprow

read.df <- read_excel(paste0("./data-raw/",path.name), 
		      sheet=s.sheetname,
		      skip=s.skiprow,
		      n_max=read.row, 
		      col_names=FALSE) %>% 
                     remove_empty("cols") %>% 
		     remove_empty("rows")  %>% 
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






#------------ Table IIA --------------

library(janitor)
library(readxl)
library(zoo)
library(lubridate)

path.name <- TableIIA.file.list[6]
s.maxrow  <- TableIIA.maxrow[6]
s.skiprow  <- TableIIA.skiprow[6]
s.yrs  <- TableIIA.yrs[6]
s.startdate <- TableIIA.startdate[6] 
s.sheetname  <- TableIIA.sheetname[6]
s.varnames <- TableIIA.varnames
s.cols <- TableIIA.colsno[6]

read.row <- s.maxrow - s.skiprow

read.df <- read_excel(paste0("./data-raw/",path.name), 
		      sheet=s.sheetname,
		      skip=s.skiprow,
		      n_max=read.row, 
		      col_names=FALSE) %>% 
                     remove_empty("cols") %>% 
		     remove_empty("rows")  %>% 
                     select(all_of(unlist(s.cols)))




#------------ Table IA --------------
library(janitor)
library(readxl)
library(zoo)
library(lubridate)

path.name <- TableIIA.file.list[5]
s.maxrow  <- TableIIA.maxrow[5]
s.skiprow  <- TableIIA.skiprow[5]
s.yrs  <- TableIIA.yrs[5]
s.startdate <- TableIIA.startdate[5] 
s.sheetname  <- TableIIA.sheetname[5]
s.varnames <- TableIIA.varnames
s.cols <- TableIIA.colsno[5]

read.row <- s.maxrow - s.skiprow

read.df <- read_excel(paste0("./data-raw/",path.name), 
		      sheet=s.sheetname,
		      skip=s.skiprow,
		      n_max=read.row, 
		      col_names=FALSE) %>% 
                     remove_empty("cols") %>% 
		     remove_empty("rows")  %>% 
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




#------------ Table IA --------------

library(janitor)
library(readxl)
library(zoo)
library(lubridate)

path.name <- TableIIA.file.list[1]
s.maxrow  <- TableIIA.maxrow[1]
s.skiprow  <- TableIIA.skiprow[1]
s.yrs  <- TableIIA.yrs[1]
s.startdate <- TableIIA.startdate[1] 
s.sheetname  <- TableIIA.sheetname[1]
s.varnames <- TableIIA.varnames
s.cols <- TableIIA.colsno[1]

read.row <- s.maxrow - s.skiprow

read.df <- read_excel(paste0("./data-raw/",path.name), 
		      sheet=s.sheetname,
		      skip=s.skiprow,
		      n_max=read.row, 
		      col_names=FALSE) %>% 
                     remove_empty("cols") %>% 
		     remove_empty("rows")  %>% 
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



#------------ Table IV --------------
library(janitor)
library(readxl)
library(zoo)
library(lubridate)

path.name <- TableIIA.file.list[6]
s.max.row  <- TableIIA.maxrow[6]
s.skip.row  <- TableIIA.skiprow[6]
s.yrs  <- TableIIA.yrs[6]
s.start.date <- TableIIA.startdate[6] 
s.sheet.name  <- TableIIA.sheetname[6]
s.var.names <- TableIIA.varnames
s.cols <- TableIIA.colsno[6]

read.row <- s.max.row - s.skip.row

read.df <- read_excel(paste0("./data-raw/",path.name), 
		      sheet=s.sheet.name,
		      skip=s.skip.row,
		      n_max=read.row, 
		      col_names=FALSE) %>% 
                     remove_empty("cols") %>% 
		     remove_empty("rows")
		 %>% 
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


#-------- Table IB -----


path.name <- TableIB.file.list[1]
s.max.row  <- TableIB.maxrow[1]
s.skip.row  <- TableIB.skiprow[1]
s.yrs  <- TableIB.yrs[1]
s.start.date <- TableIB.startdate[1] 
s.sheet.name  <- TableIB.sheet.name[1]
s.var.names <- TableIB.varnames
s.cols <- TableIB.colsno[1]

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
		dplyr::select(date,everything()) %>% 
		mutate(across(-date,as.numeric))
    return(new.df)




get_bb_dat  <- function(files=NULL,
			iter=NULL,
			g.sheet.name=NULL,
			g.skip.row=NULL,
			g.max.row=NULL,
			g.cols_no=NULL,
			g.yrs=NULL,
			g.start.date=NULL,
			g.var.names=NULL) {

iter=length(TableVIII.file.list[1])
    dat <- data.frame()
    for(i in 1:iter) {
print(paste0("This no ", i, " file")) 
    #path <- paste0("./data-raw/",files[i])
    #print(paste0("The path of  file is ", path))
    new.dat <- save_bb_dat(path.name=files[i],
	                   s.sheet.name=g.sheet.name[i],
	                   s.skip.row=g.skip.row[i],
			   s.max.row=g.max.row[i],
	                   s.cols_no=g.cols_no,
			   s.yrs=g.yrs[i],
			   s.start_date=g.start.date[i],
			   s.var.names=g.var.names)
    dat <- rbind(new.dat,dat)
    }
return(dat)
infDet <- get_bb_dat( iter=length(TableVIII.file.list),
                      files=TableVIII.file.list,
			sheet.name= TableVIII.sheet.name,
			skip.row=TableVIII.skiprow,
			max.row=TableVIII.maxrow,
			yrs=TableVIII.infDet.yrs,
			start.date=TableVIII.startdate,
			cols=TableVIII.infDet.colsno,
			var.names=TableVIII.infDet.varnames)  %>% 
                       arrange(date)


iter=length(TableVIII.file.list)
    dat <- data.frame()
    for(i in 1:iter) {
i=1
print(paste0("This no ", i, " file")) 
# save_bb_dat starts now
save_bb_dat <- function(path.name=files[i],
			sheet.name=NULL,
			skip.row=NULL,
			max.row=NULL,
			cols_no=NULL,
			yrs=NULL,
			start.date=NULL,
			var.names=NULL){

read.row <- max.row - skip.row
read.df <- read_excel(paste0("./data-raw/",path.name), 
		      sheet=sheet.name,
		      skip=skip.row,
		      n_max=read.row, 
		      col_names=FALSE)
names(read.df)  <- names(var.names)
read.df.clean <- read.df %>% 
                filter(str_detect(month,"^((?!OB).)*$")) %>% 
                mutate(month=str_replace(month,"(.+)\\(.+","\\1"),
		       month=str_trim(month)) %>%  
		remove_empty("cols") %>% 
		remove_empty("rows") %>% 
                select(cols_no) 
read.df2 <- read.df.clean %>% 
		    dplyr::filter(!str_detect(month,yrs)) 
date.zoo <- zoo::zooreg(1:nrow(read.df2),
			zoo::as.yearmon(start.date,format="%Y-%B"),freq=12)
new.df  <-  read.df2 %>% 
		mutate(date=index(date.zoo),
		       date=as_date(date)) %>% 
		dplyr::select(-month) %>% 
		dplyr::select(date,everything()) %>% 
		mutate(across(-date,as.numeric))
return(df)
    }
}
get_bb_dat  <- function(files=NULL,
			iter=NULL,
			sheet.name=NULL,
			skip.row=NULL,
			max.row=NULL,
			cols=NULL,
			yrs=NULL,
			start.date=NULL,
			var.names=NULL) {
    dat <- data.frame()
    for(i in 1:iter) {
    print(paste0("This no ", i, " file")) 
    #path <- paste0("./data-raw/",files[i])
    #print(paste0("The path of  file is ", path))
    new.dat <- save_bb_dat(path.name=files[i],
	     sheet.name,skip.row[i],max.row[i],
	     cols_no=cols,yrs[i],start.date[i],var.names)
    dat <- rbind(new.dat,dat)
    }
return(dat)
}



save_bb_dat <- function(path.name=NULL,
			sheet.name=NULL,
			skip.row=NULL,
			max.row=NULL,
			cols_no=NULL,
			yrs=NULL,
			start.date=NULL,
			var.names=NULL){

read.row <- TableVIII.maxrow.nov14 - TableVIII.skiprow.nov14

			sheet.name= TableVIII.sheet.name,
			skip.row=TableVIII.skiprow,
			max.row=TableVIII.maxrow,
			yrs=TableVIII.yrs,
			start.date=TableVIII.startdate,
			cols=TableVIII.inf.colsno,
			var.names=TableVIII.inf.varnames

read.df <- read_excel(paste0("./data-raw/","2014_nov_econIndBB.xls"), 
		      sheet=TableVIII.sheet.name,
		      skip=TableVIII.skiprow.nov14,
		      n_max=read.row, 
		      col_names=FALSE)

read.df.clean <- read.df %>% 
		janitor::remove_empty("cols") %>% 
		janitor::remove_empty("rows") 
                dplyr::select(all_of(TableVIII.infDet.colsno))

names(read.df.clean)  <- names(TableVIII.infDet.varnames)

read.df2  <- read.df.clean %>% 
                        mutate(base=str_extract(period,"OB|NB"),
			       period=str_replace(period,"(.+)\\(.+","\\1"),
			       period=str_trim(period)) %>% 
			relocate(period,base) %>% 
			filter(base=="NB") %>% 
			select(-base)

read.df2  <- read.df.clean %>% 
                        filter(str_detect(period,"NB")) %>% 
                        mutate(period=str_replace(period,"(.+)\\(.+","\\1"),
			       period=str_trim(period)) 




read.df2 %>% 
    pivot_wider(period,
		names_from=base, 
		values_from=-c(period,base)) 



read.df.clean <- read.df2 %>% 
		    dplyr::filter(!str_detect(period," ")) 
start.date="2012-jul"
date.zoo <- zoo::zooreg(1:nrow(read.df.clean),zoo::as.yearmon(start.date,format="%Y-%B"),freq=12)
new.df  <-  read.df.clean %>% 
		mutate(date=index(date.zoo),
		       date=as_date(date)) %>% 
		dplyr::select(-period) %>% 
		dplyr::relocate(date) %>% 
		mutate_at(vars(-date),as.numeric)
    return(new.df)
}


save_bb_dat <- function(path.name=NULL,
			sheet.name=NULL,
			skip.row=NULL,
			max.row=NULL,
			cols_no=NULL,
			yrs=NULL,
			start.date=NULL,
			var.names=NULL){

read.row <- TableIB.maxrow[1] - TableIB.skiprow[1]

			sheet.name= TableIB.sheet.name,
			skip.row=TableIB.skiprow,
			max.row=TableIB.maxrow,
			yrs=TableIB.yrs,
			start.date=TableIB.startdate,
			cols=TableIB.inf.colsno,
			var.names=TableIB.inf.varnames

read.df <- read_excel(paste0("./data-raw/",TableIB.file.list[1]), 
		      sheet=TableIB.sheet.name,
		      skip=TableIB.skiprow[1],
		      n_max=read.row, 
		      col_names=FALSE)

read.df.clean <- read.df %>% 
		janitor::remove_empty("cols") %>% 
		janitor::remove_empty("rows") %>% 
                dplyr::select(all_of(2:16)) 

names(read.df.clean)  <- names(TableIB.varnames)

read.df.clean <- read.df.clean %>% 
		    dplyr::filter(!str_detect(month,TableIB.yrs[1])) 
date.zoo <- zoo::zooreg(1:nrow(read.df.clean),zoo::as.yearmon(TableIB.startdate[1],format="%Y-%B"),freq=12)
new.df  <-  read.df.clean %>% 
		mutate(date=index(date.zoo),
		       date=as_date(date)) %>% 
		dplyr::select(-month) %>% 
		dplyr::select(date,everything()) %>% 
		mutate_at(vars(-date),as.numeric)
    return(new.df)
}

infDet <- get_bb_dat(files=TableVIII.file.list, 
			iter=length(TableVIII.file.list),
			sheet.name= TableVIII.sheet.name,
			skip.row=TableVIII.skiprow,
			max.row=TableVIII.maxrow,
			yrs=TableVIII.infDet.yrs,
			start.date=TableVIII.startdate,
			cols=TableVIII.infDet.colsno,
			var.names=TableVIII.infDet.varnames)  %>% 
                       arrange(date)

get_bb_dat  <- function(files=NULL,
			iter=NULL,
			sheet.name=NULL,
			skip.row=NULL,
			max.row=NULL,
			cols=NULL,
			yrs=NULL,
			start.date=NULL,
			var.names=NULL) {
iter=length(TableVIII.file.list[1])
    dat <- data.frame()
    for(i in 1:iter) {
    print(paste0("This no ", i, " file")) 
    #path <- paste0("./data-raw/",files[i])
    #print(paste0("The path of  file is ", path))
    new.dat <- save_bb_dat(path.name=files[i],
	     sheet.name,skip.row[i],max.row[i],
	     cols_no=cols,yrs[i],start.date[i],var.names)
    dat <- rbind(new.dat,dat)
    }
return(dat)
}

