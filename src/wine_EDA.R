library(tidyr)
library(ggpubr)
library(tidyverse)
library(ggplot2)
library(dplyr)
library(cluster)
library(factoextra)
library(corrplot)
library(janitor)
library(here)



#reading data
data <- read_csv('data/winequality-red.csv')
glimpse(data)

##data cleaning
#Remove empty rows and/or columns from a data.frame
data %>%
  remove_empty(c("rows", "cols"))%>%
  clean_names()

head(data) #see the head of the data
summary(data) #get aggregation functions
dim(data) #to see the dimensions of data

#pairs of each features
pairs(data)

#correlation
d = cor(data)
corrplot(d, method = 'number', type = 'upper')
 
#alcohol shows the strongest correlation to wine quality.


##boxplot
#multiple
data%>%
  gather(-quality, key = "var", value = "value") %>% 
  ggplot(aes(x = factor(quality), y = value, color = quality, group = quality)) +
  geom_boxplot() +
  facet_wrap(~ var, scales = "free")+
  guides(fill = guide_legend(title = "Quality"))+ xlab("quality")

#single close plots
ggplot(data, aes(x = factor(quality), y =alcohol, fill = quality)) + 
  stat_boxplot(geom = "errorbar", width = 0.25) + 
  geom_boxplot() +
  guides(fill = guide_legend(title = "Quality"))+ xlab("quality")


ggplot(data, aes(x = factor(quality), y =volatile_acidity, fill = quality)) + 
  stat_boxplot(geom = "errorbar", width = 0.25) + 
  geom_boxplot() +
  guides(fill = guide_legend(title = "Quality"))+ xlab("quality")


##density plots
#multiple
data%>%
  gather(-quality, key = "var", value = "value") %>% 
  ggplot(aes(x = value, fill=factor(quality))) +
  geom_density(alpha=0.3) +
  facet_wrap(~ var, scales = "free")+
  guides(fill = guide_legend(title = "Quality"))+ xlab("quality")

#single
data %>% ggplot(aes(x=volatile_acidity, fill=factor(quality))) +
  geom_density(alpha=0.3)


##histograms
#multiple
data %>% gather() %>% head()

ggplot(gather(data), aes(value)) + 
  geom_histogram(color= "black", fill="lightblue") + 
  facet_wrap(~key, scales = 'free_x')

#single
ggplot(data, aes(x=citric_acid)) + geom_histogram(color="black", fill="lightblue")



#PCA re-scaling

res.pca  <- prcomp(data[, -12],  scale = TRUE)
fviz_pca_biplot(res.pca, geom="point", habillage=data$quality, repel=TRUE, alpha=0.5, addEllipses=TRUE)



###Fitting Linear Models
?lm
lm.fit <- lm(quality ~ alcohol, data = data)

lm.fit
summary(lm.fit)
###
names(lm.fit)
coef(lm.fit)

###to get the confidence interval lower and upper bound
confint(lm.fit)

###abline is to draw the estimated line 
plot(data$alcohol, data$quality)
abline(lm.fit, lwd = 3, col = "red")

## Multiple Linear Regression
###. means the rest of vars
lm.fit <- lm(quality ~ . , data = data)
summary(lm.fit)
