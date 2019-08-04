data_save_bb <- function(path.name,sheet.name,skip.row,max.row,cols,yrs,start.date,var.names){
	   data_imp_bb(path.name=path.name,
	    sheet.name=sheet.name,
	    skip.row=skip.row,
	    max.row=max.row)  %>% 
       data_extract_bb(
		       cols=cols,
		       yrs=yrs,
		       start.date=start.date,
		       var.names=var.names)

}

data_save_bb2 <- function(path.name=NULL,sheet.name=NULL,skip.row=NULL,max.row=NULL,cols=NULL,yrs=NULL,start.date=NULL,var.names=NULL){
	   read.row <- max.row - skip.row
    read.df <- read_excel(path.name, sheet=sheet.name,skip=skip.row,n_max=read.row, col_names=FALSE)
    read.df.clean <- read.df %>% 
		janitor::remove_empty("cols") %>% 
		janitor::remove_empty("rows") %>% 
                select(cols) 
    names(read.df.clean)  <- names(var.names)
    read.df.clean <- read.df.clean %>% 
		    filter(!grepl(yrs,month)) 
    date.zoo <- zoo::zooreg(1:nrow(read.df.clean),zoo::as.yearmon(start.date,format="%Y-%B"),freq=12)
    new.df  <-  read.df.clean %>% 
		mutate(date=index(date.zoo),
		       date=as.Date(date)) %>% 
		select(-month) %>% 
		select(date,everything()) %>% 
		mutate_at(vars(-date),as.numeric)
    return(new.df)
}


