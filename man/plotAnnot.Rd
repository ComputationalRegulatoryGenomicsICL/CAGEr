% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Annotations.R
\docType{methods}
\name{plotAnnot}
\alias{plotAnnot}
\title{Plot annotation statistics}
\usage{
plotAnnot(x, scope, title, group = "default", customScope = NULL,
  normalise = TRUE)
}
\arguments{
\item{x}{An object from which can be extracted a table with columns named
\code{promoter}, \code{exon}, \code{intron}, \code{mapped},
\code{extracted}, \code{rdna}, and \code{tagdust}, that will be passed
to the \code{mapStats} function.}

\item{scope}{The value on which to normalise (see the plotAnnot vignette).}

\item{title}{The title of the plot.}

\item{group}{A factor to group the samples, or the name of a \code{colData}
column of a \code{CAGEexp} object.}

\item{customScope}{A function passed to the internal function \code{\link{mapStats}}
for the definition of custom scopes.}

\item{normalise}{Whether to normalise or not. Default: TRUE.}
}
\description{
Plot maping statistics of an object containing mapping statistics in
counts as percentages in stacked barplots.

Stacked barplots with error bars inspired from
<http://stackoverflow.com/questions/10417003/stacked-barplot-with-errorbars-using-ggplot2>.
See <http://www.biomedcentral.com/1471-2164/14/665/figure/F1> for example.
}
\examples{
ce <- readRDS(system.file(package = "CAGEr", "extdata/CAGEexp.rds"))
gff <- readRDS(system.file("extdata/Zv9_annot.rds", package = "CAGEr"))
annotateCTSS(ce, gff)
p <- plotAnnot(ce, 'counts', 'Here is the title')
print(p)
p + ggplot2::theme_bw()
ggplot2::theme_set(ggplot2::theme_bw()) ; p
plotAnnot(ce, 'counts', 'Same, non-normalised', normalise = FALSE)
ce$myGroups <- c("A", "A", "B", "B", "C")
plotAnnot(ce, 'counts', group = "myGroups")

}
\seealso{
Other CAGEr annotation functions: \code{\link{annotateCTSS}},
  \code{\link{ranges2annot}}, \code{\link{ranges2genes}}

Other CAGEr plot functions: \code{\link{hanabiPlot}},
  \code{\link{plotCorrelation}}
}
\author{
Charles Plessy
}