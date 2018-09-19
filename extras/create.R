# data
library(dplyr)
library(ggplot2)

# data tools
library(haven)    # read/write statistical software data
library(readr)    # read/write CSV files
library(readxl)   # read/write XLS files

# other tools
library(here)     # file path management


# load data
auto <- mpg
theForce <- starwars

# clean starwars data
theForce <- select(theForce, -films, -vehicles, -starships)

# write auto to various formats
write_csv(auto, path = here("data", "raw", "mpg.csv"))
write_dta(auto, path = here("data", "raw", "mpg.dta"))
write_sas(auto, path = here("data", "raw", "mpg.sas7bdat"))
write_sav(auto, path = here("data", "raw", "mpg.sav"))
save(auto, file = here("data", "raw", "mpg.rda"))

# write theForce to various formats
write_csv(theForce, path = here("data", "raw", "starwars.csv"))
write_dta(theForce, path = here("data", "raw", "starwars.dta"))
write_sas(theForce, path = here("data", "raw", "starwars.sas7bdat"))
write_sav(theForce, path = here("data", "raw", "starwars.sav"))
save(theForce, file = here("data", "raw", "starwars.rda"))
