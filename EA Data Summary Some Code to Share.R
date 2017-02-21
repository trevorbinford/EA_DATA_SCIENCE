# stuff for everyone

#ACTION PLAN:
#Years -- number of files, number of variables, number of values, form types

  #first one requires careful observation (and tallying - put in data summary doc along with name of file and year it's from)
  #second is possible using matrix_all_variable_names but should be careful to collect this by data file too
  #third is given by that step and we can aggregate too
  #fourth is through careful observation again (and tallying - put in data summary doc along with name of file and year it's from)

# VARIABLE Names - - frequency of occurrence of name

  #Step 1: download and import each data set 
  #Step 2: use names() function on each dataset and append to one matrix using c()
  #Step 3: use unique() command to find one matrix with all the variables
  #Step 4: check by eye and comment on any that seem very similar
  #Step 5: create frequency dataframe with sapply(factor_names, sum(matrix_all == factornames)) --> Probably won't work so use a for loop instead ;)

# number of values / missing values

  #Step 1: Assume above tasks caried out
    #Also assume that unneccessary rows omitted
  #Step 2: str(data[variable collumn], na.omit) --> to find number of values
  #Step 3: sum(as_numeric(is.na(data[variable]))) --> to find number of missing values

#List of Comments
  
  #Step 1: name(collumn_comments) <- Data_Team_Comments  ---> observe collumn_comments collumn number by eye
  #Step 2: na.omit(collumn_comments) ---> use c() to get all comments in one list and then copy/paste to data summary doc
  #Purpose of naming the comment section is to clean up the tables and so it doesn't need to go under no_name section (see below)

#Which variables to ‘destring’

  #Still under investigation --> might need a new package with a destring() function to do it cleanly at beginning of r scripts, Otherwise, the functions as_numeric should be standard practise for dealing with new variables
  #We could implement several procedures at the beginning of our code to clean the data (e.g. remove special characters) but from what I've seen at least this shouldn't be an issue for vast majority of data. As long as J finds way to import only what we need we should be good.
  
#Which columns have long answers, comment columns have no name? 

  # Observed by eye --> use the newly created variable_name_unique matrix to help. For simplicity data summary doc features a heading of long_answers & no_name with names of variables underneath  

#If Aggregated  write separate summary at end of document, referencing all the files it aggregates over or if it is separate.

  #This will be down to careful thinking. Little code can help here.

#Final Q : any other comments? → disaggregate after rest of summary done.

  #Breaking up into smaller sections could be done by string length, by key word phrases e.g. positive or negative word choice
  #We can explore these possibilites AFTER completing all the above challenges