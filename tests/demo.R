save_bb_dat <- function(path.name=NULL,
			sheet.name=NULL,
			skip.row=NULL,
			max.row=NULL,
			cols_no=NULL,
			yrs=NULL,
			start.date=NULL,
			var.names=NULL){

path.name  <- "2022_june_econIndBB.xlsx"
sheet.name <- "Table IB"
max.row <- 54
skip.row <- 31
read.row <- max.row - skip.row
cols_no <- c(1,2,3,4,5)
start.date <- "2020-aug"
var.names=c(month="Months",
inf_p2p_05="Point to point with base 2005-2006",
inf_p2p_95="Point to point with base 1995-96",
inf_12m_05="12-Month average base 2005-2006",
inf_12m_95="12-Month average base 1995-96")
yrs <- "2021-22"

read.df <- read_excel(path.name, sheet=sheet.name,skip=skip.row,n_max=read.row, col_names=FALSE)
read.df.clean <- read.df %>% 
		janitor::remove_empty("cols") %>% 
		janitor::remove_empty("rows") %>% 
                dplyr::select(all_of(cols_no)) 
names(read.df.clean)  <- names(var.names)
read.df.clean <- read.df.clean %>% 
		    dplyr::filter(!str_detect(month,yrs)) 
date.zoo <- zoo::zooreg(1:nrow(read.df.clean),
	    zoo::as.yearmon(start.date,format="%Y-%B"),freq=12)
new.df  <-  read.df.clean %>% 
		mutate(date=zoo::index(date.zoo),
		       date=lubridate::as_date(date)) %>% 
		dplyr::select(-month) %>% 
		dplyr::select(date,everything()) %>% 
		mutate_at(vars(-date),as.numeric)

# Now testing inf details

path.name  <- "2022_june_econIndBB.xlsx"
sheet.name <- "Table VII"
max.row <- 51 
skip.row <- 14
read.row <- max.row - skip.row
start.date <- "2020-aug"
yrs <- "2021-22"
cols_no <- cols <-  1:length(var.names)
var.names=c(month="Months",
		      cpi_general="CPI general",
	       inf_p2p="inf_p2p",
	       inf_12ma="inf_12ma",
	       cpi_food="cpi_food",
	       inf_food_p2p="inf_food_p2p",
	      inf_food_12ma="inf_food_12ma",
	       cpi_nonfood="cpi_nonfood",
	       inf_nonfood_p2p="inf_nonfood_p2p",
	       inf_nonfood_12ma="inf_nonfood_12ma",
	       cpi_cloth_foot="cpi_cloth_foot",
	       cpi_rent_fuel_light="cpi_rent_fuel_light",
	       cpi_furniture="cpi_furniture",
	       cpi_medical="cpi_medical",
	       cpi_transport="cpi_transport",
	       cpi_recreation="cpi_recreation",
	       cpi_misc="cpi_misc")
cols_no <- 1:length(var.names)
read.df <- read_excel(path.name, 
		      sheet=sheet.name,
		      skip=skip.row,
		      n_max=read.row, 
		      col_names=FALSE)
read.df.clean <- read.df %>% 
		janitor::remove_empty("cols") %>% 
		janitor::remove_empty("rows") %>% 
                dplyr::select(all_of(cols_no)) 

names(read.df.clean)  <- names(var.names)
read.df.clean <- read.df.clean %>% 
		    dplyr::filter(!str_detect(month,yrs)) 
date.zoo <- zoo::zooreg(1:nrow(read.df.clean),
	    zoo::as.yearmon(start.date,format="%Y-%B"),freq=12)
new.df  <-  read.df.clean %>% 
		mutate(date=zoo::index(date.zoo),
		       date=lubridate::as_date(date)) %>% 
		dplyr::select(-month) %>% 
		dplyr::select(date,everything()) %>% 
		mutate_at(vars(-date),as.numeric)

TableVII.file.list <- c("2022_june_econIndBB.xlsx",
          "2021_feb_econIndBB.xlsx",
          "2019_june_econIndBB.xlsx",
          "2017_sep_econIndBB.xlsx",
	  "2016_aug_econIndBB.xls")

full.path.name <- glue::glue("./data-raw/{path.name}")

save_bb_dat(full.path.name,
	     sheet.name,skip.row,max.row,
	     cols_no=cols,yrs,start.date,var.names)



			 sheet.name="Table VII"
                         skip.row=TableVII.skiprow
			 max.row=TableVII.maxrow
			 cols=cols
                         yrs=TableVII.yrs
			 start.date=TableVII.startdate
			 var.names=infDet.var.names
inf_det <- get_bb_dat(files=TableVII.file.list[1],
		      iter=length(TableVII.file.list),
			 sheet.name="Table VII",
                         skip.row=TableVII.skiprow,
			 max.row=TableVII.maxrow,
			 cols=cols,
                         yrs=TableVII.yrs,
			 start.date=TableVII.startdate,
			 var.names=infDet.var.names)

TableVII.file.list <- c("2022_june_econIndBB.xlsx",
          "2021_feb_econIndBB.xlsx",
          "2019_june_econIndBB.xlsx",
          "2017_sep_econIndBB.xlsx",
	  "2016_aug_econIndBB.xls")

files=TableVII.file.list[1]
iter=length(TableVII.file.list)

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

dat <- data.frame()
iter <- length(TableVII.file.list)
    for(i in 1:iter) {
    print(paste0("This no ", i, " file")) 
    path <- paste0("./data-raw/",files[i])
    print(paste0("The path of  file is ", path))
read.row <- TableVII.maxrow[i] - TableVII.skiprow[i]
read.df <- read_excel(path, sheet=TableVII.sheetname,skip=TableVII.skiprow[i],n_max=read.row[i], col_names=FALSE)
read.df.clean <- read.df %>% 
		janitor::remove_empty("cols") %>% 
		janitor::remove_empty("rows") %>% 
                dplyr::select(all_of(cols_no)) 
names(read.df.clean)  <- names(var.names)
read.df.clean <- read.df.clean %>% 
		    dplyr::filter(!str_detect(month,yrs)) 
date.zoo <- zoo::zooreg(1:nrow(read.df.clean),
	    zoo::as.yearmon(start.date,format="%Y-%B"),freq=12)
new.df  <-  read.df.clean %>% 
		mutate(date=zoo::index(date.zoo),
		       date=lubridate::as_date(date)) %>% 
		dplyr::select(-month) %>% 
		dplyr::select(date,everything()) %>% 
		mutate_at(vars(-date),as.numeric)

    new.dat <- save_bb_dat(path.name=path,
	     sheet.name,skip.row[i],max.row[i],
	     cols_no=cols,yrs[i],start.date[i],var.names)
    dat <- rbind(new.dat,dat)
    }


