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
    path <- paste0("./data-raw/",files[i])
    print(paste0("The path of  file is ", path))
    new.dat <- save_bb_dat(path.name=path,
	     sheet.name,skip.row[i],max.row[i],
	     cols_no=cols,yrs[i],start.date[i],var.names)
    dat <- rbind(new.dat,dat)
    }
return(dat)
}


