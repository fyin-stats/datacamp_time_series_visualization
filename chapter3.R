###########
# chapter 3
###########
ipak <- function(pkg){
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if (length(new.pkg))
        install.packages(new.pkg, dependencies = TRUE)
    try(sapply(pkg, require, character.only = TRUE), silent = TRUE)
}
packages <- c("xts", "zoo", "astsa","dplyr","corrplot")
ipak(packages)
# many time series
# Dealing with higher dimensions
# simplest case: two time series
# multiple time series: 
# identify how they interact
# e.g., single stock price reaction to interest rates change
# e.g., stock price reaction of several stocks on interest rates change
# identify patterns
# 10 time series 
# 100 

# grouped bar plot
# stacked bar plot

# Plot stacked barplot
barplot(portfolio)

# Plot grouped barplot
barplot(portfolio, beside = TRUE)

# Draw the scatterplot
plot(y=citi,x= sp500)

# Draw a regression line
abline(reg=lm(citi~sp500), col ="red", lwd = 2)


# multivariate time series
# stocks
# head(my_stocks)
# head(stock_weights)
# stacked chart
# 
barplot(stock_weights, col = c("lightblue", "red", "orange"), main = "stock weights")
# 

# round(cor(my_stocks), digit = 4)
# correlation matrix with numbers

# correlation matrix with scatterplots
# pairs(my_stocks, lower.panel = NULL, main = "Stocks correlation Scatterplots)
# corrplot() package
# 
corrplot(my_stocks, method = "number", type = "upper")

# 
# What if you want to evaluate the relationship between mutiple time series? The most 
# common tool to use is a correlation matrix, which is a table showing correlation coefficients 
# between pairs of variables. 
# Several types of correlations exist but the most used ones are:

# Create correlation matrix using Pearson method
cor(my_data, method = "pearson")

# Create correlation matrix using Spearman method
cor(my_data, method = "spearman")

# 
# Create scatterplot matrix
pairs(my_data)

# Create upper panel scatterplot matrix
pairs(my_data, lower.panel = NULL)

# Create correlation matrix
corrplot(cor_mat)

# Create correlation matrix with numbers
corrplot(cor_mat, method = "number")

# Create correlation matrix with colors
corrplot(cor_mat, method = "color")

# Create upper triangle correlation matrix
corrplot(cor_mat, method = "number", type = "upper")


# Higher dimension time series
# visualizing time series data in R
# 100*100
# cor_mat
# correlation matrix as heatmap
# 
corrplot(cor_mat, method = "color", type = "upper")

# 
corrplot(cor_mat, method = "color", order = "hclust")


# Draw heatmap of cor_mat
corrplot(cor_mat, method = "color")

# Draw upper heatmap
corrplot(cor_mat, method = "color", 
         type = "upper")

# Draw the upper heatmap with hclust
corrplot(cor_mat, method = "color", type = "upper", order = "hclust")

# Scatter plots are used to evaluate bivariate relationships, 
# and heatmaps are used to 
# identify significant relationships when dealing with numerous variables