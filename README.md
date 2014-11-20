Getting and Cleaning Data Course Project
========================================

Subject: Human Activity Recognition Using Smartphones

This course project uses data from the Human Activity Recognition Using Smartphones Dataset, Version 1.0, provided in the following study: Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


Description
-----------

This course project consists on the collection, working with and cleaning of the Human Activity Recognition Using Smartphones Dataset (Version 1.0). In order to do so, a script file named Run_analysis.R was created. This file contains information regarding the steps requested by the project and also the code to compute and obtain a tidy dataset with a selected set of variables.

The script does the following:

- Consolidates the train dataset.
- Consolidates the test dataset.
- Consolidates both datasets in a single object called complete_dataset. (STEP 1 of course project)
- Loads the variables names given by the dataset authors and assign them to the dataset.
- Extract only the measurements on the mean and standard deviation for each measurement. (STEP 2 of course project)
- Uses descriptive activity names to label the activity variable of the dataset (STEP 3 of course project)
- Renames the variables aprotiately with new variable names that ara self descriptive and made of modular strings, for easier reading. (STEP 4 of course project)
- Using the modified dataset, a new one is created with the average for each variable, for each activity and each subject. (STEP 5 of course project)
- Write a file named selected_dataset.txt containing this new dataset.


The final dataset is included in the following file:
	
	- selected_dataset.txt

Files included in the repository
--------------------------------

	- avarages_dataset.txt
	- Codebook.md
	- data.zip
	- README.md
	- run_analysis.R

Licence
-------

The use of this file is made public only for academic purposes. No distribution of this repository of any of its included files is allowed.
