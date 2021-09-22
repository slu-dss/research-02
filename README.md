# research-02 <img src="/img/logo.png" align="right" />
[![](https://img.shields.io/badge/seminar-reproducible%20research%20in%20r-brightgreen.svg)](https://github.com/slu-dss/research-02/)
[![](https://img.shields.io/badge/lesson%20status-stable-brightgreen.svg)](https://github.com/slu-dss/research-02/)
[![](https://img.shields.io/github/release/slu-dss/research-02.svg?label=version)](https://github.com/slu-dss/research-02/releases)
[![](https://img.shields.io/github/last-commit/slu-dss/research-02.svg)](https://github.com/slu-dss/research-02/commits/master)
[![Travis-CI Build Status](https://travis-ci.org/slu-dss/research-02.svg?branch=master)](https://travis-ci.org/slu-dss/research-02)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/slu-dss/research-02?branch=master&svg=true)](https://ci.appveyor.com/project/chris-prener/research-02)

## Lesson Overview

### Objectives
At the end of this lesson, participants should be able to:

1. Construct file paths in `R` in a way that ensures maximum reproducibility.
2. Construct data frames from a variety of raw data sources including `.rda`, `.csv`, various statistical package data sets, and Excel workbooks.
3. Identify common issues with Excel workbooks and modify their input into `R` to address these issues.

### Lesson Quick Start
#### Install Necessary Packages
You can copy and paste this syntax into your console:

```r
install.packages(c("tidyverse", "here", "knitr", "rmarkdown", "usethis"))
```

#### Download Lesson Materials
You can download this lesson to your Desktop easily using `usethis`:

```r
usethis::use_course("https://github.com/slu-dss/research-02/archive/master.zip")
```

By using `usethis::use_course`, all of the lesson materials will be downloaded to your computer, automatically extracted, and saved to your desktop. You can then open the `.Rproj` file to get started.

### Lesson Resources
* The [`SETUP.md`](/references/SETUP.md) file in the [`references/`](/references) directory contains a list of packages required for this lesson
* The [`notebook/`](/notebook) directory contains both the seminar and completed versions of our lesson notebooks
* The [lesson slides](https://slu-dss.github.io/research-02/) provide an overview of file paths and working directory issues for reproducibility
* The [`references/`](/references) directory also contains other notes on changes to the repository, key topics, terms, data sources, and software.

### Extra Resources
* [the `tidyverse` website](http://tidyverse.org)
* [the `readr` website](http://readr.tidyverse.org)
* [the `haven` website](http://haven.tidyverse.org)
* [the `readxl` website](http://readxl.tidyverse.org)

## Contributor Code of Conduct
Please note that this project is released with a [Contributor Code of Conduct](.github/CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.

## About the SLU DSS
### Reproducible Research in R
This seminar is our introductory series of lessons for using `R` and RStudio with an eye towards reproducibility. We focus on some basic features of `R` itself, organizing with `R` projects, loading data using the `haven` package, crafting `R` notebooks and using RMarkdown syntax, and using the `knitr` package. More details are available on [our website](https://slu-dss.github.io/news/dss06/).

### About the SLU Data Science Seminar
The [SLU Data Science Seminar](https://slu-dss.githb.io) (DSS) is a collaborative, interdisciplinary group at Saint Louis University focused on building researchers’ data science skills using open source software. We currently host seminars focused on the programming language R. The SLU DSS is co-organized by [Christina Gacia, Ph.D.](mailto:christina.garcia@slu.edu), [Kelly Lovejoy, Ph.D.](mailto:kelly.lovejoy@slu.edu), and [Christopher Prener, Ph.D.](mailto:chris.prener@slu.edu}). You can keep up with us here on GitHub, on our [website](https://slu-dss.githb.io), and on [Twitter](https://twitter.com/SLUDSS).

### About Saint Louis University <img src="/img/sluLogo.png" align="right" />
Founded in 1818, [Saint Louis University](http://www.slu.edu) is one of the nation’s oldest and most prestigious Catholic institutions. Rooted in Jesuit values and its pioneering history as the first university west of the Mississippi River, SLU offers nearly 13,000 students a rigorous, transformative education of the whole person. At the core of the University’s diverse community of scholars is SLU’s service-focused mission, which challenges and prepares students to make the world a better, more just place.
