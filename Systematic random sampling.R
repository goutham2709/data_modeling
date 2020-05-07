# Systematic random sampling.

train <- seq(FROM, nrow(DATA), by = X) # FROM = random 1st observation, by = increment (systematic part)
train_set <- DATA[train, ]
test_set <- DATA[-train, ]