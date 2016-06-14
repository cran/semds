ULS3 <-
function(theta, Xim, DXm, SSk) {
  R <- ncol(Xim)
  S <- cov(cbind(DXm, Xim))
  f <- matrix(0, R+1, R+1)
  f[1,1] <- sqrt(0.5)*(S[1,1] - theta[1]^2-theta[R+3]-SSk*S[1,1])
  for (i in 2:(R+1)) {
    f[i,1] <- S[i,1] - theta[i]*theta[1]
    f[i,i] <- sqrt(0.5)*(S[i,i]-theta[i]^2-theta[R+2])
  }
  for (i in 3:(R+1)) {
    for (j in 2:(i-1)) f[i,j] <- S[i,j] - theta[i]*theta[j]
  }
  return(f[lower.tri(f, diag = TRUE)])
  ##return(log(f[lower.tri(f, diag = TRUE)]))
}
