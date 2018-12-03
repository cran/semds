\name{semds}
\alias{semds}
\alias{print.semds}
\alias{plot.semds}
\alias{summary.semds}
\title{
Structural Equation Multidimensional Scaling 
}
\description{
Fits a multidimensional scaling (MDS) model on asymmetric dissimilarity data and three-way data. It uses an alternating estimation procedure in which the unknown symmetric dissimilarity matrix is estimated in a structural equation modeling (SEM) framework while the objects are represented in a low-dimensional space.
}
\usage{
semds(D, dim = 2, saturated = FALSE, theta0 = NULL, maxiter = 1000, eps = 1e-06)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{D}{
A list of input dissimilarity matrices for the general multiway case. For the special 2-way case it can also be a single asymmetric dissimilarity matrix.
}
  \item{dim}{
Number of dimensions for MDS solution.
}
  \item{saturated}{
For the 2-way case only: whether the model is saturated (TRUE) or not (FALSE; default).
}
  \item{theta0}{
Starting values for SEM parameter vector.
}
  \item{maxiter}{
Maximum number of iterations.
}
  \item{eps}{
Convergence criterion for difference of subsequent stress values. 
}
}
\details{
Add details
}
\value{
Returns an object of class \code{"semds"} containing the following elements. 
\item{stressnorm}{Normalized stress value.}
\item{stressraw}{Raw stress value.}
\item{Delta}{Disparity matrix.}
\item{theta}{SEM parameter vector.}
\item{conf}{MDS configurations.}
\item{dist}{Distance matrix based on configurations}
\item{niter}{Number of iterations.}
\item{thetatab}{Parameter table.}
\item{call}{Function call.}
}
\references{
Vera, J. F. & Rivera, C. D. (2014). A structural equation multidimensional scaling model for one-mode asymmetric dissimilarity data. Structural Equation Modeling: A Multidisciplinary Journal, 21(1), 54--62. 
}
\author{
Patrick Mair, Jose Fernando Vera
}

\examples{
## asymmetric model 
fit2way <- semds(Miller)
fit2way
summary(fit2way)
plot(fit2way)


## asymmetric model (saturated)
fit2wayS <- semds(Miller, saturated = TRUE)
fit2wayS
fit2wayS$theta

## general three-way model
fitmway <- semds(BrahmsNorm)
fitmway
summary(fitmway)
plot(fitmway)

}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ models }
