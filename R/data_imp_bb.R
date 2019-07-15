data_imp_bb  <- function(path.name,sheet.name,skip.row,max.row,start.time,end.time) {
        read.row <- max.row - skip.row
    read.df <- read_excel(path.name, sheet=sheet.name,skip=skip.row,n_max=read.row, col_names=FALSE)
    read.df.clean <- read.df %>% 
		janitor::remove_empty("cols") %>% 
		janitor::remove_empty("rows") 
return(read.df.clean)
}


