# Simple random sampling.
    # Partitioning the dataset into Training and validation sets.
          # Similar to "Validation set approach."

input_data <- readline(prompt="Enter input data name: ")

# print(paste("Hi,", my.name, "next year you will be", my.age+1, "years old."))





train_size <- floor(0.75 * nrow(input_data)) # Set size of training dataset
set.seed(X)
train <- sample(seq_len(nrow(input_data)), size = train_size) # Generates random numbers

train_set <- DATA[train, ]
test_set <- DATA[-train, ]


# Same logic, simplified code
train_set <- input_data[sample(nrow(input_data), size = X)]
test_set <- input_data[-sample(nrow(input_data), size = X)]

