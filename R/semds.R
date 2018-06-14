semds <- function(D, dim = 2, saturated = FALSE, theta0 = NULL, maxiter = 1000, eps = 1e-6) {

  cl <- match.call()
  
  ## ---- data preparation
  if (is.data.frame(D)) D <- as.matrix(D)
  if (is.matrix(D)) {                         ## asymmetric case
    if (nrow(D) == ncol(D)) {
      d11 <- as.vector(D[lower.tri(D)])
      d22 <- as.vector(t(D)[lower.tri(t(D))])
      d11 <- normDissN(d11, 1, 1)                   ## normalization
      d22 <- normDissN(d22, 1, 1)
      D1 <- cbind(d11, d22)
      n <- ncol(D)
      cnames <- rownames(D)
    } else {
      m1 <- nrow(D)
      n <- 0.5 + sqrt(0.5^2 - 4*0.5*(-m1))  
      D1 <- D
      cnames <- NULL
    }
  }
  
  if (is.list(D)) {                          ## three-way case
    D1 <- sapply(D, function(dd) as.vector(as.dist(dd)))
    D1 <- apply(D1, 2, normDissN, 1, 1)   ## normalization
    n <- ncol(as.matrix(D[[1]]))
    cnames <- rownames(as.matrix(D[[1]]))
  }
  
  M <- D1
  m <- nrow(M)    
  
  conf1 <- FunConfigInicial3(M, dim)
  Z <- conf1$X 
  R <- conf1$R
  
  if (is.null(theta0)) {               ##Initial parameter values for the SEM step.
    theta0 <- c(1, rep(0.5, conf1$R+2))
  }

  SSk <- 0.1                   ## decreasing identification constraints for DX.

  saturado <- saturated
  if ((saturado) && (conf1$R > 2)) {
    saturado <- FALSE
    warning("Saturated models are implemented for the asymmetric special case only. A non-saturated model is fitted.")
  }
    
  disp1 <- FunDispariSEM3(Xi = conf1$Xi, Xim = conf1$Xim, R = R, DXm = conf1$DXm, SSk = SSk, theta0 = theta0, saturado = saturado)

  ## Normalization for the identification constraint of var(Delta)
  DISPARI <- as.vector(disp1$Delta %*% sqrt((n*(n-1)/2)/sum(disp1$Delta^2)))
  DISPARIM <- squareform(DISPARI)
  Distancia <- squareform(conf1$DX)

## ------------------------ SMACOF-SEM ------------------------------
  k <- 1
  NumIte <- maxiter
  STRSSB <- NULL
  Ddiff <- DISPARIM-Distancia
  STRSSB[1] = (1/2)*sum(diag(Ddiff %*% Ddiff)) ## Raw initial STRESS
  N <- NULL
  N[1] <- 1
  SS <- NULL
  SS[1] <- 0
  STRSSB_N <- NULL
  STRSSB_N[1] <- STRSSB[k]/sum(DISPARI^2)    ## STRESS normalizado
  BZ <- matrix(0, n, n)
  theta0 <- disp1$theta
  sdiff <- 1

## Alternating estimation procedure: The configuration is estimated using
## the Guttman transformation and the disparities are estimated in SEM.


  while ((k==1 || k < NumIte) && (sdiff > eps)) {
    k <- k+1
    
    ## Guttman step
    for (l in (1:n)) {
      for (h in (1:n)) {
        if (l != h) { 
          BZ[l,h] <- -DISPARIM[l,h]/Distancia[l,h] 
        } else {
          BZ[l,h] <- 0
        }
      }
    }
    for (l in 1:n) BZ[l,l] = -sum(BZ[l,])
    
    X <- (1/n)*BZ %*% Z     ## Y1 GUTTMAN transformation
    
    ## SEM step
    DX <- as.vector(dist(X))
    DXm <- DX-(1/m)*ones(m) %*% DX  ## Column vector
    disp <- FunDispariSEM3(conf1$Xi, conf1$Xim, R, DXm, SSk, theta0, saturado)
    Distancia <- squareform(DX)
    DISPARI <- as.vector(disp$Delta %*% sqrt((n*(n-1)/2)/sum(disp$Delta^2)))
    
    DISPARIM <- squareform(DISPARI)
    ## Raw STRESS
    Ddiff <- DISPARIM-Distancia
    STRSSB[k] = (1/2)*sum(diag(Ddiff %*% Ddiff)) ## Raw initial STRESS  
    STRSSB_N[k] <- STRSSB[k]/sum(DISPARI^2)                 ## Normallized STRESS
    SS[k] <- STRSSB[k-1]-STRSSB[k] ## Medimos las diferencias para el bruto.
    N[k] <- k
    if (SS[k] > 0) {
      Z <- X
      theta0 <- disp$theta
      SSk <- STRSSB_N[k-1]-STRSSB_N[k] ##*std(Delta);
      STRSSBNFinal <- STRSSB_N[k]
      STRSSBFinal <- STRSSB[k]
      Deltafinal <- DISPARI 
      NiterSEM <- k
      Thetaf <- disp$theta
    } else {
      DX <- as.vector(dist(X)) 
      DXm=DX-(1/m)*ones(m) %*% DX  ## Column vector.
    }
    
    sdiff <- STRSSB[k-1]-STRSSB[k]
  }
  
  if (NiterSEM == maxiter) warning("Iteration Limit Reached! Increase maxiter!")
  
  ## --------------------------- END SMACOF-SEM ---------------------------------------
  
  CoordMDSSEM <- Z
  rownames(CoordMDSSEM) <- cnames
  colnames(CoordMDSSEM) <- paste0("D", 1:dim)
  DistMDSSEM <- dist(CoordMDSSEM)
  
  nobj <- nrow(as.matrix(DistMDSSEM))
  Deltamat <- matrix(0, nobj, nobj)
  rownames(Deltamat) <- colnames(Deltamat) <- cnames
  Deltamat[lower.tri(Deltamat)] <- Deltafinal
  Deltamat <- as.dist(Deltamat)  
  
  tnames <- c("b", paste0("lambda", 1:ncol(M)))
  if (saturado) tnames <- c(tnames, "sigma2_e1", "sigma2_e2", "sigma2_zeta") else  tnames <- c(tnames, "sigma2_e", "sigma2_zeta")
  names(Thetaf) <- tnames
  if (!saturado) {
    thetatab <- disp$thetatab
    rownames(thetatab) <- tnames
  } else {
    thetatab <- data.frame(Estimate = Thetaf,  Std.Error = NA)
  }
  
  result <- list(stressnorm = sqrt(STRSSBNFinal), stressraw = STRSSBFinal, Delta = Deltamat, theta = Thetaf, conf = CoordMDSSEM,
                 dist = DistMDSSEM, niter = NiterSEM, thetatab = thetatab[,1:2], call = cl)
  class(result) <- "semds"
  return(result)
}
