# Validation set.


# Subset the dataset for training.
training_size <- 0.50 # Size of the training set
training_rows <- sample(seq_len(nrow(DATA)), size = training_size * nrow(DATA)) # Generates random numbers
trainin_set <- DATA[training_rows, ] # Creates training subset

# ISLR method.
set.seed(X)
train <- sample(nrows(data), nrows(data)/2) # Subsetting 50% of the data for training
lm.fit <- lm(mpg ~ horsepower, data = DATASET, subset = train) # Linear model with train dataset