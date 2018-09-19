Reproducible Research in R, Lesson 2
================
Christy Garcia, Ph.D. and Christopher Prener, Ph.D.
(September 19, 2018)

## Introduction

This is the notebook for the second session of the Reproducible Research
in `R` DSS seminar. This notebook covers skills related to managing file
paths and importing data from various sources.

## Dependencies

This notebook requires three packages from the `tidyverse` as well as an
additional package:

``` r
# tidyverse packages
library(dplyr)     # for the starwars data
```

    ## 
    ## Attaching package: 'dplyr'

    ## The following objects are masked from 'package:stats':
    ## 
    ##     filter, lag

    ## The following objects are masked from 'package:base':
    ## 
    ##     intersect, setdiff, setequal, union

``` r
library(ggplot2)   # for the mpg data
library(haven)     # read statistical data files
library(readr)     # read flat files (csv, tsv)
library(readxl)    # read excel files

# manage file paths
library(here)      # manage file paths
```

    ## here() starts at /Users/chris/GitHub/DSS/research-02

## Quick Review

The following was covered during the [first
lesson](http://github.com/slu-dss/research-01).

### Importing Objects

Today, we’re going to work with the `mpg` data from the `ggplot2`
package. Remember that we can load data by assigning it to an object.
Once `ggplot2` has been opened with the `library()` function as above,
we can assign it to an object in our environment:

``` r
auto <- mpg
```

Now try loading the `starwars` data from the `dplyr` package and
assigning it to a new object in your global environment. Name your new
object `theForce` (using camelCase):

``` r
theForce <- starwars
```

## Exploring Data

Remember that you can click on an object in the `Enviornment` tab to
view it. You can also use the `str()` function to explore its
    contents:

``` r
str(auto)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    234 obs. of  11 variables:
    ##  $ manufacturer: chr  "audi" "audi" "audi" "audi" ...
    ##  $ model       : chr  "a4" "a4" "a4" "a4" ...
    ##  $ displ       : num  1.8 1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 ...
    ##  $ year        : int  1999 1999 2008 2008 1999 1999 2008 1999 1999 2008 ...
    ##  $ cyl         : int  4 4 4 4 6 6 6 4 4 4 ...
    ##  $ trans       : chr  "auto(l5)" "manual(m5)" "manual(m6)" "auto(av)" ...
    ##  $ drv         : chr  "f" "f" "f" "f" ...
    ##  $ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
    ##  $ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
    ##  $ fl          : chr  "p" "p" "p" "p" ...
    ##  $ class       : chr  "compact" "compact" "compact" "compact" ...

Now try using the `str()` function to explore the data stored in
`theForce`:

``` r
str(theForce)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    87 obs. of  13 variables:
    ##  $ name      : chr  "Luke Skywalker" "C-3PO" "R2-D2" "Darth Vader" ...
    ##  $ height    : int  172 167 96 202 150 178 165 97 183 182 ...
    ##  $ mass      : num  77 75 32 136 49 120 75 32 84 77 ...
    ##  $ hair_color: chr  "blond" NA NA "none" ...
    ##  $ skin_color: chr  "fair" "gold" "white, blue" "white" ...
    ##  $ eye_color : chr  "blue" "yellow" "red" "yellow" ...
    ##  $ birth_year: num  19 112 33 41.9 19 52 47 NA 24 57 ...
    ##  $ gender    : chr  "male" NA NA "male" ...
    ##  $ homeworld : chr  "Tatooine" "Tatooine" "Naboo" "Tatooine" ...
    ##  $ species   : chr  "Human" "Droid" "Droid" "Human" ...
    ##  $ films     :List of 87
    ##   ..$ : chr  "Revenge of the Sith" "Return of the Jedi" "The Empire Strikes Back" "A New Hope" ...
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace" "Revenge of the Sith" "Return of the Jedi" ...
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace" "Revenge of the Sith" "Return of the Jedi" ...
    ##   ..$ : chr  "Revenge of the Sith" "Return of the Jedi" "The Empire Strikes Back" "A New Hope"
    ##   ..$ : chr  "Revenge of the Sith" "Return of the Jedi" "The Empire Strikes Back" "A New Hope" ...
    ##   ..$ : chr  "Attack of the Clones" "Revenge of the Sith" "A New Hope"
    ##   ..$ : chr  "Attack of the Clones" "Revenge of the Sith" "A New Hope"
    ##   ..$ : chr "A New Hope"
    ##   ..$ : chr "A New Hope"
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace" "Revenge of the Sith" "Return of the Jedi" ...
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace" "Revenge of the Sith"
    ##   ..$ : chr  "Revenge of the Sith" "A New Hope"
    ##   ..$ : chr  "Revenge of the Sith" "Return of the Jedi" "The Empire Strikes Back" "A New Hope" ...
    ##   ..$ : chr  "Return of the Jedi" "The Empire Strikes Back" "A New Hope" "The Force Awakens"
    ##   ..$ : chr "A New Hope"
    ##   ..$ : chr  "The Phantom Menace" "Return of the Jedi" "A New Hope"
    ##   ..$ : chr  "Return of the Jedi" "The Empire Strikes Back" "A New Hope"
    ##   ..$ : chr "A New Hope"
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace" "Revenge of the Sith" "Return of the Jedi" ...
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace" "Revenge of the Sith" "Return of the Jedi" ...
    ##   ..$ : chr  "Attack of the Clones" "Return of the Jedi" "The Empire Strikes Back"
    ##   ..$ : chr "The Empire Strikes Back"
    ##   ..$ : chr "The Empire Strikes Back"
    ##   ..$ : chr  "Return of the Jedi" "The Empire Strikes Back"
    ##   ..$ : chr "The Empire Strikes Back"
    ##   ..$ : chr  "Return of the Jedi" "The Force Awakens"
    ##   ..$ : chr "Return of the Jedi"
    ##   ..$ : chr "Return of the Jedi"
    ##   ..$ : chr "Return of the Jedi"
    ##   ..$ : chr "Return of the Jedi"
    ##   ..$ : chr "The Phantom Menace"
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace" "Revenge of the Sith"
    ##   ..$ : chr "The Phantom Menace"
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace"
    ##   ..$ : chr "The Phantom Menace"
    ##   ..$ : chr "The Phantom Menace"
    ##   ..$ : chr "The Phantom Menace"
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace"
    ##   ..$ : chr "The Phantom Menace"
    ##   ..$ : chr "The Phantom Menace"
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace"
    ##   ..$ : chr "The Phantom Menace"
    ##   ..$ : chr "Return of the Jedi"
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace" "Revenge of the Sith"
    ##   ..$ : chr "The Phantom Menace"
    ##   ..$ : chr "The Phantom Menace"
    ##   ..$ : chr "The Phantom Menace"
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace" "Revenge of the Sith"
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace" "Revenge of the Sith"
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace" "Revenge of the Sith"
    ##   ..$ : chr  "The Phantom Menace" "Revenge of the Sith"
    ##   ..$ : chr  "The Phantom Menace" "Revenge of the Sith"
    ##   ..$ : chr  "The Phantom Menace" "Revenge of the Sith"
    ##   ..$ : chr "The Phantom Menace"
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace" "Revenge of the Sith"
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace"
    ##   ..$ : chr "Attack of the Clones"
    ##   ..$ : chr "Attack of the Clones"
    ##   ..$ : chr "Attack of the Clones"
    ##   ..$ : chr  "Attack of the Clones" "Revenge of the Sith"
    ##   ..$ : chr  "Attack of the Clones" "Revenge of the Sith"
    ##   ..$ : chr "Attack of the Clones"
    ##   ..$ : chr "Attack of the Clones"
    ##   ..$ : chr  "Attack of the Clones" "Revenge of the Sith"
    ##   ..$ : chr  "Attack of the Clones" "Revenge of the Sith"
    ##   ..$ : chr "Attack of the Clones"
    ##   ..$ : chr "Attack of the Clones"
    ##   ..$ : chr "Attack of the Clones"
    ##   ..$ : chr "Attack of the Clones"
    ##   ..$ : chr "Attack of the Clones"
    ##   ..$ : chr "Attack of the Clones"
    ##   ..$ : chr "The Phantom Menace"
    ##   ..$ : chr  "Attack of the Clones" "Revenge of the Sith"
    ##   ..$ : chr "Attack of the Clones"
    ##   ..$ : chr "Attack of the Clones"
    ##   ..$ : chr  "Attack of the Clones" "Revenge of the Sith"
    ##   ..$ : chr "Revenge of the Sith"
    ##   ..$ : chr "Revenge of the Sith"
    ##   ..$ : chr  "Revenge of the Sith" "A New Hope"
    ##   ..$ : chr  "Attack of the Clones" "Revenge of the Sith"
    ##   ..$ : chr "Revenge of the Sith"
    ##   ..$ : chr "The Force Awakens"
    ##   ..$ : chr "The Force Awakens"
    ##   ..$ : chr "The Force Awakens"
    ##   ..$ : chr "The Force Awakens"
    ##   ..$ : chr "The Force Awakens"
    ##   ..$ : chr  "Attack of the Clones" "The Phantom Menace" "Revenge of the Sith"
    ##  $ vehicles  :List of 87
    ##   ..$ : chr  "Snowspeeder" "Imperial Speeder Bike"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Imperial Speeder Bike"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Tribubble bongo"
    ##   ..$ : chr  "Zephyr-G swoop bike" "XJ-6 airspeeder"
    ##   ..$ : chr 
    ##   ..$ : chr "AT-ST"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Snowspeeder"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Tribubble bongo"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Sith speeder"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Flitknot speeder"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Koro-2 Exodrive airspeeder"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Tsmeu-6 personal wheel bike"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##  $ starships :List of 87
    ##   ..$ : chr  "X-wing" "Imperial shuttle"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "TIE Advanced x1"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "X-wing"
    ##   ..$ : chr  "Jedi starfighter" "Trade Federation cruiser" "Naboo star skiff" "Jedi Interceptor" ...
    ##   ..$ : chr  "Trade Federation cruiser" "Jedi Interceptor" "Naboo fighter"
    ##   ..$ : chr 
    ##   ..$ : chr  "Millennium Falcon" "Imperial shuttle"
    ##   ..$ : chr  "Millennium Falcon" "Imperial shuttle"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "X-wing"
    ##   ..$ : chr "X-wing"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Slave 1"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Millennium Falcon"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "A-wing"
    ##   ..$ : chr 
    ##   ..$ : chr "Millennium Falcon"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Naboo Royal Starship"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Scimitar"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Jedi starfighter"
    ##   ..$ : chr 
    ##   ..$ : chr "Naboo fighter"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "Belbullab-22 starfighter"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr "T-70 X-wing fighter"
    ##   ..$ : chr 
    ##   ..$ : chr 
    ##   ..$ : chr  "H-type Nubian yacht" "Naboo star skiff" "Naboo fighter"

## Loading Data from an R data file

Sometimes data for `R` is distributed as a `.rda` or “R data file”. We
can load it using the `load()` function:

``` r
load(file = here("data", "raw", "mpg.rda"))
```

Now you try to load `data/raw/starwars.rda`:

``` r
load(file = here("data", "raw", "starwars.rda"))
```

## Loading Data from a csv file

We often see data distributed in plain-text formats (yay\!) like “comma
delimited text files”, or `.csv` files. These look like spreadsheets and
can be opened using Microsoft Excel and similar tools. They are
lightweight, portable, and plain text, which makes them ideal for
working with.

We can use the `readr::read_csv()` function to open them. `readr` is a
`tidyverse` package for opening “flat” files like comma and tab
separated formats. We can open the most common of these, `.csv` files,
with `read_csv()`:

``` r
auto_csv <- read_csv(file = here("data", "raw", "mpg.csv"))
```

    ## Parsed with column specification:
    ## cols(
    ##   manufacturer = col_character(),
    ##   model = col_character(),
    ##   displ = col_double(),
    ##   year = col_integer(),
    ##   cyl = col_integer(),
    ##   trans = col_character(),
    ##   drv = col_character(),
    ##   cty = col_integer(),
    ##   hwy = col_integer(),
    ##   fl = col_character(),
    ##   class = col_character()
    ## )

Notice how `read_csv` parses the file and makes its best guess about the
type of data in each variable. This can be optionally overridden using a
technique that we’ll cover below with Excel file.

Now you try to load `data/raw/starwars.csv`:

``` r
theForce_csv <- read_csv(file = here("data", "raw", "starwars.csv"))
```

    ## Parsed with column specification:
    ## cols(
    ##   name = col_character(),
    ##   height = col_integer(),
    ##   mass = col_double(),
    ##   hair_color = col_character(),
    ##   skin_color = col_character(),
    ##   eye_color = col_character(),
    ##   birth_year = col_double(),
    ##   gender = col_character(),
    ##   homeworld = col_character(),
    ##   species = col_character()
    ## )

## Loading Data from Statistical Software

The `haven` package from the `tidyverse` comes with tools to load SAS,
SPSS, and *older* Stata files (use `saveold`). All of the functions work
in relatively identical fashion

  - `read_sas()` for SAS `.sas7bdat` files
  - `read_sav()` for SPSS `.sav` files
  - `read_dta()` for Stata `.dta` files

<!-- end list -->

``` r
auto_sas <- read_sas(data_file = here("data", "raw", "mpg.sas7bdat"))
auto_sav <- read_sav(file = here("data", "raw", "mpg.sav"))
auto_dta <- read_dta(file = here("data", "raw", "mpg.dta"))
```

When metadata for specific variables is present, they will be attached
to variables as “attributes”.

Now you try to
load:

  - `data/raw/starwars.sas7bdat`
  - `data/raw/starwars.sav`
  - `data/raw/starwars.dta`

<!-- end list -->

``` r
theForce_sas <- read_sas(data_file = here("data", "raw", "starwars.sas7bdat"))
theForce_sav <- read_sav(file = here("data", "raw", "starwars.sav"))
theForce_dta <- read_dta(file = here("data", "raw", "starwars.dta"))
```

## Loading Excel Spreadsheets

There are a number of tools for reading Excel spreadsheet files. We’ll
use the `readxl` package from the `tidyverse`. At its most basic,

``` r
auto_xls <- read_excel(path = here("data", "raw", "mpg.xls"))
```

For multi-sheet Excel files, we can optionally identify the sheet we
wish to import. For example, we can import the `mpg`
sheet:

``` r
auto_xlsx <- read_excel(path = here("data", "raw", "mpg.xlsx"), sheet = "mpg")
```

Now you try importing the `mfr` sheet from
`data/raw/mpg.xlsx`:

``` r
mfr_xlsx <- read_excel(path = here("data", "raw", "mpg.xlsx"), sheet = "mfr")
```

There are also two sheets - `starwars` and `films` - in
`data/raw/starwars.xlsx` that you can practice on as well as an older
`.xls` file that has one sheet named `starwars` in
`data/raw/starwars.xls`.

``` r
theForce_xls <- read_excel(path = here("data", "raw", "starwars.xls"))
theForce_xlsx <- read_excel(path = here("data", "raw", "starwars.xlsx"), sheet = "starwars")
films_xlsx <- read_excel(path = here("data", "raw", "starwars.xlsx"), sheet = "films")
```

### Problems With Excel

#### Metadata at Top of Sheet

Often we see data released in Excel format with metadata in the first
few rows - this is the case with `Sheet1` in both
`data/raw/mpg_messy.xlsx` and `data/raw/starwars_messy.xlsx`. We do not
want to add this in because it violates “tidy” data principles, and it
also prevents `R` from parsing the spreadsheet correctly.

We can skip that metadata second row with `skip = 9`, which will start
reading data in at row
10:

``` r
auto_meta <- read_excel(path = here("data", "raw", "mpg_messy.xlsx"), sheet = "Sheet1", skip = 9)
```

Now you try to fix the same issue with `Sheet` from
`starwars_messy.xlsx`. Be sure to identify the appropriate number of
rows to
skip\!

``` r
theForce_meta <- read_excel(path = here("data", "raw", "starwars_messy.xlsx"), sheet = "Sheet1", skip = 7)
```

#### A Problematic Second Row

Sometimes there is extra data appended to the second row - this is the
case with `Sheet2` in both `data/raw/mpg_messy.xlsx` and
`data/raw/starwars_messy.xlsx`.

We can skip that second row with `skip = 2`, which will start reading
data in at row
3:

``` r
auto_row2 <- read_excel(path = here("data", "raw", "mpg_messy.xlsx"), sheet = "Sheet2", skip = 2)

str(auto_row2)
```

    ## Classes 'tbl_df', 'tbl' and 'data.frame':    233 obs. of  11 variables:
    ##  $ audi    : chr  "audi" "audi" "audi" "audi" ...
    ##  $ a4      : chr  "a4" "a4" "a4" "a4" ...
    ##  $ 1.8     : num  1.8 2 2 2.8 2.8 3.1 1.8 1.8 2 2 ...
    ##  $ 1999    : num  1999 2008 2008 1999 1999 ...
    ##  $ 4       : num  4 4 4 6 6 6 4 4 4 4 ...
    ##  $ auto(l5): chr  "manual(m5)" "manual(m6)" "auto(av)" "auto(l5)" ...
    ##  $ f       : chr  "f" "f" "f" "f" ...
    ##  $ 18      : num  21 20 21 16 18 18 18 16 20 19 ...
    ##  $ 29      : num  29 31 30 26 26 27 26 25 28 27 ...
    ##  $ p       : chr  "p" "p" "p" "p" ...
    ##  $ compact : chr  "compact" "compact" "compact" "compact" ...

The values in row 3 get applied as the variable names, which is not
ideal. We can use the `col_names` argument to specify how we want our
columns
named:

``` r
auto_row2 <- read_excel(path = here("data", "raw", "mpg_messy.xlsx"), sheet = "Sheet2", skip = 2, 
                        col_names = c("mfr", "model", "displ", "year", "cyl", "trans", "drv", 
                                      "cty", "hwy", "fl", "class"))
```

Now you try. `Sheet2` of `starwars_messy.xlsx` has the same exact
problem. The appropriate variable names should be:

“name”, “height”, “mass”, “hair\_color”, “skin\_color”, “eye\_color”,
“birth\_year”, “gender”, “homeworld”,
“species”

``` r
theForce_row2 <- read_excel(path = here("data", "raw", "starwars_messy.xlsx"), sheet = "Sheet2", skip = 2, 
                        col_names = c("name", "height", "mass", "hair_color", "skin_color", "eye_color", 
                                      "birth_year", "gender", "homeworld", "species"))
```

#### A Summary Row

Sometimes, Excel users will append summary statistics to the bottom of a
data table - this is the case with `Sheet3` in both
`data/raw/mpg_messy.xlsx` and `data/raw/starwars_messy.xlsx`. We do not
want to add this in because it violates “tidy” data principles. We can
see this in

We can skip it by using the `range=` argument and specifying the
upper-left corner and lower-right corner of the data within the
spreadsheet we wish to include. The first cell (`A1`) and the last
(`K235`) should be separated by a
colon:

``` r
auto_sum <- read_excel(path = here("data", "raw", "mpg_messy.xlsx"), sheet = "Sheet3", range = "A1:K235")
```

Now you try - `Sheet3` in `starwars_messy.xlsx` has the same problems.
Be sure to check for a different range of cells to import,
however\!

``` r
theForce_sum <- read_excel(path = here("data", "raw", "starwars_messy.xlsx"), sheet = "Sheet3", range = "A1:J88")
```

## Exporting Data

Finally, we want to export our data. We should always use plain-text,
open file formats if we can. The `.csv` is the standard data type in
this area, and can be created and saved to `data/clean/` with the
`write_csv()` function from `readr`:

``` r
write_csv(auto, here("data", "clean", "auto.csv"))
```

Now you try to write `theForce` to a `.csv` file in `data/clean`:

``` r
write_csv(theForce, here("data", "clean", "theForce.csv"))
```

The `haven` package contains exporting functions as well for SAS, Stata,
and SPSS, and there are a number of tools for writing Excel spreadsheets
if you must\!
