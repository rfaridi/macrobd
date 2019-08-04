# Selected economic indicators

file.list <- c("2019_june_statisticaltable.xlsx","statisticaltable_sep2017.xlsx", "statisticaltable_aug2016.xls", "statisticaltable_2014.xls","BB_sep9_2012.xls","statisticaltable_dec11.xls")



# Inflation 

TableIB.file.list <- c("2019_june_statisticaltable.xlsx","statisticaltable_sep2017.xlsx", "statisticaltable_aug2016.xls", "statisticaltable_2014.xls","BB_sep9_2012.xls")

TableIB.skiprow  <- c(15,21,39,27,25)
TableIB.maxrow  <- c(51,33,51,52,50)
inf.colsno <- c(1,2,3,4,5)
TableIB.yrs <- c("2018-19|2017-18"," "," ","2013-14","2011-12")
TableIB.startdate <- paste0(c(2016,2015,2014,2012,2010),"-july")
inf.varnames=c(month="Months",
inf_p2p_05="Point to point with base 2005-2006",
inf_p2p_95="Point to point with base 1995-96",
inf_12m_05="12-Month average base 2005-2006",
inf_12m_95="12-Month average base 1995-96")


inflation <- get_bb_dat(files=TableIB.file.list, sheet.name="Table IB",
                      skip.row=TableIB.skiprow,max.row=TableIB.maxrow,
                      cols=inf.colsno,yrs=TableIB.yrs,start.date=TableIB.startdate,
                      var.names=inf.varnames) 
  
use_data(inflation, overwrite=TRUE)

# Foreign Trade

ft.colsno <- c(1,11,12,13)
ft.varnames=c(month="Months",
exports="Exports",
imports="Import payments",
forex="Foreign exchange reserve")


foreign_trade.12.19 <- get_bb_dat(files=TableIB.file.list[-5], sheet.name="Table IB",
                      skip.row=TableIB.skiprow,max.row=TableIB.maxrow,
                      cols=ft.colsno,yrs=TableIB.yrs,start.date=TableIB.startdate,
                      var.names=ft.varnames) 


foreign_trade.10.12 <- get_bb_dat(files=TableIB.file.list[5], sheet.name="Table IB",
                      skip.row=TableIB.skiprow[5],max.row=TableIB.maxrow[5],
                      cols=c(1,11,12,14),yrs=TableIB.yrs[5],start.date=TableIB.startdate[5],
                      var.names=ft.varnames) 

foreign_trade  <- rbind(foreign_trade.10.12, foreign_trade.12.19)

use_data(foreign_trade, overwrite=TRUE)

# Exchange rate

er.colsno <- c(1,14,15)
er.varnames=c(month="Months",
per.avg="Period average",
end.period="End period")


exchange.rate.12.19 <- get_bb_dat(files=TableIB.file.list[-5], sheet.name="Table IB",
                      skip.row=TableIB.skiprow,max.row=TableIB.maxrow,
                      cols=er.colsno,yrs=TableIB.yrs,start.date=TableIB.startdate,
                      var.names=er.varnames) 

 exchange.rate.10.12 <- get_bb_dat(files=TableIB.file.list[5], sheet.name="Table IB",
                      skip.row=TableIB.skiprow[5],max.row=TableIB.maxrow[5],
                      cols=c(1,15,16),yrs=TableIB.yrs[5],start.date="2010-july",
                      var.names=er.varnames) 

exchange.rate  <- rbind(exchange.rate.10.12, exchange.rate.12.19)
use_data(exchange.rate, overwrite=TRUE)


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



