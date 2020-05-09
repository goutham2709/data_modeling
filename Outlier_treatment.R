### R Useful commands.

## Outlier treatment

# Checking
quantile(DATA$COL) # Gives 0,1,2,3,4th quartiles. Same as summary()
summary(DATA$COL)
boxplot.stats(DATA$COL) # Gives Quartiles, NA's, Outliers
outlierKD() # Check the R script

#Identifying outliers
  # Turkeys method
boxplot(DATA$COL)$out # Gives only outliers --> Uses Trukey's method (1.5*IQR)
DATA[DATA$COL > 1.5*IQR+Q3,] # Gives outliers above upper limit
DATA[DATA$COL > 1.5*IQR+Q1,] # Gives outliers below lower limit
boxplot(DATA$COL)
  # Standard deviation method
DATA[DATA$COL > (3*sd(DATA$COL) + mean(DATA$COL)),]
  # Percentile method
quantile(DATA$COL, c(.05,.95))

# Treating outliers
  # Deleting
DELETED_DATA <- DATA[DATA$COL < XX, ] # Create new data excluding outliers
  # Winsorizing/Capping/Imputing - Replacing outliers with the Max. value
boxplot.stats(DATA) # Gives upper and lower whiskers
which(DATA$COl > XX) #XX -> index of Upper/lower whisker value
DATA[DATA$COL == XX] <- NEW_VAL # Winsorizing
  # Transforming
    # Right skewed - square root, cube root, and log
    # Left skewed - square root (constant – x), cube root (constant – x), and log (constant – x)
TRANSFORMED_DATA <- log(DATA$COL) # Log transformation
      