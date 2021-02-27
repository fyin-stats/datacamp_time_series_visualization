###########
# chapter 4
###########


# case study 
# invest in a portfolio with 3 stocks
# msft, yahoo, apple
# how do you choose stocks

# new portfolio
# role of correlation 
# rule number in investment: capital protection
# low correlation = protection from severe losses

# you will use the PerformanceAnalytics package
# 

# Plot the portfolio value
plot(data$value, main = "Portfolio Value")

# Plot the portfolio return
plot(data$return, main = "Portfolio Return")

# Plot a histogram of portfolio return 
hist(data$return, probability = TRUE)

# Add a density line
lines(density(data$return), col = "red", lwd = 2)

# Good performance, return positive on average, and some extreme returns


# New stocks
# conclusions so far
# no performance since end of 2014
# in what follows
# goal: choose one stock to invest your spare cash
# a new dataset
# choose only one stock
# compare old and new portfolio
# 

# Plot the four stocks on the same graphical window
par(mfrow=c(2,2), mex = 0.8, cex=0.8)
plot(data$GS)
plot(data$KO)
plot(data$DIS)
plot(data$CAT)

# Draw the scatterplot of gs against the portfolio
plot(x = gs, y = portfolio)

# Add a regression line in red
abline(reg = lm(gs ~ portfolio), col = "red", lwd = 2)

# Plot scatterplots and regression lines to a 2x2 window
par(mfrow = c(2, 2))

plot(x = gs, y = portfolio)
abline(reg = lm(gs ~ portfolio), col = "red", lwd = 2)

plot(x = ko, y = portfolio)
abline(reg = lm(ko ~ portfolio), col = "red", lwd = 2)

plot(x = dis, y = portfolio)
abline(reg = lm(dis ~ portfolio), col = "red", lwd = 2)

plot(x = cat, y = portfolio)
abline(reg = lm(cat ~ portfolio), col = "red", lwd = 2)

# Coca-Cola because it is the least correlated with the existing portfolio


# Plot new and old portfolio values on same chart
plot(old.vs.new.portfolio$old.portfolio.value)
lines(old.vs.new.portfolio$new.portfolio.value, col = "red")

# Plot density of the new and old portfolio returns on same chart
plot(density(old.vs.new.portfolio$old.portfolio.rtn))
lines(density(old.vs.new.portfolio$new.portfolio.rtn), col ="red")


# # 
# The PerformanceAnalytics package provides additional tools 
# to get a finer view of your portfolio. In particular, 
# the charts.PerformanceSummary() function provides a 
# quick and easy way to display the portfolio value, returns, 
# and periods of poor performance, also known as drawdowns.
# Draw value, return, drawdowns of old portfolio
charts.PerformanceSummary(old.vs.new.portfolio$old.portfolio.rtn)

# Draw value, return, drawdowns of new portfolio
charts.PerformanceSummary(old.vs.new.portfolio$new.portfolio.rtn)

# Draw both portfolios on same chart
charts.PerformanceSummary(old.vs.new.portfolio[, c(3, 4)])

# Correlation to your existing portfolio to assess diversification, 
# return histogram to assess 
# risk and box and whisker plot to assess average return