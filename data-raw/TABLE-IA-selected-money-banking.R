#***************************************
#********* TABLE IA ***********
#***************************************

library(tidyverse)

setwd("~/github-repos/macrobd")

file.list <- c("2012_sep_econIndBB.xls",
	       "2014_nov_econIndBB.xls", 
	       "2016_aug_econIndBB.xls",
	       "2017_sep_econIndBB.xlsx",
	       "2020_aug_econIndBB.xlsx",
	       "2022_nov_econIndBB.xlsx")

TableIA.file.list <- file.list
# this is required since we are not using the whole list
#TableIA.file.list  <- TableIA.file.list[1:6]
#----------------------------------------

#---------  2012-sep ------------

# "2012_sep_econIndBB.xls": 2010 July - 2012 June

TableIA.skiprow.sep12 <- 25 
TableIA.maxrow.sep12  <- TableIA.skiprow.sep12 + 25
TableIA.yrs.sep12 <- "2011"
TableIA.startdate.sep12  <- "2010-jul"
TableIA.colsno.sep12 <- 1:74
TableIA.sheetname.sep12 <- "Table IA"

#---------  2014-nov ------------

# "2014_nov_econIndBB.xls": 2012 July -  2013 June

TableIA.skiprow.nov14 <- 27
TableIA.maxrow.nov14  <- TableIA.skiprow.nov14 + 12
TableIA.yrs.nov14 <- " "
TableIA.startdate.nov14  <- "2012-jul"
TableIA.colsno.nov14 <- 1:74
TableIA.sheetname.nov14 <- "Table IA"

#---------  2016-aug ------------

# "2016_aug_econIndBB.xls": 2013 July -  2015 June

TableIA.skiprow.aug16 <- 25 
TableIA.maxrow.aug16  <- TableIA.skiprow.aug16 + 25
TableIA.yrs.aug16 <- "2014"
TableIA.startdate.aug16  <- "2013-jul"
TableIA.colsno.aug16 <- 1:74
TableIA.sheetname.aug16 <- "Table IA"


#---------  2017-sep ------------

# "2017_sep_econIndBB.xlsx": 2015 July -  2017 June

TableIA.skiprow.sep17 <- 18
TableIA.maxrow.sep17 <- TableIA.skiprow.sep17 + 25
TableIA.yrs.sep17 <- "2016"
TableIA.startdate.sep17  <- "2015-jul"
TableIA.colsno.sep17 <- 1:74  
TableIA.sheetname.sep17 <- "Table IA"

#---------  2020-aug ------------

# "2020_aug_econIndBB.xlsx" :  2017 July -  2019 June

TableIA.skiprow.aug20 <- 15 
TableIA.maxrow.aug20 <- TableIA.skiprow.aug20 + 25
TableIA.yrs.aug20 <- "2018|2019|2020"
TableIA.startdate.aug20  <- "2017-jul"
#--- cols 
TableIA.colsno.aug20 <- 1:74
#---
TableIA.sheetname.aug20 <- "Table IA"

#--------- 2022-nov ------------

# "2022_nov_econIndBB.xlsx":  2019 July -  2022 May

TableIA.skiprow.nov22 <- 29 
TableIA.maxrow.nov22 <- 53 
TableIA.yrs.nov22 <- "2020|2021"
TableIA.startdate.nov22  <- "2019-jul"
#--- cols 
TableIA.colsno.nov22 <- 1:74
#---
TableIA.sheetname.nov22  <- "Table IA"



#----------- Combine ------------

TableIA.skiprow  <- c(TableIA.skiprow.sep12,
		      TableIA.skiprow.nov14,
		      TableIA.skiprow.aug16,
		      TableIA.skiprow.sep17,
		      TableIA.skiprow.aug20, 
                      TableIA.skiprow.nov22)

TableIA.maxrow  <- c(TableIA.maxrow.sep12,
		     TableIA.maxrow.nov14,
		     TableIA.maxrow.aug16,
		     TableIA.maxrow.sep17,
		     TableIA.maxrow.aug20, 
		     TableIA.maxrow.nov22)

