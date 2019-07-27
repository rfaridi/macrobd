# macrobd

<!-- badges: start -->
<!-- badges: end -->

The goal of macrobd is to ...

## Installation

`macrobd` is not yet available on CRAN. But you can install the development version by issuing
the following command:

``` 
devtools::install_github("rfarid/macrobd")
```

## Example

```
head(deposit)
head(money)
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



