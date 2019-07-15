data_save_bb <- function(path,sheet,skip,max,begin,end,cols,yrs,start,vnames){
    #fname  <- noquote(paste("sei",begin,end,sep="."))
	   data_imp_bb(path.name=path,
	    sheet.name=sheet,
	    skip.row=skip,
	    max.row=max,
	    start.time=begin,
	    end.time=end) %>% 
#save(list=fname, file=paste0("./data/",fname,".rda"))
#print(paste(paste("sei",begin,end,sep="."), "has been saved"))
#fname2 <- paste("sei","vars",begin,end,sep=".")
#assign(paste("sei","var",begin,end,sep="."), 
       data_extract_bb(
		       cols=cols,
		       yrs=yrs,
		       start.date=start,
		       var.names=vnames)

#save(list=fname2, file=paste0("./data/",fname2,".rda"))
#print(paste(paste("sei","vars",begin,end,sep="."), "has been saved"))
}


