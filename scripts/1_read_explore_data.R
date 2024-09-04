#First, I always write a brief description at the top here to let me know what the 
#script is for. Such as:

#Introduction to R workshop
#Part 1 - reading in and exploring data


#These things with the hashtags are comments
#Things without hashtags are code
4*60+(1300/18.42)^2/100


#Let's save this script as our reading and exploring data script
#Make a folder for scripts, then let's save it there
#File > Save As... > name as "1_read_explore_data" >
#navigate to the scripts folder in our workshop directory > save


#When your script is not saved, the name above in the top left corner of this window
#is red. After you save it, the name returns to black.


#I always start a script by creating a header for the section I will be writing.

#The four # after "Packages" below is what we can use to separate the sections of our script
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

#When you load R, there are a set group of packages that are automatically included.
#You'll often need other packages than just these defaults.

#You can download packages in the packages tab.

#Lets see some information about the install.packages function we will use
?install.packages
#You'll see the description pop up in the lower right window and note it's from
#the package utils

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

#Now we can read in the iris data for our workshop, using the read.csv() function since
#the file is a ".csv"
?read.csv
read.csv("data/iris_data.csv")

#If you are ever unsure of a function or the arguments remember you can search it using the
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


#Quick look at the dataset - needs to be a tibble (tidyverse dataframe)
as_tibble(iris.data)



#----------------------------------------------#
####                  Quiz                  ####
#----------------------------------------------#

#You'll notice that none of the lines of code we ran in the "Explore the data" 
#section added anything to the global environment, why?

#What is a function? package?

#What function would you use to read a .csv file?

#What is "%>%" symbol?








