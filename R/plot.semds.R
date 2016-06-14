plot.semds <- function(x, plot.dim = c(1,2), labels = TRUE, asp = 1, xlab, ylab, main, pch, ...) {
  ## x         ... object of class "semds"
  
  if (missing(xlab)) xlab1 <- "Dimension 1" else xlab1 <- xlab
  if (missing(ylab)) ylab1 <- "Dimension 2" else ylab1 <- ylab
  if (missing(pch))  pch1 <- 20 else pch1 = pch
  if (missing(main)) main1 <- "SEMDS Configuration" else main1 <- main
  
  plot(x$conf, asp = asp, xlab = xlab1, ylab = ylab1, main = main1, pch = pch1, ...)
  if (labels) text(x$conf, labels = rownames(x$conf), cex = 0.8, pos = 3, ...)
  
}
