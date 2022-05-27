#Introduction to R workshop
#Part 2 - data manipulation
#Schoodic Institute at Acadia National Park, 2022

#Save as "2_data_manipulation" in the scripts folder

#----------------------------------------------#
####     Packages and working directory     ####
#----------------------------------------------#

#Again call the tidyverse package
library(tidyverse)


#Check working directory
getwd()
#Set the working directory if needed
setwd("Desktop/R_workshop")



#----------------------------------------------#
####          Data manipulation             ####
#----------------------------------------------#

##First let's deal with the iris data
#See what problems we need to fix with the column names
read.csv("data/iris_data.csv") %>% 
  names() #we want to make these lowercase for easier typing

#See if there is any issues in the species names
read.csv("data/iris_data.csv") %>% 
  select(Species) %>% 
  distinct() #some capitalization in species names that need correction

#Fix the issues!
iris.clean <- read.csv("data/iris_data.csv") %>% 
  as_tibble() %>% #make this a tibble 
  select(species=Species, everything()) %>% #plus reorder logically
  rename(sepal.length=Sepal.Length, sepal.width=Sepal.Width) %>% #a way to rename columns
  rename_with(tolower) %>% #a different way to adjust column names
  mutate(species = tolower(species)) #fix those capital species names




##Now let's deal with the genus data
#Read in the other data set that had information about the genus
read.csv("data/genus_data.csv")

#You can see that there are two columns Species and Genus with three species and genera

#Let's clean this up because we don't want the capital column names, but the genera should be
read.csv("data/genus_data.csv") %>% 
  as_tibble() %>% #let's make it a tibble now so we can see the class of each column
  rename_with(tolower)
  
#Great, let's save it
genus <- read.csv("data/genus_data.csv") %>% 
  rename_with(tolower) %>% 
  as_tibble()

#Now we only want one data frame with all our data
#To do that we want to join the two data frames together genus and iris.clean
#To join data frames they need to have one column in common
#and the column name must match exactly!

#We will use a left_join() function to do this, iris.clean has most of our data so
#we want to join genus onto the iris.clean 
iris.clean %>% 
  left_join(genus, by = "species") #the "by = " argument is the column in common

#Left_join means take the file listed in the function (genus) and 
#match it to the values of the data that's piped through (iris.clean)
#There are right_joins that would do the opposite and full joins that would
#keep all the data no matter if there were matches or not

#This could also be written in base R as
left_join(iris.clean, genus, by = "species")

#But this doesn't flow for our pipeline

#Great, this now added the genus column onto our data correctly
#But, we also want a scientific name column combining the two!
iris.clean %>% 
  left_join(genus, by = "species") %>% #combine the two data frames
  mutate(sci.name = paste(genus, species)) #make a new column called sci.name

#Awesome! Save this to the environment
iris.data.final <- iris.clean %>% 
  left_join(genus, by = "species") %>% 
  mutate(sci.name = paste(genus, species))

#Write out the cleaned data
write.csv(iris.data.final, "data/iris_data_clean.csv", row.names = FALSE)
  



##Also, here is another important function that you will want to use
#This is a function called filter which allows you to subset you data
iris.data.final %>% 
  filter(sepal.length > 5,
         species == "setosa")

#Our tibble now contains only setosa data where the sepal length is greater than 5




#----------------------------------------------#
####                  Quiz                  ####
#----------------------------------------------#

#Name one way to change the name of a column.

#What function would you use to subset some data?

#What function allows you to create new columns?

#What do joins do?



