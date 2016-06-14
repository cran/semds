\name{BrahmsNorm}
\alias{BrahmsNorm}
\docType{data}
\title{Brahm's Compositions}
\description{
A few seconds from recordings of each of 15 musical compositions by Brahms were the stimuli for a study involving 10
McGill undergraduates. The 105 possible unordered pairs of these pieces of music were transcribed to tape and each
student was required to judge the dissimilarity for each pair. The judgements were ratings on an ordered category
rating scale having 25 numbered categories with the lowest category labelled "extremely similar" and the largest
category labelled "extremely different". Thus each judgement was transcribed as an integer from 1 to 25. 
Here we give a normalized version of the data. 
}
\usage{data(BrahmsNorm)}
\format{
  A list of length 10 (10 students). Each list element contains a lower triangular matrix with 
  entries reflecting dissimalities between Brahm's 15 compositions. 
}

\references{
Ramsay, J. O. (1982). Some statistical approaches to multidimensional scaling data. Journal of the Royal Statistical Society, 
Series A, 145, 285--312. 
}
\examples{
data(BrahmsNorm)
}
\keyword{datasets}
