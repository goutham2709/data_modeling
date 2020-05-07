# Stratified random sampling.


# Using dplyr package.
set.seed(x)
stratified_set <- DATA %>% group_by(COLUMN_NAME) %>% sample_n(XX) # Sample_n(number of observations form each strata/group)
stratified_set <- DATA %>% group_by(COLUMN_NAME) %>% sample_frac(XX) # Propotional sampling. Sample_n(fraction of observations form each strata/group)


# Using caret package. # This method is better than dplyr above.
# By default, createDataPartition does a stratified random split of the data.
# https://www.r-bloggers.com/data-splitting/
library(caret)
train <- createDataPartition(y = DATA$COL_NAME, p = 0.7, list = FALSE) # COL_NAME = groupby this column, 0.7 = split %
train_set <- DATA[train, ]
test_set <- DATA[-train, ]

table(train$COL_NAME) # To see the proportions


# By selecting the sample size.
sample_size <- XX
proportions <- sample_size / nrow(cars) # Check proportions
floor(proportions * table(DATA$COL_NAME)) # Gives table with num. of samples for each strata

train_set <- stratified(DATA, "COL_NAME", c(A, B, C)) # train_set
test_set  <- setdiff(DATA, test_set) # dplyr library



#Stratified function:

stratified <- function(df, group, size, select = NULL, 
                       replace = FALSE, bothSets = FALSE) {
  if (is.null(select)) {
    df <- df
  } else {
    if (is.null(names(select))) stop("'select' must be a named list")
    if (!all(names(select) %in% names(df)))
      stop("Please verify your 'select' argument")
    temp <- sapply(names(select),
                   function(x) df[[x]] %in% select[[x]])
    df <- df[rowSums(temp) == length(select), ]
  }
  df.interaction <- interaction(df[group], drop = TRUE)
  df.table <- table(df.interaction)
  df.split <- split(df, df.interaction)
  if (length(size) > 1) {
    if (length(size) != length(df.split))
      stop("Number of groups is ", length(df.split),
           " but number of sizes supplied is ", length(size))
    if (is.null(names(size))) {
      n <- setNames(size, names(df.split))
      message(sQuote("size"), " vector entered as:\n\nsize = structure(c(",
              paste(n, collapse = ", "), "),\n.Names = c(",
              paste(shQuote(names(n)), collapse = ", "), ")) \n\n")
    } else {
      ifelse(all(names(size) %in% names(df.split)),
             n <- size[names(df.split)],
             stop("Named vector supplied with names ",
                  paste(names(size), collapse = ", "),
                  "\n but the names for the group levels are ",
                  paste(names(df.split), collapse = ", ")))
    }
  } else if (size < 1) {
    n <- round(df.table * size, digits = 0)
  } else if (size >= 1) {
    if (all(df.table >= size) || isTRUE(replace)) {
      n <- setNames(rep(size, length.out = length(df.split)),
                    names(df.split))
    } else {
      message(
        "Some groups\n---",
        paste(names(df.table[df.table < size]), collapse = ", "),
        "---\ncontain fewer observations",
        " than desired number of samples.\n",
        "All observations have been returned from those groups.")
      n <- c(sapply(df.table[df.table >= size], function(x) x = size),
             df.table[df.table < size])
    }
  }
  temp <- lapply(
    names(df.split),
    function(x) df.split[[x]][sample(df.table[x],
                                     n[x], replace = replace), ])
  set1 <- do.call("rbind", temp)
  
  if (isTRUE(bothSets)) {
    set2 <- df[!rownames(df) %in% rownames(set1), ]
    list(SET1 = set1, SET2 = set2)
  } else {
    set1
  }
}



