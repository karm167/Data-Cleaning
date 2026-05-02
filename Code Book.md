## Code Book
Below, we try to make explicit the steps taken to generate the final set included in the repository.   
1. **Download the raw data**
Follow the link [Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Download and unzip the raw data into the working R directory.   
2. **Forming a unique Dataset**: We stack the measurements from the training set and the test set into a unique set. We do the same for the subject ID and activity ID variables. We subsequently attach the activity and subject columns to the measurement dataset  
3. **Labeling the variables**: The provided features dataset allows us to label the columns for the measurement set. We then filter the columns to retain only the ones that contain the labels Mean() and std()
