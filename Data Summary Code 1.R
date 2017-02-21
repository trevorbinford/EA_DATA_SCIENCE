#The simple code below quickly summarizes the tile, type and number of files by year. Perfect for a macrosummary! :)
#We will deal with number of variables and values soon. To use this code on your own r platform you need to change string in setwd()
# ... so that it sets your working directory as the folder where the excel files are located.

# BUT CALM: no need to do this as I have already copied the results of this code to a new Github file.

  #Years -- number of files, number of variables, number of values, form types

    #first one requires careful observation (and tallying - put in data summary doc along with name of file and year it's from)
    #second is possible using matrix_all_variable_names but should be careful to collect this by data file too
    #third is given by that step and we can aggregate too
    #fourth is through careful observation again (and tallying - put in data summary doc along with name of file and year it's from)


#2014
setwd("~/EA Data Science/DATA-20170216T184047Z/DATA") #-->this was for my wd, you'll need to set to the wd where the data folder is contained
temp = list.files(pattern="*.xlsx")
temp


setwd("~/EA Data Science/DATA-20170216T184047Z/DATA/2014")
temp_2014 = list.files(pattern="*.xlsx")
temp_2014

setwd("~/EA Data Science/DATA-20170216T184047Z/DATA/2015")
temp_2015 = list.files(pattern="*.xlsx")
temp_2015

#Please note that a word doc exists in 2015 collecting Likes and Dislikes information that I have not shown
# --> We should investigate that soon and desrcibe it separately, perhaps turining it into a dataframe

setwd("~/EA Data Science/DATA-20170216T184047Z/DATA/Michaelmas 2016")
temp_Michaelmas_2016 = list.files(pattern="*.xlsx")
temp_Michaelmas_2016

setwd("~/EA Data Science/DATA-20170216T184047Z/DATA/Lent 2017")
temp_Lent_2017 = list.files(pattern="*.xlsx")
temp_Lent_2017


#end of main content
