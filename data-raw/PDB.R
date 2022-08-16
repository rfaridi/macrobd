pdb <- read_excel("~/Downloads/pdb_max_gen.xlsx")

pdb %>% 
  slice(-1) %>% 
  set_names("v1") %>% 
  separate(v1,c("date","mw"),":") %>% 
  mutate(mw=str_replace(mw,"MW",""),
         mw=as.numeric(mw),
         date=as.Date(date)
         )  -> pdb_cl 

pdb_cl %>% 
  arrange(-mw)

pdb_cl %>% 
  arrange(mw)
