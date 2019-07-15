# Selected economic indicators


# Deposits

depnames=c(month="Months",
dp.dd="Deposits with DMBs from demand deposits",
dp.td="Deposits with DMBs from time deposits")



## 2017 July - 2019 April


path.file <- "./data-raw/2019_july_statisticaltable.xlsx"
data_save_bb(path=path.file,
	     sheet="Table IA",
	     skip=29,max=52,
	     begin="jul17",end="apr19",
	     cols=c(1,9,10),
	     yrs=c("2017-18","2018-19"),
	     start="2017-july",
	     vnames=vnames)




## 2015 July - 2017 June 

path.file <- "./data-raw/statisticaltable_sep2017.xlsx"
data_save_bb(path=path.file,
	     sheet="Table IA",
	     skip=18,max=43,
	     begin="jul15",end="jun17",
	     cols=c(1,9,10),
	     yrs="2016-17",
	     start="2015-july",
	     vnames=vnames)




## 2013 July - 2015 June 


path.file <- "./data-raw/statisticaltable_aug2016.xls"
data_save_bb(path=path.file,
	     sheet="Table IA",
	     skip=25,max=50,
	     begin="jul13",end="jun15",
	     cols=c(1,9,10),
	     yrs="2014-15",
	     start="2013-july",
	     vnames=vnames)


## 2012 July - 2013 June 



# Test the function
sheet="Table IA"
skip=25
max=50
begin="jul12"
end="jun13"
cols=c(1,9,10)
yrs="2014"
start="2012-July"
vnames=c(month="Months",
dp.dd="Deposits with DMBs from demand deposits",
dp.td="Deposits with DMBs from time deposits")


path.file <- "./data-raw/statisticaltable_2014.xls"
data_save_bb(path=path.file,
	     sheet="Table IA",
	     skip=27,max=39,
	     begin="jul12",end="jun13",
	     cols=c(1,9,10),
	     yrs="2014",
	     start="2012-july",
	     vnames=vnames)

## 2010 July - 2012 June 


path.file <- "./data-raw/BB_sep9_2012.xls"
data_save_bb(path=path.file,
	     sheet="Table IA",
	     skip=25,max=50,
	     begin="jul10",end="jun12",
	     cols=c(1,9,10),
	     yrs="2012-13",
	     start="2010-july",
	     vnames=vnames)

## 2009 July - 2010 June 


path.file <- "./data-raw/statisticaltable_dec11.xls"
data_save_bb(path=path.file,
	     sheet="Table IA",
	     skip=25,max=36,
	     begin="jul09",end="jun10",
	     cols=c(1,9,10),
	     yrs="2012-13",
	     start="2009-july",
	     vnames=vnames)

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
money <- get_bb_dat(c(1,14,15), mnames) 
use_data(money, overwrite=TRUE)


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



# Some analysis

money.ts <- as.tsibble(money)

money.ts %>% 
    filter_index("2018" ~ .) %>% 
    ggplot() + geom_line(aes(date, M1,group=""))

deposit.ts  <- as.tsibble(deposit)

deposit.dd <- deposit.ts %>% 
    filter_index("2018" ~ .) %>% 
    ggplot() + 
       geom_line(aes(date,dp.dd,group=""))


deposit.td <- deposit.ts %>% 
    filter_index("2018" ~ .) %>% 
    ggplot() + 
       geom_line(aes(date,dp.td,group=""), color="blue") 

deposit.dd + deposit.td

