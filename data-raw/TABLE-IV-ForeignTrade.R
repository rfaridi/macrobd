#***************************************
#********* FOREIGN TRADE ***********
#***************************************

library(tidyverse)

setwd("~/github-repos/macrobd")

file.list <- c("2012_sep_econIndBB.xls",
	       "2014_nov_econIndBB.xls", 
	       "2016_aug_econIndBB.xls",
	       "2017_sep_econIndBB.xlsx",
	       "2020_aug_econIndBB.xlsx",
	       "2022_nov_econIndBB.xlsx")

TableIV.file.list <- file.list
# this is required since we are not using the whole list
#TableIV.file.list  <- TableIV.file.list[1:6]
#----------------------------------------

#---------  2012-sep ------------

# "2012_sep_econIndBB.xls": 2010 July - 2012 June

TableIV.skiprow.sep12 <- 24 
TableIV.maxrow.sep12  <- 49
TableIV.yrs.sep12 <- "2011"
TableIV.startdate.sep12  <- "2010-jul"
tot.cols <- 1:42
rm.cols <- c(12,15,21,22,39,40,41,42)
TableIV.colsno.sep12 <- setdiff(tot.cols,rm.cols) 
TableIV.sheetname.sep12 <- "Table IV"

#---------  2014-nov ------------

# "2014_nov_econIndBB.xls": 2012 July -  2013 June

TableIV.skiprow.nov14 <- 26 
TableIV.maxrow.nov14  <- 38
TableIV.yrs.nov14 <- " "
TableIV.startdate.nov14  <- "2012-jul"
TableIV.colsno.nov14 <- setdiff(tot.cols,rm.cols) 
TableIV.sheetname.nov14 <- "Table IV"

#---------  2016-aug ------------

# "2016_aug_econIndBB.xls": 2013 July -  2015 June

TableIV.skiprow.aug16 <- 25 
TableIV.maxrow.aug16  <- 50
TableIV.yrs.aug16 <- "2014"
TableIV.startdate.aug16  <- "2013-jul"
TableIV.colsno.aug16 <- setdiff(tot.cols,rm.cols) 
TableIV.sheetname.aug16 <- "Table IV"


#---------  2017-sep ------------

# "2017_sep_econIndBB.xlsx": 2015 July -  2017 June

TableIV.skiprow.sep17 <- 18
TableIV.maxrow.sep17 <- 43 
TableIV.yrs.sep17 <- "2016"
TableIV.startdate.sep17  <- "2015-jul"
TableIV.colsno.sep17 <- setdiff(tot.cols,rm.cols) 
TableIV.sheetname.sep17 <- "Table IV"

#---------  2020-aug ------------

# "2020_aug_econIndBB.xlsx" :  2017 July -  2019 June

TableIV.skiprow.aug20 <- 15 
TableIV.maxrow.aug20 <- 40 
TableIV.yrs.aug20 <- "2018|2019|2020"
TableIV.startdate.aug20  <- "2017-jul"
#--- cols 
setdiff(tot.cols,rm.cols)
TableIV.colsno.aug20 <- setdiff(tot.cols,rm.cols) 
#---
TableIV.sheetname.aug20 <- "Table IV"

#--------- 2022-june ------------

# "2022_june_econIndBB.xlsx":  2019 July -  2022 May

TableIV.skiprow.june22 <- 17 
TableIV.maxrow.june22 <- 53 
TableIV.yrs.june22 <- "2020|2021"
TableIV.startdate.june22  <- "2019-jul"
#--- cols 
TableIV.colsno.june22 <- setdiff(tot.cols,rm.cols) 
#---
TableIV.sheetname.june22  <- "Table IV"



#----------- Combine ------------

TableIV.skiprow  <- c(TableIV.skiprow.sep12,
		      TableIV.skiprow.nov14,
		      TableIV.skiprow.aug16,
		      TableIV.skiprow.sep17,
		      TableIV.skiprow.aug20, 
                      TableIV.skiprow.june22)

TableIV.maxrow  <- c(TableIV.maxrow.sep12,
		     TableIV.maxrow.nov14,
		     TableIV.maxrow.aug16,
		     TableIV.maxrow.sep17,
		     TableIV.maxrow.aug20, 
		     TableIV.maxrow.june22)

TableIV.yrs <- c(TableIV.yrs.sep12,
		 TableIV.yrs.nov14,
		 TableIV.yrs.aug16,
		 TableIV.yrs.sep17,
		 TableIV.yrs.aug20,
                 TableIV.yrs.june22)

