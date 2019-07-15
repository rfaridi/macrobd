# Selected economic indicators


# Deposits

depnames=c(month="Months",
dp.dd="Deposits with DMBs from demand deposits",
dp.td="Deposits with DMBs from time deposits")




file.list <- c("2019_june_statisticaltable.xlsx","statisticaltable_sep2017.xlsx", "statisticaltable_aug2016.xls","statisticaltable_2014.xls","BB_sep9_2012.xls","statisticaltable_dec11.xls")

skip  <- c(29,18,25,27,25,24)
max  <- c(52,43,50,39,50,36)
begin=c("jul17","jul15","jul13","jul12", "jul10", "jul09")
end=c("apr19","jun17","jun15","jun13","jun12","jun10")
yrs <- c("2018-19","2016-17","2014-15","2014","2011","2008")
start <- paste0(c(2017,2015,2013,2012,2010,2009),"-july")

get_bb_dat  <- function(cols,vnames) {
    dat <- data.frame()
    print(file.list)
    for(i in 1:length(file.list)) {
    print(paste0("This no ", i, " file is imported from ", start[i]))
    path.file <- paste0("./data-raw/",file.list[i])
    print(paste0("The file is ", path.file))
    new.dat <- data_save_bb(path=path.file,
	     sheet="Table IA",
	     skip=skip[i],max=max[i],
	     begin=begin[i],end=end[i],
	     cols=cols,
	     yrs=yrs[i],
	     start=start[i],
	     vnames=vnames)
    dat <- rbind(new.dat,dat)
    }
return(dat)
}

deposit <- get_bb_dat(c(1,9,10), depnames) 
use_data(deposit, overwrite=TRUE)

# Narrow and broad money

mnames=c(month="Months",M1="Narrow money",M2="Broad money")

money <- data.frame()
for(i in 1:length(file.list)) {
print(paste0("This no ", i, " file is imported from ", start[i]))
path.file <- paste0("./data-raw/",file.list[i])
print(paste0("The file is ", path.file))
new.dat <- data_save_bb(path=path.file,
	     sheet="Table IA",
	     skip=skip[i],max=max[i],
	     begin=begin[i],end=end[i],
	     cols=c(1,14,15),
	     yrs=yrs[i],
	     start=start[i],
	     vnames=vnames)
money <- rbind(new.dat,deposit)
}

use_data(money, overwrite=TRUE)



