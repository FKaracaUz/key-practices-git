library(package)
setwd("directory")
data <- read.delim("data.csv", header = TRUE, sep = ",")

# 3. Make variables ready to work on
data <- data %>%
            select(ppID, condition, trial, RT) %>%
            mutate(condition = as.factor(condition), target = as.factor(target))
data <- na.omit(data)

summary(data)

#main model for RQ1
anovaRTbycategory <- aov(RT ~category+error(ppID/category), data = analysis_anova)
summary(anovaRTbycategory)