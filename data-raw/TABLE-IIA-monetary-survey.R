#***************************************
#********* TABLE IIIA ***********
#***************************************

library(tidyverse)

setwd("~/github-repos/macrobd")

file.list <- c("2012_sep_econIndBB.xls",
	       "2014_nov_econIndBB.xls", 
	       "2016_aug_econIndBB.xls",
	       "2017_sep_econIndBB.xlsx",
	       "2020_aug_econIndBB.xlsx",
	       "2022_nov_econIndBB.xlsx")

TableIIA.file.list <- file.list
# this is required since we are not using the whole list
#TableIIA.file.list  <- TableIIA.file.list[1:6]
#----------------------------------------

#---------  2012-sep ------------

# "2012_sep_econIndBB.xls": 2010 July - 2012 June

TableIIA.skiprow.sep12 <- 25 
TableIIA.maxrow.sep12  <- TableIIA.skiprow.sep12 + 25
TableIIA.yrs.sep12 <- "2011"
TableIIA.startdate.sep12  <- "2010-jul"
TableIIA.colsno.sep12 <- 1:16
TableIIA.sheetname.sep12 <- "TableIIA"

#---------  2014-nov ------------

# "2014_nov_econIndBB.xls": 2012 July -  2013 June

TableIIA.skiprow.nov14 <- 29
TableIIA.maxrow.nov14  <- TableIIA.skiprow.nov14 + 12
TableIIA.yrs.nov14 <- " "
TableIIA.startdate.nov14  <- "2012-jul"
TableIIA.colsno.nov14 <- 1:16
TableIIA.sheetname.nov14 <- "TableIIA"

#---------  2016-aug ------------

# "2016_aug_econIndBB.xls": 2013 July -  2015 June

TableIIA.skiprow.aug16 <- 30
TableIIA.maxrow.aug16  <- TableIIA.skiprow.aug16 + 25
TableIIA.yrs.aug16 <- "2014"
TableIIA.startdate.aug16  <- "2013-jul"
TableIIA.colsno.aug16 <- 1:16
TableIIA.sheetname.aug16 <- "TableIIA"


#---------  2017-sep ------------

# "2017_sep_econIndBB.xlsx": 2015 July -  2017 June

TableIIA.skiprow.sep17 <- 22
TableIIA.maxrow.sep17 <- TableIIA.skiprow.sep17 + 25
TableIIA.yrs.sep17 <- "2016"
TableIIA.startdate.sep17  <- "2015-jul"
TableIIA.colsno.sep17 <- 1:16  
TableIIA.sheetname.sep17 <- "TableIIA"

#---------  2020-aug ------------

# "2020_aug_econIndBB.xlsx" :  2017 July -  2019 June

TableIIA.skiprow.aug20 <- 17 
TableIIA.maxrow.aug20 <- TableIIA.skiprow.aug20 + 25
TableIIA.yrs.aug20 <- "2018|2019|2020"
TableIIA.startdate.aug20  <- "2017-jul"
#--- cols 
TableIIA.colsno.aug20 <- 1:16
#---
TableIIA.sheetname.aug20 <- "TableIIA"

#--------- 2022-nov ------------

# "2022_nov_econIndBB.xlsx":  2019 July -  2022 May

TableIIA.skiprow.nov22 <- 31
TableIIA.maxrow.nov22 <- 55 
TableIIA.yrs.nov22 <- "2020|2021"
TableIIA.startdate.nov22  <- "2019-jul"
#--- cols 
TableIIA.colsno.nov22 <- 1:16
#---
TableIIA.sheetname.nov22  <- "TableIIA"



#----------- Combine ------------

TableIIA.skiprow  <- c(TableIIA.skiprow.sep12,
		      TableIIA.skiprow.nov14,
		      TableIIA.skiprow.aug16,
		      TableIIA.skiprow.sep17,
		      TableIIA.skiprow.aug20, 
                      TableIIA.skiprow.nov22)

