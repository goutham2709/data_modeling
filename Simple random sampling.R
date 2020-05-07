# Simple random sampling.
    # Partitioning the dataset into Training and validation sets.
          # Similar to "Validation set approach."

train_size <- floor(0.75 * nrow(DATA)) # Set size of training dataset
set.seed(X)
train <- sample(seq_len(nrow(DATA)), size = train_size) # Generates random numbers

train_set <- DATA[train, ]
test_set <- DATA[-train, ]


# Same logic, simplified code
train_set <- DATA[sample(nrow(DATA), size = X)]
test_set <- DATA[-sample(nrow(DATA), size = X)]

