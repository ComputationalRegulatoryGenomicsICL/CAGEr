% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Paraclu.R
\name{paraclu}
\alias{paraclu}
\alias{paraclu,Pairs-method}
\alias{paraclu,CTSS-method}
\alias{paraclu,GRanges-method}
\alias{paraclu,SummarizedExperiment-method}
\title{Parametric clustering}
\usage{
paraclu(
  object,
  minStability = 1,
  maxLength = 500,
  removeSingletons = FALSE,
  keepSingletonsAbove = Inf,
  reduceToNonoverlapping = TRUE,
  useMulticore = FALSE,
  nrCores = NULL
)

\S4method{paraclu}{Pairs}(
  object,
  minStability = 1,
  maxLength = 500,
  removeSingletons = FALSE,
  keepSingletonsAbove = Inf,
  reduceToNonoverlapping = TRUE,
  useMulticore = FALSE,
  nrCores = NULL
)

\S4method{paraclu}{CTSS}(
  object,
  minStability = 1,
  maxLength = 500,
  removeSingletons = FALSE,
  keepSingletonsAbove = Inf,
  reduceToNonoverlapping = TRUE,
  useMulticore = FALSE,
  nrCores = NULL
)

\S4method{paraclu}{GRanges}(
  object,
  minStability = 1,
  maxLength = 500,
  removeSingletons = FALSE,
  keepSingletonsAbove = Inf,
  reduceToNonoverlapping = TRUE,
  useMulticore = FALSE,
  nrCores = NULL
)

\S4method{paraclu}{SummarizedExperiment}(
  object,
  minStability = 1,
  maxLength = 500,
  removeSingletons = FALSE,
  keepSingletonsAbove = Inf,
  reduceToNonoverlapping = TRUE,
  useMulticore = FALSE,
  nrCores = NULL
)
}
\arguments{
\item{object}{A \code{\link{CTSS}}, or a \code{\link[S4Vectors:Pairs-class]{S4Vectors::Pairs}} object with positions
\emph{first} and scores \emph{second}.}

\item{minStability}{Minimal stability of the cluster, where stability is
defined as ratio between maximal and minimal density value for which
this cluster is maximal scoring.  For definition of stability refer to
Frith \emph{et al.}, Genome Research, 2007.  Clusters with stability
\verb{< minStability} will be discarded.}

\item{maxLength}{Maximal length of cluster in base-pairs.  Clusters with length
\verb{> maxLength} will be discarded.}

\item{removeSingletons}{Logical indicating if tag clusters containing only
one CTSS be removed.}

\item{keepSingletonsAbove}{Controls which singleton tag clusters will be
removed.  When \code{removeSingletons = TRUE}, only singletons with signal
\verb{< keepSingletonsAbove} will be removed.  Useful to prevent removing
highly supported singleton tag clusters.  Default value \code{Inf} results
in removing all singleton TCs when \code{removeSingletons = TRUE}.}

\item{reduceToNonoverlapping}{Logical, should smaller clusters contained
within bigger cluster be removed to make a final set of tag clusters
non-overlapping.}

\item{useMulticore}{Logical, should multicore be used.  \code{useMulticore = TRUE}
has no effect on non-Unix-like platforms.}

\item{nrCores}{Number of cores to use when \code{useMulticore = TRUE}.  Default
value \code{NULL} uses all detected cores.}
}
\value{
Running Paraclu on a \code{Pairs} object containing positions and scores
returns an \code{IRanges} object containing the start and end positions of the
clusters, as well as the minimum and maximum density in \code{min_d} and \code{max_d}
metadata columns.

Running Paraclu on a \code{CTSS} object dispatches the computation on each strand
of each sequence level of the object, collects the \code{IRanges} and assemble
them back in a \code{\link{TagClusters}} object after filtering them by size and by
expression following the \code{minStability}, \code{maxLength}, \code{removeSingletons},
\code{keepSingletonsAbove} and \code{reduceToNonoverlapping} parameters.

Running Paraclu on a \code{\link{RangedSummarizedExperiment}} object will loop on each
sample, and return the results as a \code{\link{GRangesList}} of \code{TagClusters}.
}
\description{
Implementation of Paraclu - parametric clustering of data attached to
sequences (\url{http://www.cbrc.jp/paraclu/}).
}
\examples{
(ctss <- CTSSnormalizedTpmGR(exampleCAGEexp,1))
(pair <- Pairs(pos(ctss), score(ctss)))
CAGEr:::.paraclu_params(first(pair), second(pair))
CAGEr:::.paraclu(first(pair)[1:10], second(pair)[1:10])
paraclu(pair[1:10])
paraclu(ctss[1:10])
paraclu(CTSStagCountSE(exampleCAGEexp)[1:25,])

}
\references{
MC Frith, E Valen, A Krogh, Y Hayashizaki, P Carninci, A Sandelin.  \emph{A code
for transcription initiation in mammalian genomes.}  Genome Research 2008
18(1):1-12)
}
\seealso{
Other CAGEr clustering methods: 
\code{\link{consensusClustersTpm}()},
\code{\link{distclu}()}
}
\concept{CAGEr clustering methods}
