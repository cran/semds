FunConfigInicial3 <- function(M, dim) {
## m=n(n-1)/2, where n=number of objects.
## R is the number of dissimilarity matrices.
## Xi matrix of effect indicators arranged in columns
## Xim is Xi centered for the SEM step.
## Dx initial distances in column vector
## Dxm is Dx centered for the SEM step.

M <- as.matrix(M)  
m <- nrow(M)
R <- ncol(M)
Xi <- M
## Centering for the SEM step.
I <- diag(1, m)
H <- I-((1/m)*ones(m,1) %*% ones(1,m))
Xim <- H %*% M

sqvec <- rowSums(M)/R
MSEI <- squareform(sqvec)         ## Averaged symmetric dissimilarity matrix.

X <- cmdscale(MSEI, k = dim)        
DX <- as.vector(dist(X))
DXm <- DX - (1/m * ones(m) %*% DX)
result <- list(X = X, m = m, R = R, Xi = Xi, Xim = Xim, DX = DX, DXm = DXm)
return(result)
}
