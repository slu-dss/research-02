# data
library(ggplot2)

# data tools
library(haven)    # read/write statistical software data
library(readr)    # read/write CSV files
library(readxl)   # read/write XLS files
library(xlsx)     # write XLS files

# other tools
library(here)     # file path management


# load data
auto <- mpg

# write to various formats
write_csv(auto, path = here("data", "mpg.csv"))
write_dta(auto, path = here("data", "mpg.dta"))
write_sas(auto, path = here("data", "mpg.sas7bdat"))
write_sav(auto, path = here("data", "mpg.sav"))
