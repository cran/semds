\name{AvaRegions}
\alias{AvaRegions}
\alias{alpD}
\alias{tlD}
\alias{btlD}
\docType{data}
\title{Avalanche Problems Across Canadian Mountain Regions}
\description{
Contains dissimilarity matrices across mountain regions in British Columbia and BC for each of the 13 avalanche problems. The extended Dice coefficient was used on problem prevalences in order to compute the dissimilarities. This computation was carried out for each elevation band (alpine, treeline, below treeline) separately. 
}
\usage{data(AvaRegions)}
\format{For each elevation band a list of dissimilarity matrices is provided for the following avalanche problems: 
\describe{
 \item{\code{DeepP}}{Deep persistent slab}
 \item{\code{Ldry}}{Loose dry avalanche}
 \item{\code{Lwet}}{Loose wet & persistent slab}
 \item{\code{NoProbs}}{No avalanche problems}
 \item{\code{Pers}}{Persistent slab}
 \item{\code{PersPlus}}{Persistent slab plus}
 \item{\code{Spring}}{Spring-like}
 \item{\code{Storm}}{Storm slab}
 \item{\code{StormDeepP}}{Storm & deep persistent slab}
 \item{\code{StormPers}}{Storm & persistent slab}
 \item{\code{StormWind}}{Storm & wind slab}
 \item{\code{StormWindPers}}{Storm, wind, & persistent slab}
 \item{\code{Wind}}{Wind slab}
}
}

\note{
Thanks to Pascal Haegeli from SFU for sharing this dataset. 
}
\examples{
data(AvaRegions)
str(alpD)             ## alpine
str(tlD)              ## treeline 
str(btlD)             ## below treeline
}
\keyword{datasets}