TableIIA.maxrow  <- c(TableIIA.maxrow.sep12,
		     TableIIA.maxrow.nov14,
		     TableIIA.maxrow.aug16,
		     TableIIA.maxrow.sep17,
		     TableIIA.maxrow.aug20, 
		     TableIIA.maxrow.nov22)

TableIIA.yrs <- c(TableIIA.yrs.sep12,
		 TableIIA.yrs.nov14,
		 TableIIA.yrs.aug16,
		 TableIIA.yrs.sep17,
		 TableIIA.yrs.aug20,
                 TableIIA.yrs.nov22)

TableIIA.startdate <- c(TableIIA.startdate.sep12,
		       TableIIA.startdate.nov14,
		       TableIIA.startdate.aug16,
		       TableIIA.startdate.sep17,
		       TableIIA.startdate.aug20,
		       TableIIA.startdate.nov22)

TableIIA.colsno <-  list(TableIIA.colsno.sep12,
		       TableIIA.colsno.nov14,
		       TableIIA.colsno.aug16,
		       TableIIA.colsno.sep17,
		       TableIIA.colsno.aug20,
		       TableIIA.colsno.nov22)

TableIIA.sheetname <- c(TableIIA.sheetname.sep12,
		       TableIIA.sheetname.nov14,
		       TableIIA.sheetname.aug16,
		       TableIIA.sheetname.sep17,
		       TableIIA.sheetname.aug20,
		       TableIIA.sheetname.nov22)


#---------- Common arguments ------


TableIIA.varnames=c(month="Months",
		    nfa_bb="Net foreign assets: BB",
		    nfa_dmbs="Net foreign assets: DMBs",
		    nfa_tot="Net foreign assets: total",
		    dom_credit_bb2gov="Domestic credit - Public sector -BB to Govt",
		    dom_credit_dmbs2gov="Domestic credit - Public sector - DMBs to Govt",
		    dom_credit_govtot="Domestic credit - Public sector - Government total",
		    dom_credit_bb2other="Domestic credit - Public sector -BB to Other public",
		    dom_credit_dmbs2other="Domestic credit - Public sector - DMBs to Other public",
		    dom_credit_othertot="Domestic credit - Public sector - Other public total",
		    dom_credit_private="Domestic credit - private sector",
		    dom_credit_total="Domestic credit -total",
		    net_other_assets="Net other assets",
		    net_domestic_assets="Net domestic assets",
		    broad_money="Broad money (M2)",
		    end_period="End of period")

#--- checking whether var no and current column in excel matches
excel_cols <- c(LETTERS,paste0("A",LETTERS),paste0("B",LETTERS))
current_var <- str_which(excel_cols,"^BV$")
current_var
var_length <- length(names(TableIIA.varnames))
var_length
var_length == current_var
# upto AI clear, end of period3
# upto AP clear, total deposit liabilities, dmbs_liability_total
# upto BA clear, end of period 4 
#---------------------------------------------------------------

#---------- testing whether saving works --------

setwd("~/github-repos/macrobd")

saveIIA <- save_bb_dat(path.name=TableIIA.file.list[5],
	    s.sheetname=TableIIA.sheetname[5],
	    s.skiprow=TableIIA.skiprow[5],
	    s.maxrow=TableIIA.maxrow[5],
	    s.yrs=TableIIA.yrs[5],
	    s.startdate=TableIIA.startdate[5],
	    s.cols=TableIIA.colsno[5],
	    s.varnames=TableIIA.varnames)



#--------- Combining data -------------------

setwd("~/github-repos/macrobd")
iter_spec <- 1:6
tableIIA_m2 <- get_bb_dat(files=TableIIA.file.list, 
			iter=iter_spec,
			g.sheetname= TableIIA.sheetname,
			g.skiprow=TableIIA.skiprow,
			g.maxrow=TableIIA.maxrow,
			g.yrs=TableIIA.yrs,
			g.startdate=TableIIA.startdate,
			g.cols=TableIIA.colsno,
			g.varnames=TableIIA.varnames)  %>% 
                       arrange(date)


use_data(tableIIA_m2, overwrite=TRUE)



