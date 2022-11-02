#Workshop: intro to R and GitHub

#syntax is everything!
#creating objects- assign values to objects
3+3
3+3*(100/5)
number <- 3+3*(100/5) #this won't print anything
number #this will!

#install packages (you only need to install them once)
#there are many packages
#these are the most basic ones and I use them all the time
install.packages("ggplot2") #data visualization
install.packages("dplyr") #data wrangling 
install.packages("tidyverse") #tidy your data
install.packages("janitor") #clean names (R is very picky about syntax!)

#you have to "call" your packages in every session
library(ggplot2)
library(dplyr)
library(tidyverse)
library(janitor)

#loading the data
#copy and paste your path here
maternalhealth_db <-
  read_csv(
    "C:/Users/Marcela_pfaff1/OneDrive - Baylor University/Baylor/Lab/Meetings/maternal-health-db.csv")
#clean names
maternalhealth_db <- clean_names(maternalhealth_db)
view(maternalhealth_db) #view your data with clean names

#explore the data 
str(maternalhealth_db) #str shows the type of variable 
summary(maternalhealth_db) #shows basic descriptive stats for continuos variables
table(maternalhealth_db$risk_level) #freq for categorical variables
sd(maternalhealth_db$age)#standard deviation for a specific variable

# add new variable for RiskLevel with numbers instead of characters
maternalhealth_db <- maternalhealth_db %>% mutate( #what is %>% ? pipes!
  risk_level=recode(risk_level,
                    "low risk"= "0",
                    "mid risk"= "1",
                    "high risk"="2"))

view(maternalhealth_db) #now we can see that our variables has numbers 
#of characters




