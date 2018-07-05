% test for GitHub
data(iris)
round(cor(iris[,1:4]), 2)

pc <- princomp(iris[,1:4], cor=TRUE, scores=TRUE)
iris$Species   <- as.integer(iris$Species)

library(rgl)
plot3d(pc$scores[,1:3], col=iris$Species)

text3d(pc$scores[,1:3],texts=rownames(iris))
text3d(pc$loadings[,1:3], texts=rownames(pc$loadings), col="red")
coords <- NULL
for (i in 1:nrow(pc$loadings)) {
  coords <- rbind(coords, rbind(c(0,0,0),pc$loadings[i,1:3]))
}
lines3d(coords, col="red", lwd=4)
