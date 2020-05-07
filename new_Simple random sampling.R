# Simple random sampling.
    # Partitioning the dataset into Training and validation sets.
          # Similar to "Validation set approach."

input_data <- readline(prompt="Enter input data name: ")
print(input_data)





train_size <- floor(0.75 * nrow(input_data)) # Set size of training dataset
set.seed(floor(runif(1, 0, 100)))
train <- sample(seq_len(nrow(input_data)), size = train_size) # Generates random numbers

write.csv(input_data[train, ], "train_set.csv")

#test_set <- input_data[-train, ]


