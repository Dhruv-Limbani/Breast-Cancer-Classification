#install.packages("ggplot2")
#install.packages("GGally")


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

# cor(data) %>% ggcorrplot(show.diag = FALSE, lab = TRUE)

useless.features <- c("compactness_se", "texture_mean,radius_se", "texture_se", "perimeter_se", "area_se,smoothness_se","fractal_dimension_mean", "concavity_se", "fractal_dimension_worst", "symmetry_worst","texture_worst")
lin.data = subset(data, select = -c(compactness_se, texture_mean,radius_se, texture_se, perimeter_se, area_se,smoothness_se,fractal_dimension_mean, concavity_se, fractal_dimension_worst, symmetry_worst,texture_worst))

pairPlot <- ggpairs(lin.data)
pairPlot

boxplot(lin.data$radius_mean)
boxplot(lin.data$perimeter_mean)
boxplot(lin.data$area_mean)
boxplot(lin.data$smoothness_mean)
boxplot(lin.data$compactness_mean)
