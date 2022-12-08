#***************************************
#********* TABLE IIB ***********
#***************************************

library(tidyverse)

setwd("~/github-repos/macrobd")

file.list <- c("2012_sep_econIndBB.xls",
	       "2014_nov_econIndBB.xls", 
	       "2016_aug_econIndBB.xls",
	       "2017_sep_econIndBB.xlsx",
	       "2020_aug_econIndBB.xlsx",
	       "2022_nov_econIndBB.xlsx")

TableIIB.file.list <- file.list
# this is required since we are not using the whole list
#TableIIB.file.list  <- TableIIB.file.list[1:6]
#----------------------------------------

#---------  2012-sep ------------

# "2012_sep_econIndBB.xls": 2010 July - 2012 June

TableIIB.skiprow.sep12 <- 26 
TableIIB.maxrow.sep12  <- TableIIB.skiprow.sep12 + 25
TableIIB.yrs.sep12 <- "2011"
TableIIB.startdate.sep12  <- "2010-jul"
TableIIB.colsno.sep12 <- 1:12
TableIIB.sheetname.sep12 <- "TableIIB"

#---------  2014-nov ------------

# "2014_nov_econIndBB.xls": 2012 July -  2013 June

TableIIB.skiprow.nov14 <- 28
TableIIB.maxrow.nov14  <- TableIIB.skiprow.nov14 + 12
TableIIB.yrs.nov14 <- " "
TableIIB.startdate.nov14  <- "2012-jul"
TableIIB.colsno.nov14 <- 1:12
TableIIB.sheetname.nov14 <- "TableIIB"

#---------  2016-aug ------------

# "2016_aug_econIndBB.xls": 2013 July -  2015 June

TableIIB.skiprow.aug16 <- 16
TableIIB.maxrow.aug16  <- TableIIB.skiprow.aug16 + 25
TableIIB.yrs.aug16 <- "2014"
TableIIB.startdate.aug16  <- "2013-jul"
TableIIB.colsno.aug16 <- 1:12
TableIIB.sheetname.aug16 <- "TableIIB"


#---------  2017-sep ------------

# "2017_sep_econIndBB.xlsx": 2015 July -  2017 June

TableIIB.skiprow.sep17 <- 17
TableIIB.maxrow.sep17 <- TableIIB.skiprow.sep17 + 25
TableIIB.yrs.sep17 <- "2016"
TableIIB.startdate.sep17  <- "2015-jul"
TableIIB.colsno.sep17 <- 1:12  
TableIIB.sheetname.sep17 <- "TableIIB"

#---------  2020-aug ------------

# "2020_aug_econIndBB.xlsx" :  2017 July -  2019 June

TableIIB.skiprow.aug20 <- 15 
TableIIB.maxrow.aug20 <- TableIIB.skiprow.aug20 + 25
TableIIB.yrs.aug20 <- "2018|2019|2020"
TableIIB.startdate.aug20  <- "2017-jul"
#--- cols 
TableIIB.colsno.aug20 <- 1:12
#---
TableIIB.sheetname.aug20 <- "TableIIB"

#--------- 2022-nov ------------

# "2022_nov_econIndBB.xlsx":  2019 July -  2022 May

TableIIB.skiprow.nov22 <- 28
TableIIB.maxrow.nov22 <- 52 
TableIIB.yrs.nov22 <- "2020|2021"
TableIIB.startdate.nov22  <- "2019-jul"
#--- cols 
TableIIB.colsno.nov22 <- 1:12
#---
TableIIB.sheetname.nov22  <- "TableIIB"



#----------- Combine ------------

TableIIB.skiprow  <- c(TableIIB.skiprow.sep12,
		      TableIIB.skiprow.nov14,
		      TableIIB.skiprow.aug16,
		      TableIIB.skiprow.sep17,
		      TableIIB.skiprow.aug20, 
                      TableIIB.skiprow.nov22)

TableIIB.maxrow  <- c(TableIIB.maxrow.sep12,
		     TableIIB.maxrow.nov14,
		     TableIIB.maxrow.aug16,
		     TableIIB.maxrow.sep17,
		     TableIIB.maxrow.aug20, 
		     TableIIB.maxrow.nov22)

TableIIB.yrs <- c(TableIIB.yrs.sep12,
		 TableIIB.yrs.nov14,
		 TableIIB.yrs.aug16,
		 TableIIB.yrs.sep17,
		 TableIIB.yrs.aug20,
                 TableIIB.yrs.nov22)

TableIIB.startdate <- c(TableIIB.startdate.sep12,
		       TableIIB.startdate.nov14,
		       TableIIB.startdate.aug16,
		       TableIIB.startdate.sep17,
		       TableIIB.startdate.aug20,
		       TableIIB.startdate.nov22)

TableIIB.colsno <-  list(TableIIB.colsno.sep12,
		       TableIIB.colsno.nov14,
		       TableIIB.colsno.aug16,
		       TableIIB.colsno.sep17,
		       TableIIB.colsno.aug20,
		       TableIIB.colsno.nov22)

TableIIB.sheetname <- c(TableIIB.sheetname.sep12,
		       TableIIB.sheetname.nov14,
		       TableIIB.sheetname.aug16,
		       TableIIB.sheetname.sep17,
		       TableIIB.sheetname.aug20,
		       TableIIB.sheetname.nov22)


#---------- Common arguments ------


TableIIB.varnames=c(month="Months",
		    govt="Government",
		    loc_auth="Local authorities",
		    other_fincorp_pub="Other financial corporation-public",
		    other_fincorp_pvt="Other financial corporation-private",
		    other_fincorp_tot="Other financial corporation-total",
		    non_fincorp_pub="Non financial corporation-public",
		    non_fincorp_pvt="Non financial corporation-private",
		    non_fincorp_tot="Non financial corporation-total",
		    other_resident="Other resident sector",
		    total_dom_credit="Total domestic credit",
		    end_period="End of period")

#--- checking whether var no and current column in excel matches
excel_cols <- c(LETTERS,paste0("A",LETTERS),paste0("B",LETTERS))
current_var <- str_which(excel_cols,"^BV$")
current_var
var_length <- length(names(TableIIB.varnames))
var_length
var_length == current_var
# upto AI clear, end of period3
# upto AP clear, total deposit liabilities, dmbs_liability_total
# upto BA clear, end of period 4 
#---------------------------------------------------------------

#---------- testing whether saving works --------

setwd("~/github-repos/macrobd")

saveIIB <- save_bb_dat(path.name=TableIIB.file.list[6],
	    s.sheetname=TableIIB.sheetname[6],
	    s.skiprow=TableIIB.skiprow[6],
	    s.maxrow=TableIIB.maxrow[6],
	    s.yrs=TableIIB.yrs[6],
	    s.startdate=TableIIB.startdate[6],
	    s.cols=TableIIB.colsno[6],
	    s.varnames=TableIIB.varnames)



#--------- Combining data -------------------

setwd("~/github-repos/macrobd")
iter_spec <- 1:6
tableIIB_res <- get_bb_dat(files=TableIIB.file.list, 
			iter=iter_spec,
			g.sheetname= TableIIB.sheetname,
			g.skiprow=TableIIB.skiprow,
			g.maxrow=TableIIB.maxrow,
			g.yrs=TableIIB.yrs,
			g.startdate=TableIIB.startdate,
			g.cols=TableIIB.colsno,
			g.varnames=TableIIB.varnames)  %>% 
                       arrange(date)


use_data(tableIIB_res, overwrite=TRUE)



