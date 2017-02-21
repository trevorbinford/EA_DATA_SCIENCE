#in future the first few lines will set a directory and open imported data files
#Below is the R equivalent of log capture , close
#Use this space to mention necessary packages that mmust be installed here

## ATTENTION: LOG FILE CREATED by sink() is empty using Source; Use Source with Echo OR RUN instead
### capture.output will be more effective

#EA <- file("ealog1.txt", open = "wt")
#sink(EA)
#sink.reset <- function(){
  #for(i in seq_len(sink.number())){
  #  sink(NULL)
 # }
#}
#sink.reset()

#file.show("ealog1.txt")

# Main Content
#make sure package 'lubridate' installed and loaded since we are dealing with dates today
# Import main data sources (might not be necessary if already on my project workspace)
library(tidyverse)
library(lubridate)
library(readxl)
Copy_of_GWWC_2F80k_events_Attendance_Model <- read_excel("~/EA Data Science/Copy of GWWC%2F80k events Attendance Model.xlsx",  skip = 1)
View(Copy_of_GWWC_2F80k_events_Attendance_Model)
d2 <- Copy_of_GWWC_2F80k_events_Attendance_Model

library(readr)
Copy_of_Brooks_80k_xlsx_Sheet1 <- read_csv("~/EA Data Science/Copy of Brooks 80k.xlsx - Sheet1.csv")
d1 <- Copy_of_Brooks_80k_xlsx_Sheet1

# Create new instrument variables 


attendance_all <- d2$Attendance[1:47]
attendance <- na.omit(d2$Attendance[1:46])
d2$Time[30]

#LIKELY PROBLEM AREA WITH MAKING PAIRS FOR GGPLOT --> ALSO POSSIBLE PLACE THAT DATE MIX UPS HAPPENED
# need to create dates variable which doesn't reoder --> should keep in NAs and character strings
dates <- c(d2$Time[1:29],d2$Time[31:37])
c(d2$Time[1:29], d2$Time[31:37])

#dates needs to be in understandable form
#dates <- strptime(weeks, "%Y-%m-%d") --> didn't work for me

dates <- as.numeric(dates)
betterDates <- as.Date(dates, origin = "1899-12-30")
betterDates

# Time must be converted to week value
weeks  <- isoweek(ymd(betterDates))

years <- isoyear(ymd(betterDates))
years

# complicated method
weeks_2015 <- c()
weeks_2016 <- c()
for(i in 1:length(years)){
  if (years[i] == "2016") {
    weeks_2016 <- c(weeks_2016, weeks[i])
  }
  if (years[i] == "2015") {
    weeks_2015 <- c(weeks_2015, weeks[i])
  }
}

weeks_2015
weeks_2016

#simpler method
w2_2015 <- sapply(weeks[years == "2015"], c)
w2_2015
w2_2016 <- sapply(weeks[years == "2016"], c)
w2_2016

# Now compare Weeks by year and attendance (obviosuly extremely crude ... I will later differentiate by term)
attendance_2015 <- d2[years == "2015", 11]
attendance_2015_nona <- as_vector(na.omit(d2[years == "2015", 11]))
attendance_2015_nona
attendance_2016 <- d2[years == "2016", 11]
attendance_2016_nona <- na.omit(d2[years == "2016", 11])
attendance_2016_nona
attendance_2016_nona_nolargest <-attendance_2016_nona[1:16,]

w2_2015_nonaat <- w2_2015[is.na(attendance_2015) == F]

d3 <- data_frame(attendance_2015_nona, w2_2015_nonaat)

# Result finds that only (11 attendance,time) fairs for 2015 and 17 for 2016. This means count of attendance values in this document is only 28!!! 
#confirm
length(na.omit(d2$Attendance))

#Visualize a Scatter Plot - at this stage shouldn't be too useful for patterns, after this I can call it a night since I've done everything in one night excluding what preceeds importing the data ;)
#make sure tidyverse package loaded
ggplot(data = d3) + 
  geom_point(mapping = aes(x = w2_2015_nonaat, y = attendance_2015_nona))
# Done! Hell Yeah :) imagine smiley with sunglasses looking awesome
# scatter plot makes a lot of sense at first glance --> only two values before week 40 which makes sense as table started in Michlemas 2015 anyways, Should check what the outliers are...
# I take that back --> Several Mistakes observed --> 1: betterDates has mixed up days and months in most cases 2: I don't think attendance and weeks has lined up properly --> INVESTIGATE TOMORROW 
# End of Main Content