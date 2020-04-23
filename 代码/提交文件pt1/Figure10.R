library(bigPint)

load("data/soybean_ir.rda")
data <- soybean_ir
data <- data[,1:7]
data[,-1] <- log(data[,-1]+1)
datCol <- colnames(data)[-which(colnames(data) %in% "ID")]
myPairs <- unique(sapply(datCol, function(x) unlist(strsplit(x,"[.]"))[1]))

# Below is the code to examine litre plots of the four clusters. After the application opens, 1) set the "Treatment Pairs" option to "N" and "P", 2) set the "Metrics" to "FDR", and 3) set the "Metric order" option to "Increasing"

# Cluster 1
load("data/cluster1_metrics.rda")

refID = sort(data$ID)
refIDs = sapply(metrics, function(x) all(sort(x[,1]) == refID))

app <- plotLitreApp(data = data, dataMetrics = metrics, pointColor = '#00BF7D')
if (interactive()) {
  shiny::runApp(app, port = 1234, launch.browser = TRUE)
}

# Cluster 2
load("data/cluster2_metrics.rda")
a <- data.frame(metrics)


demo <- data.frame(matrix(ncol = 7, nrow = 0))
for (i in a) {
  for (j in data) {
    if (i[1] == j[1]) {
      c <- i[1]
      d <- j[1]
      print(c, d)
      demo <- rbind(demo, j)
    }
  }
}
names(a) <- c("ID", "N.1", "N.2", "N.3", "P.1", "P.2", "P.3")


app <- plotLitreApp(data = a, dataMetrics = metrics, pointColor = '#A3A500')
if (interactive()) {
  shiny::runApp(app, port = 1234, launch.browser = TRUE)
}

# Cluster 3
load("data/cluster3_metrics.rda")
app <- plotLitreApp(data = data, dataMetrics = metrics, pointColor = '#E76BF3')
if (interactive()) {
  shiny::runApp(app, port = 1234, launch.browser = TRUE)
}

# Cluster 4
load("data/cluster4_metrics.rda")
app <- plotLitreApp(data = data, dataMetrics = metrics, pointColor = '#F8766D')
if (interactive()) {
  shiny::runApp(app, port = 1234, launch.browser = TRUE)
}
