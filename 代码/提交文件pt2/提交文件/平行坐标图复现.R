library(ggplot2)
library(cowplot)
library(data.table)
library(gridExtra)

source("functions.R")

set.seed(50)

pcpPlots <- vector('list', 2)


# In the first case, we purposely create individual observations that will be inconsistent across their replications
A.1=c(rnorm(25,10),rnorm(25,6))
A.2=c(rnorm(25,10),rnorm(25,6))
A.3=c(rnorm(25,10),rnorm(25,6))
B.1=c(rnorm(25,6),rnorm(25,10))
B.2=c(rnorm(25,6),rnorm(25,10))
B.3=c(rnorm(25,6),rnorm(25,10))
makePlots(A.1, A.2, A.3, B.1, B.2, B.3, 1)

# In the second case, we purposely create individual observations that will be more consistent across their replications
A.1=c(rnorm(50,8))
A.2=c(rnorm(50,8))
A.3=c(rnorm(50,8))
B.1=c(rnorm(50,8))
B.2=c(rnorm(50,8))
B.3=c(rnorm(50,8))
makePlots(A.1, A.2, A.3, B.1, B.2, B.3, 2)

# Arrange two plots into grid
plot1 <- plot_grid(pcpPlots[[1]], labels=c("DEG_exp"), ncol = 1, nrow = 1, label_size=12) + theme(plot.background = element_rect(size=0.1,linetype="solid",color="black"))
plot2 <- plot_grid(pcpPlots[[2]], labels=c("DEG_rep"), ncol = 1, nrow = 1, label_size=12) + theme(plot.background = element_rect(size=0.1,linetype="solid",color="black"))
grid.arrange(plot1, plot2, ncol=2)

