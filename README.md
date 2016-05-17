# Getting and Cleaning Data: Course Project
## Analysis script
This repository contains an R script called [run_analysis.R](https://github.com/tgcornel/Getting-and-Cleaning-Data-Course-Project/blob/master/run_analysis.R) that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

The script extracts the measurements that have "mean()" or "std()" in their name. The variables called "meanFreq" and "Mean" are not included.

## Instructions
Follow these steps to run the script:
1. Download the data from this [link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip), and unzip the data in your R working directory. You will 
have a new directory "UCI HAR Dataset" in your working directory.
2. Make sure that the `dplyr` library is installed (`install.packages("dplyr")`). The script will load the library if needed, but it will not install it.
3. Copy the script to your working directory and run it with `source("run_analysis.R")`. This will produce a file [tidy_data.txt] in your working directory that contains a table with 180 rows and 88 columns corresponding to the average of each variable (88 selected features) for each activity (6) and each subject (30).

## Code book
This repository also contains a [code book], that describes the variables and summaries calculated along with their units.

## References
Use of this data set in publications must be acknowledged by referencing the following publication [1].

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012.

This data set is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.