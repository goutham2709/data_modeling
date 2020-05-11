### R Useful commands.

## Univariate analysis
    # Continuous variables
    # Categorical/Discrete variables

DATA <- read.csv("XXX", stringsAsFactors = FALSE)

# 1.Get a high level overview of data
str(DATA)
summary(DATA)
CLASS(DATA)

View(DATA)
head(DATA)
names(DATA)

# QUESTION: Do you need to adjust anything at this point? data types, structure of the data, etc.

library("dplyr") # Data manipulation - mutate() select() filter() summarise() arrange()
DATA <- select(DATA, -COL) # Drop unwnated columns

plot(density(DATA$COL)) # Density plot
pie(table(DATA$COL)) # Pie chart - Don't use


######### NOTES ###########
## Structure, class of data
## Frequency distribution, Central tendency, Dispersion for every variable
## Box plot, Histogram, Density plot