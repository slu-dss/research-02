# ==========================================================================

# DATA SCIENCE SEMINAR, SPRING 2016, WEEK 02

# ==========================================================================

# opening options

rm(list = ls()) # clear workspace

# ==========================================================================

# file name - week02.R

# project name - data science seminar, spring 2016

# purpose - week 02 examples - importing and describing data

# created - 17 Jan 2016

# updated - 28 Jan 2016

# author - CHRIS AND CHRISTY

# ==========================================================================

# full description - this file contains the code for replicating the 
# examples described during the week 02 meeting

# updates - none

# ==========================================================================

# superordinates  - none

# subordinates - none

# ==========================================================================
# ==========================================================================

# 1. review of week 1

#making vectors and testing data type

numVec <- c(1,2,4)
logVec <- c(TRUE, FALSE, T, F)
chrVec <- c("chris", "christy", "kelly")
is.character(chrVec)

#making lists: two options

firstList <- list(c(1,2,4), c(TRUE, FALSE, T, F), c("chris", "christy", "kelly"))
secondList <- list(numVec, logVec, chrVec)

# ==========================================================================

# 2a. metadata for objects

# assign metadata to the chrVar vector using the attribute function
# attr(objectName, "attributeName") <- "atribute text"

attr(chrVec, "label") <- "data science seminar faculty"
attr(chrVec, "date") <- "created 19 Jan 2016"

# view text of single attribute
attr(chrVec, "label")

# view all assigned attributes using the structure function
# str(objectName)

str(chrVec)

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

# 2b. element names

# assign names to individual elements of a vector

citiesMO <- c("St. Louis" = 1, "St. Charles" = 2, "Clayton" = 3)

names(citiesMO) # view only names using the names function

str(citiesMO) # view all data using the structure function

# ==========================================================================

# 3. factors

# ==========================================================================

# create a vector representing class years (4 data points)
classYear <- c("junior", "junior", "senior", "masters")

# assign factor levels using the factor function
# factorName <- factor(objectName, levels = c("factorLevels"))
classFactor <- factor(classYear, levels = c("freshmen", "sophmore", "junior", "senior", "masters", "phd"))

table(classFactor) # view frequency table of factor


# ==========================================================================

# 4. data frames

# ==========================================================================

# edit existing vectors so that they have the same number of elements
chrVec <- c("chris", "christy", "kelly", "matt")
numVec <- c(2,4,6,8)

# create the dataframe using the dataframe function
# dataFrameName <- data.frame(objectNames)
df <- data.frame(chrVec, logVec, numVec, classYear, stringsAsFactors = FALSE)

# view dataframe
View(df)

#we made a bunch of stuff, let's see what's in the workspace
ls()

# ==========================================================================

# 5. exploring data

# ==========================================================================

str() # print list of all variables
print(head()) # print list of first six observations
print(tail()) # print list of last six observations

#we can and will use our own data, but for now let's use some that R provides
#cars - Speed (mph) of cars and the distances (ft) taken to stop (1920s).

str(cars)
print(head(cars))
print(tail(cars))


# ==========================================================================

# 6. descriptive statistics

# ==========================================================================

mean() #mean value of particular variable
median() #median value
max() #largest value
min() #smallest value
range() #range of values
sd() #standard deviation of particular variable

#to single out a variable to test, we need to tell R which dataset & variable
#mean(dataset$variable)

mean(cars$speed)
median(cars$speed)
max(cars$speed)
min(cars$speed)
range(cars$speed)
sd(cars$speed)

summary() #summary of the properties of each variable in a dataset
#i.e. all of the tests we just did, for each variable in the dataset
summary(cars)

#histograms can also be a good first glance at the data
hist() #makes a histogram of a particular variable in a dataset
hist(cars$speed)
hist(cars$dist)

#with this simple dataset, we can also make a basic plot to look at
#the relationship between the two variables
#plot(dataset$variable1, dataset$variable2)
plot(cars$speed, cars$dist)

# ==========================================================================

# 7. build data frame from CSV file

# ==========================================================================

car <- read.csv("car.csv") 
# import sample CSV data into dataframe -- as long as it is in the same 
# directory (folder), all you need is the file name to open in RStudio
str(car) # print list of all variables

# ==========================================================================
# ==========================================================================

# closing options

# {none}

# ==========================================================================

# exit
