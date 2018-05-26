\name{SBanks2008D}
\alias{SBanks2008D}
\alias{SBanks2012D}
\docType{data}
\title{Spanish Bank Crisis}
\description{
Data are taken from Sagarra et al. (2018) involving 15 Spanish Banks in 2008 and 2012. Dissimilarities are computed by a reverse transformation of Chen's commonality index for studying branch rivalry. The rows reflect the recipients of competitive pressure, the columns the creators of rivalry. The larger a dissimilarity value, the lower the competition. 
}
\usage{
data(SBanks2008D)
data(SBanks2012D)
}
\format{
  Two asymmetric dissimilarity matrices (2008 and 2012) with 15 Spanish banks in the rows and columns.
}

\references{
Sagarra, M., Busing, F. M. T. A., Mar-Molinero, C., & Rialp, J. (2018). Assessing the asymmetric effects on branch rivalry of spanish financial sector restructuring. Advances in Data Analysis and Classification, 12 , 131-153.
}
\examples{
data(SBanks2008D)
str(SBanks2008D)

data(SBanks2012D)
str(SBanks2012D)
}
\keyword{datasets}
