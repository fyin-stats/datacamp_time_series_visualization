### Time series visualization
ipak <- function(pkg){
    new.pkg <- pkg[!(pkg %in% installed.packages()[, "Package"])]
    if (length(new.pkg))
        install.packages(new.pkg, dependencies = TRUE)
    try(sapply(pkg, require, character.only = TRUE), silent = TRUE)
}
packages <- c("xts", "zoo", "astsa","dplyr")
ipak(packages)
##################
####### chapter 1
##################

####### in general plot, no time index
####### xts, extensible time series
####### index + matrix
####### index is a time object: Date, POSIX Time, timeDate, chron
####### 
plot(my_ts) # main, col, lwd

########
# Display the first few lines of the data
head(data)

# Display the column names of the data
colnames(data)

# Plot yahoo data and add title
plot(data[,"yahoo"])

# Replot yahoo data with labels for X and Y axes
plot(data[,"yahoo"], xlab = "date", ylab = "price")


# 
# Plot the second time series and change title
plot(data$microsoft, main = "microsoft")

# Replot with same title, add subtitle, use bars
plot(data$microsoft, main = "microsoft", sub = "Daily closing price since 2015", type = "h")

# Change line color to red
lines(data$microsoft, col = "red")

#

# Create a 2x1 graphical window, then plot the first two series in data in that order, including the title for each of them
# Reduce margin size to 60% and character size to 80% of their normal sizes and and replot with same graphical window and titles


# Plot two charts on same graphical window
par(mfrow=c(2,1))
plot(data[,1], main = "yahoo")
plot(data[,2], main = "microsoft")

# Replot with reduced margin and character sizes
par(mfrow=c(2,1), mex = 0.6, 
    cex = 0.8)
plot(data[,1], main = "yahoo")
plot(data[,2], main = "microsoft")

# The function to tailor the chart parameters is par(), 
# the option to change character size is cex, 
# to display more than one chart on a single window you use mfrow


# other useful visualizing functions
# 
plot(my_ts, main = "My stocks")
lines(my_ts2, col = "red")
axis(side = 4, at = pretty(my_ts2))

# highlight certain points
abline()

# other useful visualizing functions
# 
library(PerformanceAnalytics)
period <- c("2014-01/2015-06")
#
chart.TimeSeries(my_ts, period.areas = period, main = "my_ts")

# 
# Plot the "microsoft" series
plot(data$microsoft, main = "Stock prices since 2015")

# Add the "dow_chemical" series in red
lines(data$dow_chemical, col = "red")

# Add a Y axis on the right side of the chart
axis(side = 4, at = pretty(data$dow_chemical))

# Add a legend in the bottom right corner
legend(x = "bottomright", 
       legend = c("microsoft", "dow_chemical"), 
       col = c("black", "red"),
       lty = c(1, 1))


# 
# Plot the "citigroup" time series
plot(data$citigroup, main = "Citigroup")

# Create vert_line to identify January 4th, 2016 in citigroup
vert_line <- which(index(data$citigroup) == as.Date("2016-01-04"))

# Add a red vertical line using vert_line
abline(v = .index(data$citigroup)[vert_line], col = "red")

# Create hori_line to identify the average price of citigroup
hori_line <- mean(data$citigroup)

# Add a blue horizontal line using hori_line
abline(h = hori_line, col = "blue")


# 

# Create period to hold the 3 months of 2015
period <- c("2015-01/2015-03")

# Highlight the first three months of 2015 
chart.TimeSeries(data[,"citigroup"], period.areas = period)

# Highlight the first three months of 2015 in light grey
chart.TimeSeries(data[,"citigroup"], period.areas = period, period.color = "lightgrey")


#
# Plot the microsoft series
plot(data$microsoft, main = "Dividend date and amount")

# Add the citigroup series
lines(data$citigroup, col = "orange", lwd = 2)

# Add a new y axis for the citigroup series
axis(side = 4, at = pretty(data$citigroup), col = "orange")

# Same plot as the previous exercise
plot(data$microsoft, main = "Dividend date and amount")
lines(data$citigroup, col = "orange", lwd = 2)
axis(side = 4, at = pretty(data$citigroup), col = "orange")

# Create the two legend strings
micro <- paste0("Microsoft div. of ", micro_div_value," on ", micro_div_date)
citi <- paste0("Citigroup div. of ", citi_div_value," on ", citi_div_date)

# Create the legend in the bottom right corner
legend(x = "bottomright", legend = c(micro, citi), col = c("black", "orange"), lty = c(1, 1))


