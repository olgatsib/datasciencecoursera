Getting and Cleaning Data
=========================

One script - run_analysis.R - performs the following tasks:

1. Merges training and testing sets on the data (setX)
2. Merges training and testing sets on the activities,
   presented as numbers (sety)
3. Extracts features labels from the file and append them 
   as a header to the data set of measurements (setX)
4. Extracts from 'setX' only columns with mean and standard deviation 
   for all measurements
5. Extracts activity descriptions, merges them by ID with 
   sety. Since order is not preserved while merging, a new
   column 'id' is added to the set. When merging is done, 
   the order is restored by those ids.
6. Merges activity descriptions with the set of measurements
   and creates a new set 'withlabels'
7. Merges subject data from training and testing sets and then 
   appends them to the fron of the main data ('withlabels'), 
   the resulting set is set to a new variable 'final' 
8. Computes averages of each measurement for each subject
   and each activity.
9. Sorts the resulting set by subject
10. Writes the resulting set to the txt file  


