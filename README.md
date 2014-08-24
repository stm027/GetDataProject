GetDataProject
==============

Course Project for the Getting and Cleaning Data Coursera Course

run_analysis.R requires that the UCI HAR Dataset be present in the working directory.

The analysis runs the following processes:

* Requires the reshape2 Package for the melt and cast functions used later
* Reads all of the data into the function to be worked with later
* Binds all the raw data into one data frame
* Applies column names from features and removes all data not measuring mean or standard deviation
* Names the activities
* Melts the data and recasts into a tidy dataset by performing a mean by Activity and Subject
* Creates a tidydata.txt in the working directory containing the tidy data set.
