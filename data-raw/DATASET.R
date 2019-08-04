# Selected economic indicators

file.list <- c("2019_june_statisticaltable.xlsx")#"statisticaltable_sep2017.xlsx", "statisticaltable_aug2016.xls","statisticaltable_2014.xls","BB_sep9_2012.xls","statisticaltable_dec11.xls")



# Inflation 

skiprow  <- c(15)
maxrow  <- c(51)
colsno <- c(1,2,3,4,5)
yrsrm <- c("2018-19|2017-18")
startdate <- paste0(2016,"-july")
varnames=c(month="Months",
inf_p2p_05="Point to point with base 2005-2006",
inf_p2p_95="Point to point with base 1995-96",
inf_12m_05="12-Month average base 2005-2006",
inf_12m_95="12-Month average base 1995-96")


inflation <- get_bb_dat(files=file.list, sheet.name="Table IB",
                      skip.row=skiprow,max.row=maxrow,
                      cols=colsno,yrs=yrsrm,start.date=startdate,
                      var.names=varnames) 
  
use_data(inflation, overwrite=TRUE)



# Deposits

skiprow  <- c(29,18,25,27,25,24)
maxrow  <- c(52,43,50,39,50,36)
colsno  <- c(1,9,10)
#begin=c("jul17","jul15","jul13","jul12", "jul10", "jul09")
#end=c("apr19","jun17","jun15","jun13","jun12","jun10")
yrsrm <- c("2018-19","2016-17","2014-15","2014","2011","2008")
startdate <- paste0(c(2017,2015,2013,2012,2010,2009),"-july")
varnames=c(month="Months",
dp.dd="Deposits with DMBs from demand deposits",
dp.td="Deposits with DMBs from time deposits")

deposit <- get_bb_dat(files=file.list, sheet.name="Table IA",
                      skip.row=skiprow,max.row=maxrow,
                      cols=colsno,yrs=yrsrm,start.date=startdate,
                      var.names=varnames) 
use_data(deposit, overwrite=TRUE)

# Narrow and broad money

mnames=c(month="Months",M1="Narrow money",M2="Broad money")

money <- data.frame()
for(i in 1:length(file.list)) {
print(paste0("This no ", i, " file is imported from ", start[i]))
path.file <- paste0("./data-raw/",file.list[i])
print(paste0("The file is ", path.file))
new.dat <- data_save_bb(path=path.file,
	     sheet="Table IA",
	     skip=skip[i],max=max[i],
	     begin=begin[i],end=end[i],
	     cols=c(1,14,15),
	     yrs=yrs[i],
	     start=start[i],
	     vnames=vnames)
money <- rbind(new.dat,deposit)
}

use_data(money, overwrite=TRUE)



