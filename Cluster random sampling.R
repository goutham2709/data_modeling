# Cluster sampling.

DATA[,"NEW_COL"] <- NA # Create a new column with NA's
DATA$NEW_COL[DATA$COL_NAME == "XXX"] <- 1 # Assign numerical values to the factors
DATA$NEW_COL[DATA$COL_NAME == "XXX"] <- 2
DATA$NEW_COL[DATA$COL_NAME == "XXX"] <- 3

train <- sample(1:nlevels(DATA$NEW_COL), 1) # Select one cluster among the clusters

train_set <- DATA[DATA$NEW_COL == train, ]
test_set <- DATA[DATA$NEW_COL != train, ]