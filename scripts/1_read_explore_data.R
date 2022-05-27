#First, I always write a brief description at the top here to let me know what the 
#script is for. Such as:

#Introduction to R workshop
#Part 1 - reading in and exploring data
#Schoodic Institute at Acadia National Park, 2022

#You should have R 4.1.2 and RStudio 2022.02.1.


#Let's save this script as our reading and exploring data script
#File > Save As... > name as "1_read_explore_data" >
#navigate to the scripts folder in our workshop directory > save

#When your script is not saved, the name above in the top left corner of this window
#changes color

#These things with the hash tags are comments
#Things without hash tags are code


#R is amazing. Look we can do simple math.
1+1
40/2

#And complex math
((4000201*14^3)/778291)^2
log(53)


#Plus it provides us with an amazing tool to
#clean, fix, alter, and analyze data, and make tables/figures from that data



#Let's see how we might start doing that



#Now I always start a script by creating a header for the section I will be writing.

#The four # after "Packages" is what we can use to separate the sections of our script
#creating a dropdown selectable menu to navigate

#This is super useful in longer scripts

#----------------------------------------------#
####               Packages                 ####
#----------------------------------------------#

#To understand what a package is and why we need them, you must first know what 
#a function is. 

#A function is something that performs an action on the data.

#For example install.packages() is a function and we know that because of the 
#parentheses after the name.

#Now, a package is simply a published group of functions that someone wrote 
#and now we get to use these to make our lives easier.

#When you load R, there are a set group of packages that are automatically included
#This is what we call base R.
#Additional packages that we are adding here are not base R packages, they are addons.

#This line of code uses the function install.packages() to perform the action of 
#installing the package called tidyverse.
install.packages("tidyverse")

#Now you see in the console window below that the package has been downloaded and is
#stored in that location.

#If you noticed the stop sign that appeared when you ran that line of code, that is
#your indication that the program is try to perform that function you just told it 
#to run.

#Now you can't just install the package, you also need to call it into action using
#the library() function.
library(tidyverse)

#In the console you see that by calling the tidyverse package you actually called
#seven different packages that are all nested under the tidyverse name




#----------------------------------------------#
####         Reading in the data            ####
#----------------------------------------------#

#Right now we are working with access to all files on your computer.

#This can be messy and a real hassle so to fix that we can set what's called a 
#working directory so that we are only working in the folder that we want.

#First run getwd() to see where you really are working within R
getwd()
#[1] "/Users/Kylelima" this is what I get in the console as my current directory

#If your working directory is in the wrong spot, you need to first unlink before changing
unlink("/Users/Kylelima/Desktop/ECO Research/Schoodic_Analyst/schoodic_spatial/scripts", recursive = T)

#Now, let's use the setwd() function to get to our R_workshop folder
setwd("Desktop/R_workshop")

#Let's make sure this worked
getwd()
#[1] "/Users/Kylelima/Desktop/R_workshop" GREAT!

#Now we can read in the iris data for our workshop, using the read.csv() function since
#the file is a ".csv"
read.csv("data/iris_data.csv")

#If you are ever unsure of a function or the arguments you can search it using the
#"Help" tab of the bottom right window of RStudio, or type the function in the console
#like this "?read.csv" and running that will bring you to the help page.

#Okay so we read the data, but it doesn't show up in our global environment window,
#only in the console window.
#Why?
#Because we didn't assign it as an object!

#Lets do that now:
iris.data <- read.csv("data/iris_data.csv")

#This is now what we call a data frame.
#This data frame has 150 observations (aka rows) and 5 variables (aka columns).
#You can click on it in the global environment window to see the full thing.




#----------------------------------------------#
####           Explore the data             ####
#----------------------------------------------#

#Now that we have the data read in and saved as an object we can explore what
#is going on in our data

#Our first introduction to that tidyverse package we loaded earlier is here.
#We will use what is called the pipes operator ( %>% ) to explore our data

#Using function head() by writing the function name and piping it into the function
iris.data %>% 
  head() #shows us the first few rows of each column

#The iris.data is carried into the head() function here, and it could be written
#as "head(iris.data)" in base R. However when we get into data manipulation this 
#format is far superior because we can have multiple functions alter our 
#data frame at once

#Using function tail()
iris.data %>% 
  tail() #shows us the last few rows of each column

#Using function class()
iris.data %>% 
  class() #returns "data.frame" as the class for our whole data set

#Now we can also look at the class of one column at a time too
#Let's do this with the $ which indicates a column of a data frame
iris.data$Sepal.Length %>% 
  class() #returns "numeric" as the class for this column

#To see the overall structure of your data frame use function str() or glimpse()
iris.data %>% 
  str()

iris.data %>% 
  glimpse()

#If you want to know the names of the columns use function names()
iris.data %>% 
  names()

#See distinct names of species - very useful for data cleaning
iris.data %>% 
  select(Species) %>% #a select function allows you to choose a column
  distinct() #then we are piping that column into the distinct() function to return 
             #the unique values in that column




#----------------------------------------------#
####                  Quiz                  ####
#----------------------------------------------#

#You'll notice that none of these lines of code we ran added anything to the global
#environment, why?

#What is a function? package?

#What function would you use to read a .csv file?

#What is "%>%" symbol?








