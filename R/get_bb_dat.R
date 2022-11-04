get_bb_dat  <- function(files=NULL,
			iter=NULL,
			g.sheet.name=NULL,
			g.skip.row=NULL,
			g.max.row=NULL,
			g.cols=NULL,
			g.yrs=NULL,
			g.start.date=NULL,
			g.var.names=NULL) {
    dat <- data.frame()
    for(i in 1:iter) {
    print(paste0("Processing ", i, " file ",files[i])) 
    new.dat <- save_bb_dat(path.name=files[i],
	                   s.sheet.name=g.sheet.name[i],
			   s.skip.row=g.skip.row[i],
			   s.max.row=g.max.row[i],
	                   s.cols=g.cols[i],
			   s.yrs=g.yrs[i],
			   s.start.date=g.start.date[i],
			   s.var.names=g.var.names)
    dat <- rbind(new.dat,dat)
    }
return(dat)
}


