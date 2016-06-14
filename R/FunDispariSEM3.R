FunDispariSEM3 <- function(Xi, Xim, R, DXm, SSk, theta0, saturado) {
## Input parameters:
    ## Xi matrix of effect indicators as column vectors
    ## Xim centered effect indicators
    ## R number of matrices
    ## DXm centered distances in column vector
    ## SSk decreasing constraints for identification 
    ## theta0 initial parameter values in SEM
    ## saturado indicator value of satured model (0 is the default not satured)
    
## Output values:
    ## Delta Least squares estimated symmetric disparity values
    ## theta vector of estimated parameter values in SEM

 
 theta <- NULL         
 if ((saturado) && (R == 2)) { ## Satured model (only for R=2)
    S <- cov(cbind(DXm, Xim))
    x1 <- Xi[,1]
    x2 <- Xi[,2]
    theta[1] <- sqrt(S[2,1]*S[3,1]/S[3,2])
    theta[2] <- sqrt(S[3,2]*S[2,1]/S[3,1])
    theta[3] <- sqrt(S[3,2]*S[3,1]/S[2,1])
    theta[4] <- S[2,2]-theta[2]^2
    theta[5] <- S[3,3]-theta[3]^2
    theta[6] <- S[1,1]-theta[1]^2-SSk*S[1,1]
    if (theta[6] < 0) theta[6] <- 0
    
    Delta <- c(theta[2], theta[3]) %*% solve(rbind(c(theta[2]^2+theta[4], theta[2]*theta[3]), c(theta[2]*theta[3], theta[3]^2+theta[5]))) %*% rbind(x1, x2)
    Delta <- t(Delta)
    thetatab <- NULL
 } else  {                                     ## Not satured model
        
    lbound <- c(rep(-Inf, (length(theta0)-2)), 0, 0)  ## lower 0 bound for variance parameters
    thetaopt <- nls.lm(theta0, lower = lbound, fn = ULS3, Xim = Xim, DXm = DXm, SSk = SSk) 
    theta <- thetaopt$par
    thetatab <- summary(thetaopt)$coefficients
    
    Lambda <- theta[2:(R+1)]  ## Row vector.
    Sgm <- matrix(0, R, R)
    for (i in (2:(R+1))) Sgm[i-1,i-1] <- theta[i]^2+theta[R+2]
  
    for (i in 3:(R+1)) {
        for (j in 2:(i-1)) {
            Sgm[i-1,j-1] <- theta[i]*theta[j]
            Sgm[j-1,i-1] <- Sgm[i-1,j-1]
        }
    }
    Delta <- Lambda %*% solve(Sgm) %*% t(Xi)
    Delta <- t(Delta)     ## Column vector.
 }

 result <- list(Delta = Delta, theta = theta, thetatab = thetatab)
 return(result)
}
