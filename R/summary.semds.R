summary.semds <- function(object, std = FALSE, ...)
{
    ## object ... object of class "semds"
    if (!std) {
      cat("\nTheta Parameters:\n")
      ##ttab <- cbind(round(object$thetatab[,1:2], 4), round(object$thetatab[,3:4], 3))
      ttab <- cbind(round(object$thetatab[,1:2], 4))
      print(ttab)
      cat("\n")
    } else {
      sDelta <- sd(object$Delta)                                 ## sd Delta
      cat("\nTheta Parameters (standardized): \n")
      cat("sd(Delta) =", round(sDelta, 4), "\n\n")
      nbl <- min(grep("sigma", rownames(object$thetatab))) - 1   ## b and loadings index
      object$thetatab[1:nbl,1] <- object$thetatab[1:nbl,1]/sDelta
      object$thetatab[1:nbl,2] <- sqrt(object$thetatab[1:nbl,2]^2/sDelta^2)
      ttab <- cbind(round(object$thetatab[,1:2], 4))
      print(ttab)
      cat("\n")
    }
invisible(ttab)
}
