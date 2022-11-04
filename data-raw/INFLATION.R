# Selected economic indicators
library(tidyverse)

file.list <- c("2012_sep_econIndBB.xls",
	       "2014_nov_econIndBB.xls", 
	       "2016_aug_econIndBB.xls",
	       "2017_sep_econIndBB.xlsx",
	       "2020_aug_econIndBB.xlsx",
	       "2022_june_econIndBB.xlsx")

#--------------- Inflation --------------
TableIB.file.list <- file.list
# this is required since we are not using the whole list
TableIB.file.list  <- TableIB.file.list[1:6]
#----------------------------------------

#---------  2012-sep ------------
TableIB.skiprow.sep12 <- 25 
TableIB.maxrow.sep12  <- 50
TableIB.yrs.sep12 <- "2011"
TableIB.startdate.sep12  <- "2010-jul"

#---------  2014-nov ------------
TableIB.skiprow.nov14 <- 27 
TableIB.maxrow.nov14  <- 39
TableIB.yrs.nov14 <- " "
TableIB.startdate.nov14  <- "2012-jul"

#---------  2016-aug ------------
TableIB.skiprow.aug16 <- 26 
TableIB.maxrow.aug16  <- 51
TableIB.yrs.aug16 <- "2014"
TableIB.startdate.aug16  <- "2013-jul"


#---------  2017-sep ------------
TableIB.skiprow.sep17 <- 20 
TableIB.maxrow.sep17 <- 45 
TableIB.yrs.sep17 <- "2016"
TableIB.startdate.sep17  <- "2015-jul"

#---------  2020-aug ------------
TableIB.skiprow.aug20 <- 15 
TableIB.maxrow.aug20 <- 40 
TableIB.yrs.aug20 <- "2018|2019|2020"
TableIB.startdate.aug20  <- "2017-jul"


#--------- 2022-june ------------
TableIB.skiprow.june22 <- 17 
TableIB.maxrow.june22 <- 54 
TableIB.yrs.june22 <- "2020|2021"
TableIB.startdate.june22  <- "2019-jul"


#----------- Combine ------------

TableIB.skiprow  <- c(TableIB.skiprow.sep12,
		      TableIB.skiprow.nov14,
		      TableIB.skiprow.aug16,
		      TableIB.skiprow.sep17,
		      TableIB.skiprow.aug20, 
                      TableIB.skiprow.june22)

TableIB.maxrow  <- c(TableIB.maxrow.sep12,
		     TableIB.maxrow.nov14,
		     TableIB.maxrow.aug16,
		     TableIB.maxrow.sep17,
		     TableIB.maxrow.aug20, 
		     TableIB.maxrow.june22)

TableIB.yrs <- c(TableIB.yrs.sep12,
		 TableIB.yrs.nov14,
		 TableIB.yrs.aug16,
		 TableIB.yrs.sep17,
		 TableIB.yrs.aug20,
                 TableIB.yrs.june22)

TableIB.startdate <- c(TableIB.startdate.sep12,
		       TableIB.startdate.nov14,
		       TableIB.startdate.aug16,
		       TableIB.startdate.sep17,
		       TableIB.startdate.aug20,
		       TableIB.startdate.june22)

#---------- Common arguments ------

TableIB.inf.colsno <- c(1,2,3,4,5)
TableIB.inf.varnames=c(month="Months",
		       inf_p2p_05="Point to point with base 2005-2006",
                       inf_p2p_95="Point to point with base 1995-96",
                       inf_12m_05="12-Month average base 2005-2006",
                       inf_12m_95="12-Month average base 1995-96")
TableIB.sheet.name  <- "Table IB"

#----------------------------------------------- 

#---------- testing whether saving works --------

inf20 <- save_bb_dat(path.name=paste0("./data-raw/",TableIB.file.list[1]),
	    sheet.name=TableIB.sheet.name,
	    skip.row=TableIB.skiprow[1],
	    max.row=TableIB.maxrow[1],
	    yrs=TableIB.yrs[1],
	    start.date=TableIB.startdate[1],
	    cols_no=TableIB.inf.colsno,
	    var.names=TableIB.inf.varnames)

#------------- data range --------------------

# "2012_sep_econIndBB.xls": 2010 July - 2012 June
# "2014_nov_econIndBB.xls": 2012 July -  2013 June
# "2016_aug_econIndBB.xls": 2013 July -  2015 June
# "2017_sep_econIndBB.xlsx": 2015 July -  2017 June
# "2020_aug_econIndBB.xlsx" :  2017 July -  2019 June
# "2022_june_econIndBB.xlsx":  2019 July -  2022 May

#--------- Combining data -------------------

setwd("~/github-repos/macrobd")

inflation <- get_bb_dat(files=TableIB.file.list, 
			iter=length(TableIB.file.list),
			sheet.name= TableIB.sheet.name,
			skip.row=TableIB.skiprow,
			max.row=TableIB.maxrow,
			yrs=TableIB.yrs,
			start.date=TableIB.startdate,
			cols=TableIB.inf.colsno,
			var.names=TableIB.inf.varnames)  %>% 
                       arrange(date)



use_data(inflation, overwrite=TRUE)




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


# Extract data from Bangladesh Economic Review 

ber <- "~/Downloads/Bangladesh-Economic-Review-2022.pdf"

rice  <- extract_tables(ber, pages=24)
