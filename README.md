## Data-Cleaning
This repository contains the following files as prescribed for the submission of the final project for the 
" Getting and Cleaning Data" course
1. **"run_analysis.R"**: a detailed R script showing how to get the final (tidy) dataset from the original sets
    **Download the raw data**
Follow the link [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Download and unzip the raw data into the working R directory.   
   **Forming a unique Dataset**: We stack the measurements from the training set and the test set into a unique set. We do the same for the subject ID and activity ID variables. We subsequently attach the activity and subject columns to the measurement dataset  
   **Labeling the variables**: The provided features dataset allows us to label the columns for the measurement set. We then filter the columns to retain only the ones that contain the labels Mean() and std(). By using a merging process we give a name to all activity IDs.  
    **The Final Set** We proceed, as required, in grouping the dataset resulting from the step above by Subject and activity, and displaying the means of the remaining variables. We also made the variables more descriptive.
   
2. **"Final_Set"**: the final dataset obtained from running the above R script
3. **Code book.md**: a code book explaining the steps in the R-script and the resulting variables.