TableIA.yrs <- c(TableIA.yrs.sep12,
		 TableIA.yrs.nov14,
		 TableIA.yrs.aug16,
		 TableIA.yrs.sep17,
		 TableIA.yrs.aug20,
                 TableIA.yrs.nov22)

TableIA.startdate <- c(TableIA.startdate.sep12,
		       TableIA.startdate.nov14,
		       TableIA.startdate.aug16,
		       TableIA.startdate.sep17,
		       TableIA.startdate.aug20,
		       TableIA.startdate.nov22)

TableIA.colsno <-  list(TableIA.colsno.sep12,
		       TableIA.colsno.nov14,
		       TableIA.colsno.aug16,
		       TableIA.colsno.sep17,
		       TableIA.colsno.aug20,
		       TableIA.colsno.nov22)

TableIA.sheetname <- c(TableIA.sheetname.sep12,
		       TableIA.sheetname.nov14,
		       TableIA.sheetname.aug16,
		       TableIA.sheetname.sep17,
		       TableIA.sheetname.aug20,
		       TableIA.sheetname.nov22)


#---------- Common arguments ------


TableIA.varnames=c(month="Months",
		       bb_notes="Bangladesh Bank (BB) Notes",
		       govt_notes_coins="Government Notes and Coins",
		       total12="Total (1+2)",
		       currency_tbills="Currency in TBills of DMBs",
		       currency_out_bank="Currency outside bank 3-4",
		       deposit_banks= "Deposits with DMBs (From Bank)",
		       deposit_govt= "Deposits with DMBs (From Govt)",
		       deposit_others_dd= "Deposits with DMBs (Others-demand deposits)",
		       deposit_others_td= "Deposits with DMBs (Others-time deposits)",
		       deposit_others_total= "Deposits with DMBs (Others-total (8+9))",
		       deposit_total= "Deposits with DMBs (total (7+10))",
		       deposit_bb= "Deposits with BB other than DMBs",
		       money_aggs_reserve="Monetary aggregates - Reserve Money",
		       money_aggs_m1="Monetary aggregates - Narrow Money(M1) 5+8+12",
		       money_aggs_m2="Monetary aggregates - Broad Money(M2) 9+14",
		       money_aggs_m3="Monetary aggregates - Broad Money(M3)",
		       end_of_period2="End of period",
		       dmbs_advances_banks="DMBs advances to banks",
		       dmbs_advances_pub="DMBs advances to public",
		       dmbs_advances_pvt="DMBs advances to private",
		       dmbs_advances_total="DMBs total advances (exluding interbank) (19+19) ",
		       import_bills_intbank="Import  - Interbank bills",
		       import_bills_public="Import - public bills",
		       import_bills_pvt="Import - private bills",
		       total_bills="Import - total bills (excluding interbank) (22+23)",
		       dmbs_inv_intbank="DMBs investment - Inter Bank",
		       dmbs_inv_public="DMBs investment - public",
		       dmbs_inv_pvt="DMBs investment - private",
		       dmbs_inv_total="DMBs investment - total investment (excluding interbank) (26+27)",
		       dmbs_credit_banks="DMBs credit - To banks (17+21+25)",
		       dmbs_credit_public="DMBs credit - To public",
		       dmbs_credit_pvt="DMBs credit - To private",
		       dmbs_credit_total="DMBs investment - total credit (excluding interbank) ",
		       end_of_period3="End of period",
		       dmbs_borrow_govt="DMBs borrowings - From Government",
		       dmbs_borrow_bb="DMBs borrowings - From BB",
		       dmbs_borrow_intbank="DMBs borrowings - From inter-banks",
		       dmbs_borrow_other="DMBs borrowings - From other financial institutions",
		       #dmbs_borrow_total="DMBs borrowings - Total (excluding BSBL and interbank)",
		       dmbs_liability_deposits="DMBs liabilities - Deposits",
		       dmbs_liability_stFCdeposit="DMBs liabilities - Short Term FC Deposits",
		       dmbs_liability_total="DMBs liabilities - total",
		       balance_bb_crr= "Balance with BB - cash reserve requirement",
		       balance_bb_er= "Balance with BB - excess reserve",
		       balance_bb_total= "Balance with BB - total",
		       dmbs_total_asset_liab= "DMBs total assests and liabilities",
		       cash_base_economy= "Cash base of the economy",
		       bank2govt_credit_bb_loans= "Total credit to government (Gross) by the banking system - BB - Loans and advances",
		       bank2govt_credit_bb_inv= "Total credit to government (Gross) by the banking system - BB - investments",
		       bank2govt_credit_dmbs_loans= "Total credit to government (Gross) by the banking system - DMBs - Loans and advances",
		       bank2govt_credit_dmbs_inv= "Total credit to government (Gross) by the banking system - DMBs - investments",
		       bank2govt_credit_total= "Total credit to government (Gross) by the banking system - Total",
		       end_of_period4="End of period",
		       per_chg_credit_govt="Percentage change over end of the last June - Credit (net) to government",
		       per_chg_credit_pub="Percentage change over end of the last June - Credit (net) to other public sector",
		       per_chg_credit_pvt="Percentage change over end of the last June - Credit (net) to private sector",
		       per_chg_dom_credit="Percentage change over end of the last June - Total domestic credit",
		       per_chg_tot_liquid="Percentage change over end of the last June - total liquidity",
		       income_velocity="Income velocity of money",
		       bank_clearing_amount="Banks' clearing house A/C during the period - Amounts",
		       bank_clearing_instruments="Banks' clearing house A/C during the period - no. of instruments",
		       bank_branches = "Total no. of bank branches",
		       bank_branches_soe = "Total no. of state owned bank branches",
		       ratio_dmbs_credit="Ratio of DMBs credit to deposits (in percent)",
		       deposits_per_branch="Average deposits per DMB Branch",
		       credits_per_branch="Average credits per DMB Branch",
		       ratio_cash_balance="Ratio of Cash in hand and balances with the BB to Deposits (in percent)",
		       bank_rate="Bank rate",
		       int_rate_deposits="Deposit rate of interest of Scheduled Banks (Weighted Average)",
		       int_rate_advances="Loans rate of interest of Scheduled Banks (Weighted Average)",
		       int_rate_spread="Spread of interest of Scheduled Banks (Weighted Average)",
		       nbfi_int_rate_deposits="NBFI Deposit rate of interest of (Weighted Average)",
		       nbfi_int_rate_advances="NBFI Loans rate of interest  (Weighted Average)",
		       nbfi_int_rate_spread="NBFI Spread of interest  (Weighted Average)")

