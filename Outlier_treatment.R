### R Useful commands.

## Outlier treatment

# Checking
DATA[DATA$COL > 1.5*IQR+Q3,] # Gives outliers above upper limit
DATA[DATA$COL > 1.5*IQR+Q1,] # Gives outliers below lower limit
boxplot(DATA$COL)


# Function to iterate through each column and check output boxplots
outlier_func <- function(data){
  columns <- colnames(data)
  for(val in columns){
    if(is.factor(val)){
      boxplot(data$val)
    }
  }
}