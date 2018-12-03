\name{Miller}
\alias{Miller}
\docType{data}
\title{Perceptual Confusion Data}
\description{
Miller and Nicely (1955) data of perceptual confusions between 16 English consonant phonemes.In this test, female subjects listened to female speakers reading consonant-vowel syllables formed by pairing the consonants with the vowel "a" (as in father), and the subjects were required to write down the consonant they heard after each syllable was spoken. The confusions or errors of identification matrices were compiled under 17 different experimental conditions.
The first four 16 x 16 tables given summarize the data obtained when noise-masking conditions produced varying speech-to-noise (S/N) ratios, with the addition of random noise at different levels. The original similarities were transformed into dissimilarities by considering the normalization procedure described
by Hubert (1972) for this data set.
}
\usage{data(Miller)}
\format{
  An asymmetric dissimilarity matrix. "th1" refers to the "th" as in "thy"; "th2" to the "th" as in "thigh"; "ti" refers to the "ti" as in "dilution".
}

\references{
Miller, G. A., & Nicely, P. E. (1955). An analysis of perceptual confusions among some English consonants. The Journal of the Acoustic Society of America, 27, 338--352.

Hubert, L. (1972). Some extensions of Johnson's hierarchical clustering algorithms. Psychometrika, 37, 261--274.

Vera, J. F. & Rivera, C. D. (2014). A structural equation multidimensional scaling model for one-mode asymmetric dissimilarity data. Structural Equation Modeling: A Multidisciplinary Journal, 21(1), 54--62. 
}
\examples{
data(Miller)
}
\keyword{datasets}
