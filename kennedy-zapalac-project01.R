system("hostname", intern=TRUE)

# creating R function
colStats <- function(df, colName){
    # colName should be a str
    
    # calculate the shape, mean, median and sd and save as variables
    df_shape <- dim(df)
    df_mean <- round(mean(df[[colName]], na.rm=TRUE), 3)
    df_median <- median(df[[colName]], na.rm=TRUE)
    df_sd <- round(sd(df[[colName]], na.rm=TRUE), 3)
    # create string to print using the variables above
    cat("MyDf Summary Statistics ---\n",
        "Shape: (", df_shape[1], ",", df_shape[2], ")\n",
        "Mean:", df_mean, "\n",
        "Median:", df_median, "\n",
        "Standard Deviation:", df_sd, "\n",
       "--------------------------")
}
# read in data
df <- read.csv("/anvil/projects/tdm/data/flights/subset/1991.csv")
# testing R function
colStats(df = df, colName = "DepDelay")