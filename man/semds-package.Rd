\name{semds-package}
\alias{semds-package}
\docType{package}
\title{
Structural Equation Multidimensional Scaling
}
\description{
Fits a multidimensional scaling (MDS) model for multi-way dissimilarity data. 
It uses an alternating estimation procedure in which the unknown symmetric dissimilarity 
matrix is estimated in a structural equation modeling (SEM) framework while the objects are 
represented in a low-dimensional space.
}
\details{
\tabular{ll}{
Package: \tab semds\cr
Type: \tab Package\cr
Version: \tab 0.9-2\cr
Date: \tab 2016-06-14\cr
License: \tab GPL-2\cr
}
The core function of the package is \code{semds()}. It takes a list of lower triangular dissimilarity matrices which 
reflect the asymmetric nature of the input data. It returns the parameter vector from the SEM fit as well as the 
Stress value and the resulting configurations from the MDS fit. 
}
\author{
Patrick Mair, Jose Fernando Vera

Maintainer: Patrick Mair <mair@fas.harvard.edu>
}
\references{
Vera, J. F. \& Rivera, C. D. (2014). A structural equation multidimensional scaling model
for one-mode asymmetric dissimilarity data. Structural Equation Modeling: 
A Multidisciplinary Journal, 21(1), 54--62. 
}

\keyword{ package }
\examples{
fit1 <- semds(Miller)
fit1
summary(fit1)

fit2 <- semds(BrahmsNorm)
fit2
summary(fit2)

}
