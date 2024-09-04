#Introduction to R workshop
#Part 3 - data summary and viz

#Save as "3_data_viz" in the scripts folder

#----------------------------------------------#
####                Packages                ####
#----------------------------------------------#

#Again call the tidyverse package
library(tidyverse)
#This time we need ggplot2 which is the package for the plotting we will do
library(ggplot2)




#----------------------------------------------#
####            Data summaries              ####
#----------------------------------------------#

#Let's summarize some parts of our data

##How about the mean, standard deviation, min, and max of sepal.length?

#Remember to use the cleaned version now
read.csv("data/iris_data_clean.csv") %>% #read clean data
  group_by(sci.name) #this is what we need to summarize the data

#Note in the console that this is now a tibble which is the tidyverse version of a 
#table and the it has 3 groups from the species column

#Let's get the mean of sepal length
read.csv("data/iris_data_clean.csv") %>%
  group_by(sci.name) %>% 
  select(sepal.length) %>% #select only the sepal.length column
  summarise(mean = mean(sepal.length)) #calculate mean of the three species

#Looking at the output we see one NA value for the mean, that's incorrect

#We can fix this by adding the na.rm argument in the mean() function, 
#which tells R to calculate the mean of the other values and exclude the NA's
read.csv("data/iris_data_clean.csv") %>% 
  group_by(sci.name) %>% 
  select(sepal.length) %>%
  summarise(mean = mean(sepal.length, na.rm=TRUE)) #add the na.rm=TRUE

#Okay now we have a nice output. Let's get the other info we wanted:
read.csv("data/iris_data_clean.csv") %>% 
  group_by(sci.name) %>% 
  select(sepal.length) %>%
  summarise(mean = mean(sepal.length, na.rm=TRUE),
            standard.dev = sd(sepal.length, na.rm=TRUE),
            median = median(sepal.length, na.rm=TRUE),
            min = min(sepal.length, na.rm=TRUE),
            max = max(sepal.length, na.rm=TRUE))

#And assign this to save it
sepal.length.table <- read.csv("data/iris_data_clean.csv") %>% 
  group_by(species) %>% 
  select(sepal.length) %>%
  summarise(mean = mean(sepal.length, na.rm=TRUE),
            standard.dev = sd(sepal.length, na.rm=TRUE),
            median = median(sepal.length, na.rm=TRUE),
            min = min(sepal.length, na.rm=TRUE),
            max = max(sepal.length, na.rm=TRUE))



#----------------------------------------------#
####             Make a table               ####
#----------------------------------------------#

#Export the data frame which becomes our table
write.csv(sepal.length.table, "outputs/sepal_length_summarytable.csv", 
          row.names = FALSE)

#Now that it's exported as a .csv, open it in Excel and format it for 
#the report, paper, etc. 

#Once formatted in Excel, copy and paste it into your document!



#----------------------------------------------#
####               Plotting                 ####
#----------------------------------------------#

#Let's do a basic ggplot

#ggplot works a lot like how we have been writing in the tidyverse

#We can actually integrate the two for superior plotting ability

#The difference is that instead of the pipes operator (%>%), we now use ggplot's
#version of this (a "+" sign) once we pipe our data into the ggplot function

#Example
#Take the data and pipe into a ggplot
read.csv("data/iris_data_clean.csv") %>%  
  ggplot(aes(x=sci.name, y=sepal.length)) + #ggplot function, "aes" argument allows 
                                            #you to specify x and y
  geom_point() #a scatter plot

#This is how we can integrate the pipes and "+" sign operators to use ggplot with 
#the tidyverse format

#There are many types of plots within ggplot

#box plot
read.csv("data/iris_data_clean.csv") %>%  
  ggplot(aes(x=sci.name, y=sepal.length, fill=species)) + #fill argument for colors
  geom_boxplot() + #make a box plot
  ylim(0, 8) #change the y-axis limits from 0 to 8

#bar plot
read.csv("data/iris_data_clean.csv") %>% 
  group_by(sci.name) %>% 
  summarise(mean = mean(sepal.length, na.rm = T)) %>% #we need to calculate means to plot
  ggplot(aes(fill=sci.name)) + #specify the fill
  geom_bar(aes(x=sci.name, y=mean), stat = "identity") #create a bar plot

#and many more

#There are also tons of colors and modifications we can do

#To show this, let's take the box plot and make some improvements
read.csv("data/iris_data_clean.csv") %>%  
  ggplot(aes(x=sci.name, y=sepal.length, fill=sci.name)) + #need this fill argument to alter colors
  geom_boxplot(show.legend = FALSE) + #remove the legend, we don't need one here
  scale_y_continuous(breaks = scales::pretty_breaks(10), limits = c(0, 8)) +
  labs(y = "Sepal length", #change y-axis label
       x = NULL, #NULL = leave it blank  
       title = "Mean sepal length for three species of iris") + #add title to plot
  theme_classic() + #use this on most plots for an easy way to vastly improve the plot
  theme(plot.title = element_text(hjust = 0.5, size = 18, face = "bold"), #alter title
        axis.text = element_text(size = 12, color = "black"), #alter axis text
        axis.text.x = element_text(face = "italic"), #make only x-axis text italic
        axis.title.y = element_text(size = 13, color = "black")) + #alter y-axis label
  scale_fill_brewer(palette = "Blues") #an easy way to choose colors, especially color-blind friendly

#It easy to see how you can keep building on your plots and fine
#tuning until they are exactly as you want them

#Okay this looks great, let's save this in our outputs directory

#We will export this as a .png using the ggsave() function which saves the last run plot
#Specify the height and width in inches to get a good looking plot
ggsave("outputs/mean_sepallength_plot.png", width = 8, height = 6) 




#----------------------------------------------#
####                  Quiz                  ####
#----------------------------------------------#

#What are the components inside a function called?

#What function allows you to start the plot making process?

#What does the "+" symbol mean in ggplot?

#What function would you use to create a scatter plot of a bunch of points over time?




