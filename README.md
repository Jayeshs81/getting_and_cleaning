# getting_and_cleaning
Submission for Getting and Cleaning Data Assignment

The overall code is broken up into four main parts
1. In the first part of the code, the data is read from the various files into the R data.frame using the read.table function. 
Eight data frames are read into R
  a. Activity Names
  b. Feature Names
  c. Train Subject Data
  d. Test Subject Data
  e. Train Data
  f. Test Data
  g. Train Activity Data
  h. Test Activity Data
  
 2. In the second part of the code, the column names of the variod data frames are given user friendly names
 
 3. In the third part of the code, the currently separate data frames are combined to create a final merged data set
  a. First activity data and activity names are combined to convert numbers to user friendly activity names
  b. Train and Test data are combined by column binding factor data, activity and subject
  c. Final data set is created by row binding train and test data
  
 4. In the fourth part of the code, the dataset is melted to convert the different columns into variables and then the molten data set is summarized and written to a file.
