add_bb_dat  <- function(file.name=NULL,
			edata=NULL,
			sheet.name=NULL,
			skip.row=NULL,
			max.row=NULL,
			cols=NULL,
			yrs=NULL,
			start.date=NULL,
			var.names=NULL) {
    dat <- edata
    path <- paste0("./data-raw/",file.name)
    new.dat <- data_save_bb(path.name=path,
	     sheet.name,skip.row,max.row,
	     cols,yrs,start.date,var.names)
    dat <- rbind(new.dat,dat)
return(dat)
}