#--- checking whether var no and current column in excel matches
excel_cols <- c(LETTERS,paste0("A",LETTERS),paste0("B",LETTERS))
current_var <- str_which(excel_cols,"^BV$")
current_var
var_length <- length(names(TableIA.varnames))
var_length
var_length == current_var
# upto AI clear, end of period3
# upto AP clear, total deposit liabilities, dmbs_liability_total
# upto BA clear, end of period 4 
#---------------------------------------------------------------

#---------- testing whether saving works --------

setwd("~/github-repos/macrobd")

saveIA <- save_bb_dat(path.name=TableIA.file.list[5],
	    s.sheetname=TableIA.sheetname[5],
	    s.skiprow=TableIA.skiprow[5],
	    s.maxrow=TableIA.maxrow[5],
	    s.yrs=TableIA.yrs[5],
	    s.startdate=TableIA.startdate[5],
	    s.cols=TableIA.colsno[5],
	    s.varnames=TableIA.varnames)



#--------- Combining data -------------------

setwd("~/github-repos/macrobd")
iter_spec <- 1:6
tableIA_ind_money <- get_bb_dat(files=TableIA.file.list, 
			iter=iter_spec,
			g.sheetname= TableIA.sheetname,
			g.skiprow=TableIA.skiprow,
			g.maxrow=TableIA.maxrow,
			g.yrs=TableIA.yrs,
			g.startdate=TableIA.startdate,
			g.cols=TableIA.colsno,
			g.varnames=TableIA.varnames)  %>% 
                       arrange(date)


use_data(tableIA_ind_money, overwrite=TRUE)



