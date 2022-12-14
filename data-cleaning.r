#install.packages("ggplot2")
#install.packages("GGally")
#install.packages("reshape")

library("reshape")
library("magrittr")
library("ggcorrplot")
library("ggplot2")
library("GGally")

data <- read.csv(file.choose(), header = TRUE)
x <- data$X
data <- subset (data, select = -c(X, id))
dim(data)

data$diagnosis = factor(data$diagnosis)

head(data)

pairPlot <- ggpairs(data)
pairPlot

lin.data = subset(data, select = -c(compactness_se, texture_mean,radius_se, texture_se, perimeter_se, area_se,smoothness_se,fractal_dimension_mean, concavity_se, fractal_dimension_worst, symmetry_worst,texture_worst))

pairPlot <- ggpairs(lin.data)
pairPlot


meltData <- melt(data)
boxplot(data = meltData, value~variable )

write.csv(lin.data, file.choose())

# The variables with the most outliers are area_mean and area_worst
