% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ExportMethods.R
\name{plotReverseCumulatives}
\alias{plotReverseCumulatives}
\alias{plotReverseCumulatives,CAGEexp-method}
\alias{plotReverseCumulatives,GRangesList-method}
\alias{plotReverseCumulatives,GRanges-method}
\title{Plot reverse cumulative number of CAGE tags per CTSS}
\usage{
plotReverseCumulatives(
  object,
  values = c("raw", "normalized"),
  fitInRange = c(10, 1000),
  group = NULL
)

\S4method{plotReverseCumulatives}{CAGEexp}(
  object,
  values = c("raw", "normalized"),
  fitInRange = c(10, 1000),
  group = NULL
)

\S4method{plotReverseCumulatives}{GRangesList}(
  object,
  values = c("raw", "normalized"),
  fitInRange = c(10, 1000),
  group = NULL
)

\S4method{plotReverseCumulatives}{GRanges}(
  object,
  values = c("raw", "normalized"),
  fitInRange = c(10, 1000),
  group = NULL
)
}
\arguments{
\item{object}{A \code{CAGEexp} object}

\item{values}{Plot \code{raw} CAGE tag counts (default) or \code{normalized} values.}

\item{fitInRange}{An integer vector with two values specifying a range of tag
count values to be used for fitting a power-law distribution to reverse
cumulatives.  Ignored is set to \code{NULL}.  See Details.}

\item{group}{The name of a column data of the \code{CAGEexp} object, to be used
to facet the plot.  If \code{NULL} (default), all the distributions will be
plotted together.  Set to \code{sampleLabels} to plot each sample separately.}
}
\value{
A \code{\link[ggplot2:ggplot]{ggplot2::ggplot}} object containing the plots.  The plot can
be further modified to change its title or axis labels (see
\code{\link[ggplot2:labs]{ggplot2::labs}}).  The legend can be removed with
\code{\link[ggplot2:guides]{ggplot2::guides}}\code{(col=FALSE)}.
}
\description{
Plots the reverse cumulative distribution of the expression values of the
CTSS for all CAGE datasets present in the \code{\link{CAGEexp}} object.  The horizontal
axis represents an expression value and the vertical axis represents the
number of CTSS positions supported by >= of that value.  The plot uses a
log-log scale.  Use these plots as help in choosing the parameters range of
values and the referent slope for power-law normalization
(Balwierz \emph{et al}., 2009).
}
\details{
A power law distribution is fitted to each reverse cumulative using the
values in the range specified \code{fitInRange}.  The fitted distribution is
defined by \deqn{y = -1 * alpha * x + beta} on the log-log scale, and the
value of \emph{alpha} for each sample is shown on the plot's legend.  In addition,
a suggested referent power law distribution to which all samples could be
normalized is drawn on the plot and corresponding parameters (slope \emph{alpha}
and total number of tags \emph{T}) are denoted on the plot.  This referent
distribution is chosen so that its slope (\emph{alpha}) is the median of slopes
fitted to individual samples and its total number of tags (\emph{T}) is the power
of 10 nearest to the median number of tags of individual samples.  Resulting
plots are helpful in deciding whether power-law normalization is appropriate
for given samples and reported \code{alpha} values aid in choosing optimal
\emph{alpha} value power law normalization (see \code{\link{normalizeTagCount}} for details).
}
\examples{
exampleCAGEexp <- setColors(exampleCAGEexp,
  c("salmon", "darkkhaki", "darkturquoise", "blueviolet", "blueviolet"))
exampleCAGEexp$grp <- c("a", "b", "b", "c", "c")
plotReverseCumulatives( exampleCAGEexp, fitInRange = c(5,100))
plotReverseCumulatives( exampleCAGEexp, values = "normalized"
                      , fitInRange = c(200, 2000), group = "sampleLabels")
plotReverseCumulatives( exampleCAGEexp[,4:5], fitInRange = c(5,100)) +
  ggplot2::ggtitle("prim6 replicates")
tagClustersGR(exampleCAGEexp) |> plotReverseCumulatives()

}
\references{
Balwierz \emph{et al}. (2009) Methods for analyzing deep sequencing
expression data: constructing the human and mouse promoterome with deepCAGE data,
\emph{Genome Biology} \strong{10}(7):R79. \url{https://doi.org/10.1186/gb-2009-10-7-r79}
}
\seealso{
\code{\link{normalizeTagCount}}

Other CAGEr plot functions: 
\code{\link{TSSlogo}()},
\code{\link{hanabiPlot}()},
\code{\link{plotAnnot}()},
\code{\link{plotCorrelation}()},
\code{\link{plotExpressionProfiles}()},
\code{\link{plotInterquantileWidth}()}

Other CAGEr normalised data functions: 
\code{\link{normalizeTagCount}()}
}
\author{
Vanja Haberle (original work)

Charles Plessy (port to ggplot2)
}
\concept{CAGEr normalised data functions}
\concept{CAGEr plot functions}
