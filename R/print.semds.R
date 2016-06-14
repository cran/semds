print.semds <-
function(x, ...)
  {
    ## x ... object of class "semds"
    cat("Call:\n")
    print(x$call)
  
    cat("\nSEMDS fit:")
    cat("\nNumber of Iterations: ", x$niter)
    cat("\nRaw Stress: ", round(x$stressraw, 4))
    cat("\nStress-1: ", round(x$stressnorm, 4),"\n")
    cat("\n")
  }
