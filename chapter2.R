##################
### Chapter 2
#################

### univariate time series
### deal with only one individual variable
### location, dipersion, distribution

### time series need to be transformed because most of them do not exhibit the right statistical
### properties
### amazon stock price
### stock with strong upward trend

### transform price to returns
### amazon stock return is a random series centered at 0

# Plot Apple's stock price 
plot(data[,"apple"], main = "Apple stock price")

# Create a time series called rtn
rtn = ROC(data[,"apple"])

# Plot Apple daily price and daily returns 
par(mfrow=c(1,2))
plot(data[,"apple"])
plot(rtn)


# Other visualization tools
# Histograms

# hist(amazon_stocks)
# main = "... \\n "
# box and whisker
# boxplot(, horizontal = TRUE, main = "")

# autocorrelations
# tells you about the relationships between observations in time series

# QQ plot
# qqnorm(amazon_stocks, main = "")
# qqline(,col="red")
# 

# Create a histogram of Apple stock returns
hist(rtn, main = "Apple stock return distribution", probability = TRUE)

# Add a density line
lines(density(rtn))

# Redraw a thicker, red density line
lines(density(rtn), col = "red", lwd = 2)

# Draw box and whisker plot for the Apple returns
boxplot(rtn, horizontal = TRUE)

# Draw a box and whisker plot of a normal distribution
boxplot(rnorm(1000), horizontal = TRUE)

# Redraw both plots on the same graphical window
par(mfrow=c(2,1))
# Draw box and whisker plot for the Apple returns
boxplot(rtn, horizontal = TRUE)

# Draw a box and whisker plot of a normal distribution
boxplot(rnorm(1000), horizontal = TRUE)


# Draw autocorrelation plot
acf(rtn, main = "Apple return autocorrelation")

# Redraw with a maximum lag of 10
acf(rtn, lag.max = 10, main = "Apple return autocorrelation")


## QQ plot
# A q-q plot is a plot of the quantiles of one dataset against the quantiles of a second dataset. 
# This is often used to understand 
# if the data matches the standard statistical framework, or a normal distribution.

# Create q-q plot
qqnorm(rtn, main = "Apple return QQ-plot")

# Add a red line showing normality
qqline(rtn, col = "red")



## How to use everything we learned so far?
## Amazon return distribution Jan. 2015 to Jan. 2017
## median return of zero (confirmed by box and whisker plot)
## Autocorrelation Amazon return autocorrelations Jan. 2015 to Jan. 2017
## Outliers
## conclusion: amazon stock, profitable but risky investment

# Draw histogram and add red density line
hist(rtn, probability = TRUE)
lines(density(rtn), col = "red")


# Draw box and whisker plot
boxplot(rtn, horizontal = TRUE)

# Draw autocorrelogram
acf(rtn)

# Draw q-q plot and add a red line for normality
qqnorm(rtn)
qqline(rtn, col = "red")

# Set up 2x2 graphical window
par(mfrow=c(2,2))

# Recreate all four plots
hist(rtn, probability = TRUE)
lines(density(rtn), col = "red")

boxplot(rtn)

acf(rtn)

qqnorm(rtn)
qqline(rtn, col = "red")


# return series

# Amazing! The histogram shows the right skewness of the return series, 
# and the tails of the QQ-plot show the large number of outliers. 