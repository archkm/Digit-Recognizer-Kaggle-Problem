# Reading the Train and Test Data
Digit <- read.csv("D:\\PGD Data Science\\Term 2\\Machine Learning\\Kaggle\\Digit Recognizer\\train.csv", 
                  header = TRUE)
Digit.Kaggle <- read.csv("D:\\PGD Data Science\\Term 2\\Machine Learning\\Kaggle\\Digit Recognizer\\test.csv",
                         header = TRUE)

# Library
library(class)

# Label as Factor
Digit$label <- as.factor(Digit$label)

# Sampling the Train File
Sample.Digit <- sample.int(n = nrow(Digit), size = floor(0.80*nrow(Digit)), 
                           replace = FALSE)

# Train and Test Data
Digit.Train <- Digit[Sample.Digit,]
Digit.Test <- Digit[-Sample.Digit,]

# Train Data Without Labels
Digit.Train.Features <- Digit.Train[,-1]

# Test Data Without Labels
Digit.Test.Features <- Digit.Test[,-1]

# Train Data Labels
Digit.Train.Labels <- Digit.Train[,1]

# Test Data Labels
Digit.Test.Labels <- Digit.Test[,1]

# kNN Model for k = 22
Digit_Model <- knn(Digit.Train.Features, Digit.Kaggle, 
                   cl = Digit.Train.Labels, k = 22)

Digit.Prediction <- as.data.frame(Digit_Model)

# Writing as CSV File
write.csv(Digit.Prediction, file = "Digit.Prediction.csv", row.names = FALSE)
