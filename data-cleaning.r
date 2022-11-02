data <- read.csv(file.choose(), header = TRUE)
dim(data)

numeric.data <- data.frame(
  data$Age,
  data$Tumor.Size,
  data$Regional.Node.Examined,
  data$Reginol.Node.Positive,
  data$Survival.Months,
  as.numeric(data$Grade)
)

install.packages("corrplot")
library("corrplot")
corrplot(cor(numeric.data))


#convert other data into classes
