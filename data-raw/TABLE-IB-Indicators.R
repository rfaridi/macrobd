#***************************************
#********* Indicators ***********
#***************************************

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
TableIB.colsno.sep12 <- c(1:5,12:16)

#---------  2014-nov ------------
TableIB.skiprow.nov14 <- 27 
TableIB.maxrow.nov14  <- 39
TableIB.yrs.nov14 <- " "
TableIB.startdate.nov14  <- "2012-jul"
TableIB.colsno.nov14 <- c(1:5,11:15)

#---------  2016-aug ------------
TableIB.skiprow.aug16 <- 26 
TableIB.maxrow.aug16  <- 51
TableIB.yrs.aug16 <- "2014"
TableIB.startdate.aug16  <- "2013-jul"
TableIB.colsno.aug16 <- c(1:5,11:15)


#---------  2017-sep ------------
TableIB.skiprow.sep17 <- 20 
TableIB.maxrow.sep17 <- 45 
TableIB.yrs.sep17 <- "2016"
TableIB.startdate.sep17  <- "2015-jul"
TableIB.colsno.sep17 <- c(1:5,11:15)

#---------  2020-aug ------------
TableIB.skiprow.aug20 <- 15 
TableIB.maxrow.aug20 <- 40 
TableIB.yrs.aug20 <- "2018|2019|2020"
TableIB.startdate.aug20  <- "2017-jul"
TableIB.colsno.aug20 <- c(1:5,11:15)


#--------- 2022-june ------------
TableIB.skiprow.june22 <- 17 
TableIB.maxrow.june22 <- 54 
TableIB.yrs.june22 <- "2020|2021"
TableIB.startdate.june22  <- "2019-jul"
TableIB.colsno.june22 <- c(1:5,11:15)


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

TableIB.colsno <-  list(TableIB.colsno.sep12,
		       TableIB.colsno.nov14,
		       TableIB.colsno.aug16,
		       TableIB.colsno.sep17,
		       TableIB.colsno.aug20,
		       TableIB.colsno.june22)



#---------- Common arguments ------

TableIB.varnames=c(month="Months",
		       inf_p2p_05="Point to point with base 2005-2006",
                       inf_p2p_95="Point to point with base 1995-96",
                       inf_12m_05="12-Month average base 2005-2006",
                       inf_12m_95="12-Month average base 1995-96",
		       #pr_agri="Wholesale price indices of agricultural products, Base 1969-70",
		       #pr_indy="Wholesale price indices of industrial products, Base 1969-70",
		       #prod_mfg="Index of industrial production for manufacturing (base 1988-89)",
		       #prod_jute="Index of industrial production for jute (base 1988-89)",
		       #prod_others="Index of industrial production for others (base 1988-89)",
                       exports= "Exports (fob)",
#		       imports_fob= "Imports (fob)",
		       imports_cf= "Imports (c&f)",
		       foreign_reserve="Foreign Reserve",
		       exhange_rate_avg="Weighted average of exchange rate (Period average)",
		       exhange_rate_end="Weighted average of exchange rate (End period)")

TableIB.colsno <- c(1:5,12:16)
TableIB.colsno22 <- c(1:5,11:15)

TableIB.sheet.name  <- rep("Table IB",6)

#----------------------------------------------- 

#---------- testing whether saving works --------

setwd("~/github-repos/macrobd")

tableib <- save_bb_dat(path.name=TableIB.file.list[1],
	    s.sheet.name=TableIB.sheet.name[1],
	    s.skip.row=TableIB.skiprow[1],
	    s.max.row=TableIB.maxrow[1],
	    s.yrs=TableIB.yrs[1],
	    s.start.date=TableIB.startdate[1],
	    s.cols=TableIB.colsno[1],
	    s.var.names=TableIB.varnames)

#------------- data range --------------------

# "2012_sep_econIndBB.xls": 2010 July - 2012 June
# "2014_nov_econIndBB.xls": 2012 July -  2013 June
# "2016_aug_econIndBB.xls": 2013 July -  2015 June
# "2017_sep_econIndBB.xlsx": 2015 July -  2017 June
# "2020_aug_econIndBB.xlsx" :  2017 July -  2019 June
# "2022_june_econIndBB.xlsx":  2019 July -  2022 May

#--------- Combining data -------------------

setwd("~/github-repos/macrobd")

tableIB <- get_bb_dat(files=TableIB.file.list, 
			iter=length(TableIB.file.list),
			g.sheet.name= TableIB.sheet.name,
			g.skip.row=TableIB.skiprow,
			g.max.row=TableIB.maxrow,
			g.yrs=TableIB.yrs,
			g.start.date=TableIB.startdate,
			g.cols=TableIB.colsno,
			g.var.names=TableIB.varnames)  %>% 
                       arrange(date)


use_data(tableIB, overwrite=TRUE)



