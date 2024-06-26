% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Multicore.R
\name{CAGEr_Multicore}
\alias{CAGEr_Multicore}
\title{Multicore support in CAGEr}
\usage{
CAGEr_Multicore(useMulticore = FALSE, nrCores = NULL)
}
\arguments{
\item{useMulticore}{TRUE or FALSE}

\item{nrCores}{number of cores to use (leave \code{NULL} to let BiocParallel
choose).}
}
\value{
Returns either a \code{MulticoreParam} object or a
\code{SerialParam} object.
}
\description{
CAGEr is in the transition towards using the BiocParallel for
multicore parallelisation.  On Windows platforms, the multicore support
is disabled transparently, that is, attempts to use multiple cores are
silently ignored.
}
\examples{
CAGEr:::CAGEr_Multicore()
CAGEr:::CAGEr_Multicore(TRUE,)
CAGEr:::CAGEr_Multicore(TRUE,  2)
CAGEr:::CAGEr_Multicore(FALSE, 2)

}
\author{
Charles Plessy
}
