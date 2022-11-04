#***************************************
#********* REMITTANCE ***********
#***************************************

library(tidyverse)

setwd("~/github-repos/macrobd")

file.list <- c("2012_sep_econIndBB.xls",
	       "2014_nov_econIndBB.xls", 
	       "2016_aug_econIndBB.xls",
	       "2017_sep_econIndBB.xlsx",
	       "2020_aug_econIndBB.xlsx",
	       "2022_nov_econIndBB.xlsx")

TableXIX.file.list <- file.list
# this is required since we are not using the whole list
#TableXIX.file.list  <- TableXIX.file.list[1:6]
#----------------------------------------

#---------  2012-sep ------------

# "2012_sep_econIndBB.xls": 2010 July - 2012 June

TableXIX.skiprow.sep12 <- 21 
TableXIX.maxrow.sep12  <- 46
TableXIX.yrs.sep12 <- "2011"
TableXIX.startdate.sep12  <- "2010-jul"
TableXIX.colsno.sep12 <- 1:21
TableXIX.sheetname.sep12 <- "TableXXI"

#---------  2014-nov ------------

# "2014_nov_econIndBB.xls": 2012 July -  2013 June

TableXIX.skiprow.nov14 <- 35
TableXIX.maxrow.nov14  <- 47
TableXIX.yrs.nov14 <- " "
TableXIX.startdate.nov14  <- "2012-jul"
TableXIX.colsno.nov14 <- 1:21
TableXIX.sheetname.nov14 <- "TableXXI"

#---------  2016-aug ------------

# "2016_aug_econIndBB.xls": 2013 July -  2015 June

TableXIX.skiprow.aug16 <- 24 
TableXIX.maxrow.aug16  <- 49
TableXIX.yrs.aug16 <- "2014"
TableXIX.startdate.aug16  <- "2013-jul"
TableXIX.colsno.aug16 <- 1:21
TableXIX.sheetname.aug16 <- "TableXIX"


#---------  2017-sep ------------

# "2017_sep_econIndBB.xlsx": 2015 July -  2017 June

TableXIX.skiprow.sep17 <- 18
TableXIX.maxrow.sep17 <- 43 
TableXIX.yrs.sep17 <- "2016"
TableXIX.startdate.sep17  <- "2015-jul"
TableXIX.colsno.sep17 <- 1:21  
TableXIX.sheetname.sep17 <- "TableXIX"

#---------  2020-aug ------------

# "2020_aug_econIndBB.xlsx" :  2017 July -  2019 June

TableXIX.skiprow.aug20 <- 15 
TableXIX.maxrow.aug20 <- 40 
TableXIX.yrs.aug20 <- "2018|2019|2020"
TableXIX.startdate.aug20  <- "2017-jul"
#--- cols 
TableXIX.colsno.aug20 <- 1:21
#---
TableXIX.sheetname.aug20 <- "TableXIX"

#--------- 2022-nov ------------

# "2022_nov_econIndBB.xlsx":  2019 July -  2022 May

TableXIX.skiprow.nov22 <- 26 
TableXIX.maxrow.nov22 <- 51 
TableXIX.yrs.nov22 <- "2020|2021"
TableXIX.startdate.nov22  <- "2019-jul"
#--- cols 
TableXIX.colsno.nov22 <- 1:21
#---
TableXIX.sheetname.nov22  <- "TableXIX"



#----------- Combine ------------

TableXIX.skiprow  <- c(TableXIX.skiprow.sep12,
		      TableXIX.skiprow.nov14,
		      TableXIX.skiprow.aug16,
		      TableXIX.skiprow.sep17,
		      TableXIX.skiprow.aug20, 
                      TableXIX.skiprow.nov22)

TableXIX.maxrow  <- c(TableXIX.maxrow.sep12,
		     TableXIX.maxrow.nov14,
		     TableXIX.maxrow.aug16,
		     TableXIX.maxrow.sep17,
		     TableXIX.maxrow.aug20, 
		     TableXIX.maxrow.nov22)

TableXIX.yrs <- c(TableXIX.yrs.sep12,
		 TableXIX.yrs.nov14,
		 TableXIX.yrs.aug16,
		 TableXIX.yrs.sep17,
		 TableXIX.yrs.aug20,
                 TableXIX.yrs.nov22)

TableXIX.startdate <- c(TableXIX.startdate.sep12,
		       TableXIX.startdate.nov14,
		       TableXIX.startdate.aug16,
		       TableXIX.startdate.sep17,
		       TableXIX.startdate.aug20,
		       TableXIX.startdate.nov22)

TableXIX.colsno <-  list(TableXIX.colsno.sep12,
		       TableXIX.colsno.nov14,
		       TableXIX.colsno.aug16,
		       TableXIX.colsno.sep17,
		       TableXIX.colsno.aug20,
		       TableXIX.colsno.nov22)

TableXIX.sheetname <- c(TableXIX.sheetname.sep12,
		       TableXIX.sheetname.nov14,
		       TableXIX.sheetname.aug16,
		       TableXIX.sheetname.sep17,
		       TableXIX.sheetname.aug20,
		       TableXIX.sheetname.nov22)


#---------- Common arguments ------

TableXIX.varnames=c(month="Months",
		       `Saudi Arabia`="Saudi Arabia",
		       UAE="UAE",
		       UK="UK",
		       Kuwait="Kuwait",
		       USA ="USA",
		       Libya ="Libya",
		       Qatar ="Qatar",
		       Oman="Oman",
		       Singapore="Singapore",
		       Germany="Germany",
		       Bahrain="Bahrain",
		       Iran="Iran",
		       Japan="Japan",
		       Malaysia="Malaysia",
		       Australia="Australia",
		       Italy="Italy",
		       `South Korea`="South Korea",
		       `Hong Kong`="Hong Kong",
		       `Other Countries`="Other countries",
		       Total="Total")
#----------------------------------------------- 

#---------- testing whether saving works --------

setwd("~/github-repos/macrobd")

saveXIX <- save_bb_dat(path.name=TableXIX.file.list[1],
	    s.sheetname=TableXIX.sheetname[1],
	    s.skiprow=TableXIX.skiprow[1],
	    s.maxrow=TableXIX.maxrow[1],
	    s.yrs=TableXIX.yrs[1],
	    s.startdate=TableXIX.startdate[1],
	    s.cols=TableXIX.colsno[1],
	    s.varnames=TableXIX.varnames)



#--------- Combining data -------------------

setwd("~/github-repos/macrobd")
iter_spec <- 1:6
tableXIX_remit <- get_bb_dat(files=TableXIX.file.list, 
			iter=iter_spec,
			g.sheetname= TableXIX.sheetname,
			g.skiprow=TableXIX.skiprow,
			g.maxrow=TableXIX.maxrow,
			g.yrs=TableXIX.yrs,
			g.startdate=TableXIX.startdate,
			g.cols=TableXIX.colsno,
			g.varnames=TableXIX.varnames)  %>% 
                       arrange(date)


use_data(tableXIX_remit, overwrite=TRUE)