TableIV.startdate <- c(TableIV.startdate.sep12,
		       TableIV.startdate.nov14,
		       TableIV.startdate.aug16,
		       TableIV.startdate.sep17,
		       TableIV.startdate.aug20,
		       TableIV.startdate.june22)

TableIV.colsno <-  list(TableIV.colsno.sep12,
		       TableIV.colsno.nov14,
		       TableIV.colsno.aug16,
		       TableIV.colsno.sep17,
		       TableIV.colsno.aug20,
		       TableIV.colsno.june22)

TableIV.sheetname <- c(TableIV.sheetname.sep12,
		       TableIV.sheetname.nov14,
		       TableIV.sheetname.aug16,
		       TableIV.sheetname.sep17,
		       TableIV.sheetname.aug20,
		       TableIV.sheetname.june22)


#---------- Common arguments ------

TableIV.varnames=c(month="Months",
		       exp_jute="Merchandise Exports (Raw Jute)",
		       exp_jute_goods="Merchandise Exports (Jute goods)",
		       exp_tea="Merchandise Exports (Tea)",
		       exp_leather="Merchandise Exports (Leather)",
		       exp_fish ="Merchandise Exports (Fish)",
		       exp_rmg ="Merchandise Exports (RMG)",
		       exp_nafu ="Merchandise Exports (Naptha,Furnace Oil)",
		       exp_news ="Merchandise Exports (News print)",
		       exp_fertilizers ="Merchandise Exports (Fertilizers)",
		       exp_others="Merchandise Exports (Others)",
		       imp_rice="Merchandise Imports (Rice)",
		       imp_wheat="Merchandise Imports (Wheat)",
		       imp_milk="Merchandise Imports (Milk)",
		       imp_spices="Merchandise Imports (Spices)",
		       imp_oil_seeds="Merchandise Imports (Oil seeds)",
		       imp_edible_oil="Merchandise Imports (Edibile oil)",
		       imp_pulses="Merchandise Imports (Pulses)",
		       imp_sugar="Merchandise Imports (Sugar)",
		       imp_clinker="Merchandise Imports (Clinker)",
		       imp_crude_petrol="Merchandise Imports (Crude petroleum)",
		       imp_petrol_products="Merchandise Imports (Petroleum products",
		       imp_chemicals="Merchandise Imports (Chemicals)",
		       imp_pharma="Merchandise Imports (Pharma)",
		       imp_fertilizers="Merchandise Imports (Fertilizers)",
		       imp_dye_tan="Merchandise Imports (Dyeing and Tanning)",
		       imp_plastic="Merchandise Imports (Plastic and Rubber)",
		       imp_cotton="Merchandise Imports (Cotton)",
		       imp_yarn="Merchandise Imports (Yarn)",
		       imp_textiles_articles="Merchandise Imports (Textile and articles)",
		       imp_staple_fibre="Merchandise Imports (Staple fibres)",
		       imp_iron_steel="Merchandise Imports (Iron and Steel)",
		       imp_cap_machine="Merchandise Imports (Capital Machineries)",
		       imp_others="Merchandise Imports (Others)")
#----------------------------------------------- 

#---------- testing whether saving works --------

setwd("~/github-repos/macrobd")

tableib <- save_bb_dat(path.name=TableIV.file.list[5],
	    s.sheetname=TableIV.sheetname[5],
	    s.skiprow=TableIV.skiprow[5],
	    s.maxrow=TableIV.maxrow[5],
	    s.yrs=TableIV.yrs[5],
	    s.startdate=TableIV.startdate[5],
	    s.cols=TableIV.colsno[5],
	    s.varnames=TableIV.varnames)



#--------- Combining data -------------------

setwd("~/github-repos/macrobd")
iter_spec <- c(1,2,3,4,5,6)
tableIV <- get_bb_dat(files=TableIV.file.list, 
			iter=iter_spec,
			g.sheetname= TableIV.sheetname,
			g.skiprow=TableIV.skiprow,
			g.maxrow=TableIV.maxrow,
			g.yrs=TableIV.yrs,
			g.startdate=TableIV.startdate,
			g.cols=TableIV.colsno,
			g.varnames=TableIV.varnames)  %>% 
                       arrange(date)


use_data(tableIV, overwrite=TRUE)



