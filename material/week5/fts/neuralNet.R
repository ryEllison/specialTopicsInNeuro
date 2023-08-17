##Sys block
options(warn = -1)
set.seed(120413)

##Library block
library(dplyr) 
library(neuralnet)

#Dummy df
df <- data.frame('modality' = seq(1, 10, 1),
                 'y' = c(rep('burster', 5), rep('spiker', 5)))

#Compute number of hidden nodes
hiddenNodes = ceiling(((2*1)/3) + 2)

#Build ANN
neuralNet <- neuralnet(y ~ modality,
                       data = df, 
                       hidden = hiddenNodes,
                       act.fct = 'logistic',
                       linear.output = FALSE,
                       startweights = NULL)

#Visualize
pdf('neuralNet.pdf')

plot(neuralNet,
     col.intercept = 'dodgerblue',
     show.weights = FALSE,
     information = FALSE,
     rep = 'best')

graphics.off()