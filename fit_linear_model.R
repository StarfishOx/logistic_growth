#Script to estimate the model parameters using a linear approximation

install.packages("dplyr")
#library(dplyr)


growth_data <- read.csv("experiment1.csv")  #read & store data

#Case 1. K >> N0, t is small

#filter data & log transform population size values
data_subset1 <- growth_data %>% filter(t<1000) %>% mutate(N_log = log(N)) 

model1 <- lm(N_log ~ t, data_subset1)  #fit linear regression model
summary(model1)  #show summary of model 

#Case 2. N(t) = K

data_subset2 <- growth_data %>% filter(t>3000) #filter data

model2 <- lm(N ~ 1, data_subset2)  #fit linear regression model
summary(model2)  #show summary of model
