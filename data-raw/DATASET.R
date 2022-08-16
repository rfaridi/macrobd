# Selected economic indicators

file.list <- c("2022_june_econIndBB.xlsx",
          "2021_feb_econIndBB.xlsx",
          "2019_june_econIndBB.xlsx",
          "2017_sep_econIndBB.xlsx",
	  "2016_aug_econIndBB.xls")

 #--------------- Inflation --------------

# Added june 2022 data on 13th July, 2022

TableIB.file.list <- c("statisticaltable_june_2022.xlsx",
		       "statisticaltable_feb_2021.xlsx",
		       "2019_june_statisticaltable.xlsx",
		       "statisticaltable_sep2017.xlsx", 
		       "statisticaltable_aug2016.xls", 
		       "statisticaltable_2014.xls",
		       "BB_sep9_2012.xls")
TableIB.skiprow.june22 <- 31
TableIB.maxrow.june22 <- 54 
TableIB.skiprow  <- c(TableIB.skiprow.june22,
		      38,15,21,39,27,25)
TableIB.maxrow  <- c(TableIB.maxrow.june22,
		     55,51,33,51,52,50)
inf.colsno <- c(1,2,3,4,5)
TableIB.yrs.june22 <- "2021-22"
TableIB.yrs <- c(TableIB.yrs.june22,
		 "2019|2020","2018-19|2017-18"," "," ","2013-14","2011-12")
TableIB.startdate.june22 <- "2020-aug"
TableIB.startdate <- c(TableIB.startdate.june22,
		       "2019-may",paste0(c(2016,2015,2014,2012,2010),"-july"))
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

# Inflation details
TableVII.file.list <- c("2022_june_econIndBB.xlsx",
          "2021_feb_econIndBB.xlsx",
          "2019_june_econIndBB.xlsx",
          "2017_sep_econIndBB.xlsx",
	  "2016_aug_econIndBB.xls")

skiprow.june22.TableVII <- 14
maxrow.june22.TableVII <- 51 
TableVII.skiprow  <- c(skiprow.june22.TableVII,
		      38,15,21,39)
TableVII.maxrow  <- c(maxrow.june22.TableVII,
		     55,51,33,51)
TableVII.yrs.june22 <- "2021-22"
TableVII.yrs <- c(TableVII.yrs.june22,
		  "2019|2020","2018-19|2017-18"," "," ")
TableVII.startdate.june22 <- "2020-aug"
TableVII.startdate <- c("TableVII.startdate.june22",
			"2019-may",paste0(c(2016,2015,2014),"-july"))

infDet.var.names <- c("month",
		      "cpi_general",
	       "inf_p2p",
	       "inf_12ma",
	       "cpi_food",
	       "inf_food_p2p",
	       "inf_food_12ma",
	       "cpi_nonfood",
	       "inf_nonfood_p2p",
	       "inf_nonfood_12ma",
	       "cpi_cloth_foot",
	       "cpi_rent_fuel_light",
	       "cpi_furniture",
	       "cpi_medical",
	       "cpi_transport",
	       "cpi_recreation",
	       "cpi_misc")


inf_det <- get_bb_dat(files=TableVII.file.list,
		      iter=1,
			 sheet.name="Table VII",
                         skip.row=TableVII.skiprow,
			 max.row=TableVII.maxrow,
                        yrs=TableVII.yrs,
			 start.date=TableVII.startdate,
			 var.names=infDet.var.names)
  
use_data(inf_details, overwrite=TRUE)




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


# Extract data from Bangladesh Economic Review 

ber <- "~/Downloads/Bangladesh-Economic-Review-2022.pdf"

rice  <- extract_tables(ber, pages=24)
