get_bb_dat  <- function(files=NULL,
			iter=NULL,
			g.sheetname=NULL,
			g.skiprow=NULL,
			g.maxrow=NULL,
			g.cols=NULL,
			g.yrs=NULL,
			g.startdate=NULL,
			g.varnames=NULL) {
    dat <- data.frame()
    for(i in iter) {
    print(paste0("Processing ", i, " file ",files[i])) 
    new.dat <- save_bb_dat(path.name=files[i],
	                   s.sheetname=g.sheetname[i],
			   s.skiprow=g.skiprow[i],
			   s.maxrow=g.maxrow[i],
	                   s.cols=g.cols[i],
			   s.yrs=g.yrs[i],
			   s.startdate=g.startdate[i],
			   s.varnames=g.varnames)
    dat <- rbind(new.dat,dat)
    }
return(dat)
}


