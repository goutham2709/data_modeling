### R Useful commands.

## Missing values - Look at onenote for concepts.

# Checking missing values
summary(DATA)
is.na(DATA)
which(is.na(DATA), arr.ind = TRUE) # Returns index
sum(is.na(DATA)) # Returns no. of missing values
complete.cases(DATA) # Returns logical values
DATA[!complete.cases(DATA)] # Returns rows with incomplete data
table(complete.cases(DATA)) # Returns a table with count of rows with atleat one missing value

# Delete rows with missing values
complete.cases(DATA)
omitted <- DATA[complete.cases(DATA), ]
omitted <- na.omit(DATA)

# Mean/Median/Mode imputation
DATA[is.na(DATA)] # Returns missing values
mean(DATA[!is.na(DATA)]) # Returns mean of non-missing values
mean(DATA$COL, na.rm = TRUE) # Does the samething as above
    # Mode is not a built in function in R. It is saved in "Mode.R" script file
DATA[is.na(DATA)] <- mean(DATA[!is.na(DATA)]) # Imputes missing data with mean of that data
DATA[is.na(DATA)] <- mean(DATA, na.rm = TRUE) # Does the samething as above

# Imputation with models (Eg: Simple linear regression)
  # 1. Find correlation between variables. Looks for the most correlated variable
  # 2. Create indicator var. column "ind". (ind=1) for complete and (ind=0) for incomplete cases
  # 3. Fit a linear regression model with the most correlated variable
  # 4. For each (ind=0) case, predict and impute the predicted value
cor(DATA) #Gives correlation coefficient value
cor(DATA, use = "complete.obs", method = "pearson") # Excluding missing data and pearson method
symnum(cor(DATA, use = "complete.obs")) # Converts numbers to symbolics

ind <- function(t){
  x <- dim(length(t)) # Same dim as length of incoming vector
  x[which(!is.na(t))] = 1
  x[which(is.na(t))] = 0
  return(x)
} # Creates a indicator variable col, assigns 1=complete data, 0=missing data

DATA$NEW_COl <- ind(DATA$COL_WE_WANT_TO_PREDICT) # Creates new col with the function above
lm(y ~ x, data = DATA) # y=target col, x=most correlated col.

for(i in 1:nrow(DATA)){
  if(DATA$NEW_COL[i] == 0){
    DATA$COL_WE_WANT_TO_PREDICT[i] = INTERCEPT + XXX * DATA$MOST_CORR_COL[i] # Enter regression coefficients
  }
} # Imputes the data to the column automatically

# OR ------
librar(mice) # Multivariate imputation package
IMPUTED_DATA <- mice(DATA, method = , m = )

# KNN Imputation
library(VIM) # Visualization and imputation of missing values package
?kNN # Based on "Grower distance". Look it up
DATA <- kNN(DATA, variable = c("IMPUTE_COLS"), k = xx) # KNN imputation creates new logical columns
IMPUTED_DATA <- subset(DATA, select = COL_NAME:COL_NAME)