# macrobd

<!-- badges: start -->
<!-- badges: end -->

The goal of macrobd is to provide easy access to macro data of Bangladesh. Currently, timeseries data on following variables are available: 

* Inflation (2010 - 2019) (inflation) 
* Foreign Trade (2010 - 2019)  (foreign_trade) 
* Exchange rate (2010 - 2019) (exhange.rate)
* Foreign exchange reserve (2010 - 2019) (foreign_trade)
* Demand deposit (2009 -2019) (demand)
* Monetary variables: M1, M2 (2009 - 2019) (money)


## Installation

`macrobd` is not yet available on CRAN. But you can install the development version by issuing
the following command:

``` 
devtools::install_github("rfaridi/macrobd")
```


Then load the library  by typing in `library(macrobd)` in the console. Afterwards, `inflation`, `foreign_trade` etc will be available in the console.



## Example

```
head(inflation)
head(foreign_trade)
head(exhange.rate)
```


```
library(ggplot2)
library(patchwork)
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
```



