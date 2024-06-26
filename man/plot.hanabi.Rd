% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Richness.R
\name{plot.hanabi}
\alias{plot.hanabi}
\alias{points.hanabi}
\alias{lines.hanabi}
\title{Plotting Hanabi objects}
\usage{
\method{plot}{hanabi}(
  x,
  alpha = 0.5,
  col = "black",
  xlab = "Total counts",
  ylab = "Unique features",
  main = "Hanabi plot",
  pch = 1,
  ...
)

\method{points}{hanabi}(x, ...)

\method{lines}{hanabi}(x, ...)
}
\arguments{
\item{x}{The hanabi object to plot.}

\item{alpha}{The alpha transparency of the plot lines.}

\item{col}{A vector indicating a color per sample (or a vector that
can be recycled that way).}

\item{xlab}{Horizontal axis label.}

\item{ylab}{Vertical axis label.}

\item{main}{Plot title.}

\item{pch}{Plot character at the tip of the lines.}

\item{...}{Other parameters passed to the generic plot, points or lines functions.}
}
\description{
S3 method to plot hanabi objects.  Used by the
\code{\link{hanabiPlot}} function.
}
\seealso{
Other CAGEr richness functions: 
\code{\link{hanabi}},
\code{\link{hanabiPlot}()}
}
\author{
Charles Plessy
}
\concept{CAGEr richness functions}
