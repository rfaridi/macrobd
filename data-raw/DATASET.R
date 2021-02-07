# Selected economic indicators

file.list <- c("statisticaltable_feb_2021.xlsx","2019_june_statisticaltable.xlsx",
	       "statisticaltable_sep2017.xlsx", "statisticaltable_aug2016.xls", 
	       "statisticaltable_2014.xls","BB_sep9_2012.xls","statisticaltable_dec11.xls")

# Inflation 

TableIB.file.list <- c("statisticaltable_feb_2021.xlsx","2019_june_statisticaltable.xlsx","statisticaltable_sep2017.xlsx", "statisticaltable_aug2016.xls", "statisticaltable_2014.xls","BB_sep9_2012.xls")

TableIB.skiprow  <- c(38,15,21,39,27,25)
TableIB.maxrow  <- c(55,51,33,51,52,50)
inf.colsno <- c(1,2,3,4,5)
TableIB.yrs <- c("2019|2020","2018-19|2017-18"," "," ","2013-14","2011-12")
TableIB.startdate <- c("2019-may",paste0(c(2016,2015,2014,2012,2010),"-july"))
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


data_save_bb("./data-raw/statisticaltable_feb_2021.xlsx", sheet.name="Table IA", skip.row=38, max.row=55,cols_no=c(1,2,3,4,5),yrs="2019|2020",start.date="2019-may", var.names=c(month="Months",inf_p2p_05="Point to point with base 2005-2006",inf_p2p_95="Point to point with base 1995-96",inf_12m_05="12-Month average base 2005-2006",inf_12m_95="12-Month average base 1995-96"))


# Foreign Trade

ft.colsno <- c(1,11,12,13)
ft.varnames=c(month="Months",
exports="Exports",
imports="Import payments",
forex="Foreign exchange reserve")

no.files <- length(TableIB.file.list)

foreign_trade.12.19 <- get_bb_dat(files=TableIB.file.list[-no.files], sheet.name="Table IB",
                      skip.row=TableIB.skiprow,max.row=TableIB.maxrow,
                      cols=ft.colsno,yrs=TableIB.yrs,start.date=TableIB.startdate,
                      var.names=ft.varnames) 


foreign_trade.10.12 <- get_bb_dat(files=TableIB.file.list[no.files], sheet.name="Table IB",
                      skip.row=TableIB.skiprow[no.files],max.row=TableIB.maxrow[no.files],
                      cols=c(1,11,12,14),yrs=TableIB.yrs[no.files],start.date=TableIB.startdate[no.files],
                      var.names=ft.varnames) 

foreign_trade  <- rbind(foreign_trade.10.12, foreign_trade.12.19)

use_data(foreign_trade, overwrite=TRUE)

# Exchange rate

er.colsno <- c(1,14,15)
er.varnames=c(month="Months",
per.avg="Period average",
end.period="End period")


exchange.rate.12.19 <- get_bb_dat(files=TableIB.file.list[-no.files], sheet.name="Table IB",
                      skip.row=TableIB.skiprow,max.row=TableIB.maxrow,
                      cols=er.colsno,yrs=TableIB.yrs,start.date=TableIB.startdate,
                      var.names=er.varnames) 

 exchange.rate.10.12 <- get_bb_dat(files=TableIB.file.list[no.files], sheet.name="Table IB",
                      skip.row=TableIB.skiprow[no.files],max.row=TableIB.maxrow[no.files],
                      cols=c(1,15,16),yrs=TableIB.yrs[no.files],start.date="2010-july",
                      var.names=er.varnames) 

exchange.rate  <- rbind(exchange.rate.10.12, exchange.rate.12.19)
use_data(exchange.rate, overwrite=TRUE)


# Deposits

tableIA.skiprow  <- c(38,29,18,25,27,25,24)
tableIA.maxrow  <- c(53,52,43,50,39,50,36)
deposit.colsno  <- c(1,9,10)
#begin=c("jul17","jul15","jul13","jul12", "jul10", "jul09")
#end=c("apr19","jun17","jun15","jun13","jun12","jun10")
yrsrm <- c("2019-20","2018-19","2016-17","2014-15","2014","2011","2008")
startdate <- c("2019-may",paste0(c(2017,2015,2013,2012,2010,2009),"-july"))
depost.varnames=c(month="Months",
dp.dd="Deposits with DMBs from demand deposits",
dp.td="Deposits with DMBs from time deposits")

deposit <- get_bb_dat(files=file.list, sheet.name="Table IA",
                      skip.row=tableIA.skiprow,max.row=tableIA.maxrow,
                      cols=deposit.colsno,yrs=yrsrm,start.date=startdate,
                      var.names=deposit.varnames) 
use_data(deposit, overwrite=TRUE)

# Narrow and broad money

cols_money <- c(1,14,15)

mnames=c(month="Months",M1="Narrow money",M2="Broad money")

money <- get_bb_dat(files=file.list, sheet.name="Table IA",
                      skip.row=tableIA.skiprow,max.row=tableIA.maxrow,
                      cols=cols_money,yrs=yrsrm,start.date=startdate,
                      var.names=mnames) 

use_data(money, overwrite=TRUE)

# Interest rate

cols.int.rate <- c(1,68:73)[-3]

var.int.rate=c(month="Months",bank_rate="Bank rate", scheduled_deposit_rate="Deposits interest rate of Scheduled banks", scheduled_adv_rate="Advances interest rate of Scheduled banks", nbfi_deposit_rate="Deposits interest rate of NBFIs",nbfi_adv_rate="Advances interest rate of NBFIs")

interest_rate1 <- get_bb_dat(files=file.list[1:5], sheet.name="Table IA",
                      skip.row=tableIA.skiprow,max.row=tableIA.maxrow,
                      cols=cols.int.rate,yrs=yrsrm,start.date=startdate,
                      var.names=var.int.rate) 

interest_rate2 <- get_bb_dat(files=file.list[6:7], sheet.name="Table IA",
                      skip.row=tableIA.skiprow[6:7],max.row=tableIA.maxrow[6:7],
                      cols=c(1,68:70),yrs=yrsrm[6:7],start.date=startdate[6:7],
                      var.names=var.int.rate[1:4]) 

interest_rate <- bind_rows(interest_rate2, interest_rate1)

use_data(interest_rate, overwrite=TRUE)

