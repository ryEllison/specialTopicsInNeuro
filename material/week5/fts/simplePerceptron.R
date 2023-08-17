##Sys block
options(warn = -1)
set.seed(120413)

##Library block
library(dplyr) 
library(neuralnet)

#Dummy df
df <- data.frame('x' = seq(0, 10, 1),
                 'y' = seq(0, 10, 1))

#Build ANN
neuralNet <- neuralnet(y ~ x,
                       data = df, 
                       hidden = 0,
                       act.fct = 'logistic',
                       linear.output = FALSE,
                       startweights = NULL)

#Visualize
pdf('simplePerceptron.pdf')

plot(neuralNet,
     col.intercept = 'dodgerblue',
     show.weights = TRUE,
     information = FALSE,
     rep = 'best')

graphics.off()