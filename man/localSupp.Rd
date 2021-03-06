% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/localSupp.R
\docType{methods}
\name{localSupp}
\alias{localSupp}
\alias{localSupp,ANY-method}
\alias{localSupp,sdcMicroObj-method}
\alias{localSupp-methods}
\title{Local Suppression}
\usage{
localSupp(obj, threshold = 0.15, keyVar, ...)
}
\arguments{
\item{obj}{object of class freqCalc or sdcMicroObj}

\item{threshold}{threshold for individual risk}

\item{keyVar}{Variable on which some values might be suppressed}

\item{...}{see arguments below
\itemize{
\item{indivRisk}{object from class indivRisk}}}
}
\value{
Manipulated data with suppressions or the \code{\link{sdcMicroObj-class}}
object with manipulated data.
}
\description{
A simple method to perfom local suppression.
}
\details{
Values of high risk (above the threshold) of a certain variable (parameter
keyVar) are suppressed.
}
\section{Methods}{
 \describe{
\item{list("signature(obj = \"sdcMicroObj\")")}{}
\item{list("signature(obj = \"ANY\")")}{}}
}
\examples{
## example from Capobianchi, Polettini and Lucarelli:
data(francdat)
f <- freqCalc(francdat, keyVars=c(2,4,5,6),w=8)
f
f$fk
f$Fk
## individual risk calculation:
indivf <- indivRisk(f)
indivf$rk
## Local Suppression
localS <- localSupp(f, keyVar=2, indivRisk=indivf$rk, threshold=0.25)
f2 <- freqCalc(localS$freqCalc, keyVars=c(4,5,6), w=8)
indivf2 <- indivRisk(f2)
indivf2$rk
## select another keyVar and run localSupp once again,
# if you think the table is not fully protected


## for objects of class sdcMicro:
data(testdata2)
sdc <- createSdcObj(testdata2,
  keyVars=c('urbrur','roof','walls','water','electcon','relat','sex'),
  numVars=c('expend','income','savings'), w='sampling_weight')
sdc <- localSupp(sdc, keyVar='urbrur')
}
\author{
Matthias Templ
}
\references{
Templ, M. \emph{Statistical Disclosure Control for Microdata
Using the R-Package sdcMicro}, Transactions on Data Privacy, vol. 1, number
2, pp. 67-85, 2008. \url{http://www.tdp.cat/issues/abs.a004a08.php}
}
\seealso{
\code{\link{freqCalc}}, \code{\link{indivRisk}}
}
\keyword{manip}

