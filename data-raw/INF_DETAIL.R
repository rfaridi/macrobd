#***************************************
#********* Inflation details ***********
#***************************************

library(tidyverse)

file.list <- c("2012_sep_econIndBB.xls",
	       "2014_nov_econIndBB.xls", 
	       "2016_aug_econIndBB.xls",
	       "2017_sep_econIndBB.xlsx",
	       "2020_aug_econIndBB.xlsx",
	       "2022_june_econIndBB.xlsx")


#--------------- file.list ------------
TableVIII.file.list <- file.list
# this is required since we are not using the whole list
#TableVIII.file.list  <- TableVIII.file.list[1:3]
#----------------------------------------
#------------- data range --------------------

# "2012_sep_econIndBB.xls": 2010 July - 2012 June
# "2014_nov_econIndBB.xls": 2012 July -  2013 June
# "2016_aug_econIndBB.xls": 2013 July -  2015 June
# "2017_sep_econIndBB.xlsx": 2015 July -  2017 June
# "2020_aug_econIndBB.xlsx" :  2017 July -  2019 June
# "2022_june_econIndBB.xlsx":  2019 July -  2022 May

#---------  2012-sep ------------
TableVIII.skiprow.sep12 <- 21 
TableVIII.maxrow.sep12  <- 46
TableVIII.yrs.sep12 <- "2011"
TableVIII.startdate.sep12  <- "2010-jul"

#---------  2014-nov ------------
TableVIII.skiprow.nov14 <- 24 
TableVIII.maxrow.nov14  <- 48
TableVIII.yrs.nov14 <- " "
TableVIII.startdate.nov14  <- "2012-jul"

#---------  2016-aug ------------
TableVIII.skiprow.aug16 <- 23 
TableVIII.maxrow.aug16  <- 49
TableVIII.yrs.aug16 <- "2014"
TableVIII.startdate.aug16  <- "2013-jul"


#---------  2017-sep ------------
TableVIII.skiprow.sep17 <- 15
TableVIII.maxrow.sep17 <- 40 
TableVIII.yrs.sep17 <- "2016"
TableVIII.startdate.sep17  <- "2015-jul"

#---------  2020-aug ------------
TableVIII.skiprow.aug20 <- 12 
TableVIII.maxrow.aug20 <- 37
TableVIII.yrs.aug20 <- "2018"
TableVIII.startdate.aug20  <- "2017-jul"


#--------- 2022-june ------------
TableVIII.skiprow.june22 <- 14 
TableVIII.maxrow.june22 <- 51 
TableVIII.yrs.june22 <- "2020|2021"
TableVIII.startdate.june22  <- "2019-jul"


#----------- Combine ------------

TableVIII.skiprow  <- c(TableVIII.skiprow.sep12,
		      TableVIII.skiprow.nov14,
		      TableVIII.skiprow.aug16,
		      TableVIII.skiprow.sep17,
		      TableVIII.skiprow.aug20, 
                      TableVIII.skiprow.june22)

TableVIII.maxrow  <- c(TableVIII.maxrow.sep12,
		     TableVIII.maxrow.nov14,
		     TableVIII.maxrow.aug16,
		     TableVIII.maxrow.sep17,
		     TableVIII.maxrow.aug20, 
		     TableVIII.maxrow.june22)

TableVIII.infDet.yrs <- c(TableVIII.yrs.sep12,
		 TableVIII.yrs.nov14,
		 TableVIII.yrs.aug16,
		 TableVIII.yrs.sep17,
		 TableVIII.yrs.aug20,
                 TableVIII.yrs.june22)

TableVIII.startdate <- c(TableVIII.startdate.sep12,
		       TableVIII.startdate.nov14,
		       TableVIII.startdate.aug16,
		       TableVIII.startdate.sep17,
		       TableVIII.startdate.aug20,
		       TableVIII.startdate.june22)

#---------- Common arguments ------

TableVIII.infDet.colsno <- c(1:17)
TableVIII.infDet.varnames <- c(month="Months",
		      cpi_general="CPI (General)",
	       inf_p2p="Inflation (Point to point)",
	       inf_12ma="Inflation (12 mo average)",
	       cpi_food="CPI Food",
	       inf_food_p2p="Inflation Food P2P",
	       inf_food_12ma="Inflation Food 12m",
	       cpi_nonfood="CPI Non-food",
	       inf_nonfood_p2p="Inflation Nonfood P2P",
	       inf_nonfood_12ma="Inflation Nonfood 12mo",
	       cpi_cloth_foot="CPI Clothing Footwear",
	       cpi_rent_fuel_light="CPI rent fuel light",
	       cpi_furniture="CPI furniture",
	       cpi_medical="CPI medical",
	       cpi_transport="CPI transport",
	       cpi_recreation="CPI recreation",
	       cpi_misc="CPI misc")
TableVIII.sheet.name  <- c(rep("Table VIII",2),rep("Table VII",4))

#----------------------------------------------- 

#---------- testing whether saving works --------

setwd("~/github-repos/macrobd")

inf20 <- save_bb_dat(path.name=TableVIII.file.list[6],
	    s.sheet.name=TableVIII.sheet.name[6],
	    s.skip.row=TableVIII.skiprow[6],
	    s.max.row=TableVIII.maxrow[6],
	    s.yrs=TableVIII.infDet.yrs[6],
	    s.start.date=TableVIII.startdate[6],
	    s.cols=TableVIII.infDet.colsno,
	    s.var.names=TableVIII.infDet.varnames)


#--------- Combining data -------------------

setwd("~/github-repos/macrobd")

infDet <- get_bb_dat(files=TableVIII.file.list, 
			iter=length(TableVIII.file.list),
			g.sheet.name= TableVIII.sheet.name,
			g.skip.row=TableVIII.skiprow,
			g.max.row=TableVIII.maxrow,
			g.yrs=TableVIII.infDet.yrs,
			g.start.date=TableVIII.startdate,
			g.cols=TableVIII.infDet.colsno,
			g.var.names=TableVIII.infDet.varnames)  %>% 
                       arrange(date)

use_data(infDet, overwrite=TRUE)



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


#TableVII.file.list <- TableVII.file.list[2]

inf_det <- get_bb_dat(files=TableVIII.file.list,
		      iter=length(TableVIII.file.list),
			 sheet.name=TableVIII.sheet.name,
                         skip.row=TableVIII.skiprow,
			 max.row=TableVIII.maxrow,
                        yrs=TableVIII.infDet.yrs,
			 start.date=TableVIII.startdate,
			 var.names=TableVIII.infDet.varnames)
  
use_data(inf_details, overwrite=TRUE)



