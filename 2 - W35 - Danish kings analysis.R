# Load package and data
library(tidyverse)
kings <- read_csv('Danish-kings-xlsx.csv')

# Create new column with duration of reign in years
kings$reign_duration <- kings$reign_end-kings$reign_start

# Calculate mean reign duration
mean(kings$reign_duration, na.rm = T)

# Calculate the median reign duration
median(kings$reign_duration, na.rm = T)

# Find the three kings ruling for the longest time
tail(kings[order(kings$reign_duration),])

# A tibble containing only the selected three kings
longest_rulers <- kings[order(kings$reign_duration)[18:20],]

# How many days did those three kings rule including transition years
# (which I interpret as both the year they were crowned and the year they lost the crown)?
longest_rulers$reign_duration_days <- (longest_rulers$reign_duration+1)*365
longest_rulers
