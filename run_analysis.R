#GETTING AND CLEANING DATA - COURSE PROJECT
#(TO LOAD DATA "UCI HAR Dataset" FOLDER SHOULD BE IN YOUR WORKING DIRECTORY)
#---------------------------------------------------------------------------


    #CONSOLIDATE AND LOAD TEST DATA
        #Load data files
        subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
        x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
        y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
        
        #Compile the test dataset in 563 variables with 2947 observations.
        test_dataset <- cbind(subjects_test, y_test, x_test)


    #CONSOLIDATE AND LOAD TRAIN DATA
        #Load data files
        subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
        x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
        y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
        
        #Compile the test dataset in 563 variables with 7352 observations.
        train_dataset <- cbind(subjects_train, y_train, x_train)


    #STEP 1 - MERGES THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET.
        #Creates one data set with 563 variables and 10299 observations.
        complete_dataset <- rbind(test_dataset, train_dataset)

        #Loads variable names (features.txt) and add it names for the subject and activity columns
        variable_names <- read.table("UCI HAR Dataset/features.txt")
        variable_names <- rbind(data.frame(V1=0 , V2=c("Subject", "Activity")), variable_names)

        #Assings this names to complete_dataset
        names(complete_dataset) <- variable_names[, 2]


    #STEP 2 - EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT.
        #Search and select variables that contain mean() or std() in its names.
        selected_variables_mean <- grepl("mean()", names(complete_dataset), fixed=TRUE)
        selected_variables_std <- grepl("std()", names(complete_dataset))
        selected_variables <- selected_variables_mean | selected_variables_std
        selected_variables[c(1,2)] <- TRUE #(Selects subject and activity coloums too)
        
        #Selects the data set with the specified variables names
        selected_dataset <- complete_dataset[, selected_variables]


    #STEP 3 - USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET.
        #Loads activities labels from downloaded data and remove underscores.
        activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
        activity_labels[, 2] <- gsub("_", " ", activity_labels[, 2]) 

        #Assings labels to second column of slected_dataset_1 (activity variable)
        selected_dataset[, 2] <- factor(selected_dataset[, 2], labels=activity_labels[, 2])


    #STEP 4 - APROTIATELY LABELES THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES.
        #Identify variable name caracteristics
        names_characteristics <- data.frame(OriginalNames=names(selected_dataset))
        names_characteristics$Time_Frequency <- grepl("^[t]", names_characteristics$OriginalNames)
        names_characteristics$Body_Gravity <- grepl("*Body", names_characteristics$OriginalNames)
        names_characteristics$Accelerometer_Gyroscope <- grepl("*Acc", names_characteristics$OriginalNames)
        names_characteristics$Jerk <- grepl("*Jerk[^M]", names_characteristics$OriginalNames)
        names_characteristics$Mag <- grepl("*[^k]Mag", names_characteristics$OriginalNames)
        names_characteristics$JerkMag <- grepl("*JerkMag", names_characteristics$OriginalNames)
        names_characteristics$Mean_Std <- grepl("*mean", names_characteristics$OriginalNames)
        names_characteristics$X <- grepl("X$", names_characteristics$OriginalNames)
        names_characteristics$Y <- grepl("Y$", names_characteristics$OriginalNames)
        names_characteristics$Z <- grepl("Z$", names_characteristics$OriginalNames)

        #Replaces variable names strings for new ones.
        new_variable_names <- c()
        for (i in c(1:68)) {
          names_strs <- c()
          if (names_characteristics[i, 8]) {names_strs <- rbind(names_strs, "mean")} else {names_strs <- rbind(names_strs, "stdd")}  
          if (names_characteristics[i, 2]) {names_strs <- rbind(names_strs, "time")} else {names_strs <- rbind(names_strs, "freq")}
          if (names_characteristics[i, 3]) {names_strs <- rbind(names_strs, "body")} else {names_strs <- rbind(names_strs, "grav")}
          if (names_characteristics[i, 4]) {names_strs <- rbind(names_strs, "acc")} else {names_strs <- rbind(names_strs, "gyr")}
          if (names_characteristics[i, 5]) {names_strs <- rbind(names_strs, "jerk")} else {}
          if (names_characteristics[i, 6]) {names_strs <- rbind(names_strs, "mag")} else {}
          if (names_characteristics[i, 7]) {names_strs <- rbind(names_strs, "jerkmag")} else {}
          if (names_characteristics[i, 9]) {names_strs <- rbind(names_strs, "x")} else {}
          if (names_characteristics[i, 10]) {names_strs <- rbind(names_strs, "y")} else {}
          if (names_characteristics[i, 11]) {names_strs <- rbind(names_strs, "z")} else {}
          name <- paste(names_strs, collapse=".")
          new_variable_names <- rbind(new_variable_names, name)
        }
        new_variable_names[c(1,2), 1] <- c("subject", "activity")

        #Asing variables in selected_dataset new variables names.
        names(selected_dataset) <- new_variable_names[, 1]


    #STEP 5 - FROM THE DATA SET IN STEP 4, CREATE A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE FOR
    #EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT.
        #Casts the selected_dataset
        library(reshape2)
        averages_dataset <- vector(length=180)
        for (i in c(3:length(names(selected_dataset)))) {
          var_name <- names(selected_dataset[i])
          averages_dataset_i <- dcast(selected_dataset, subject + activity ~.,mean, value.var=as.character(var_name))
          if (i != 3) {} else {averages_dataset <- averages_dataset_i[, c(1,2)]}
          averages_dataset <- cbind(averages_dataset, averages_dataset_i[, 3])
          names(averages_dataset)[i] <- paste("ave.", var_name, sep="")
        }

        #Write the averages_dataset in a txt file
        write.table(averages_dataset, "./averages_dataset.txt", row.name=FALSE)
